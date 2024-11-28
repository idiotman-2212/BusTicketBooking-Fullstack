package com.notificationschedulerservice.notificationschedulerservice.service;

import com.notificationschedulerservice.notificationschedulerservice.model.*;
import com.notificationschedulerservice.notificationschedulerservice.model.enumType.PaymentStatus;
import com.notificationschedulerservice.notificationschedulerservice.model.enumType.RecipientType;
import com.notificationschedulerservice.notificationschedulerservice.repo.BookingRepo;
import com.notificationschedulerservice.notificationschedulerservice.repo.NotificationRepo;
import com.notificationschedulerservice.notificationschedulerservice.repo.PaymentHistoryRepo;
import com.notificationschedulerservice.notificationschedulerservice.repo.UserNotificationRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import jakarta.transaction.Transactional;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Locale;

@Service
@RequiredArgsConstructor
public class ScheduleJobService{

    private final BookingRepo bookingRepo;
    private final NotificationRepo notificationRepo;
    private final NotificationService notificationService;
    private final UserNotificationRepo userNotificationRepo;
//    private final SmsService smsService;
    private final MailService mailService;
    private final Environment env;
    private final PaymentHistoryRepo paymentHistoryRepo;

    // 1. Nhắc nhở thanh toán cho vé UNPAID trước 1 ngày khởi hành
    @Scheduled(cron = "0 0 * * * ?") // Chạy mỗi giờ
    public void remindUnpaidBookings() {
        System.out.println("remindUnpaidBookings() is running...");
        LocalDateTime reminderThreshold = LocalDateTime.now().plusHours(24);
        List<Booking> unpaidBookings = bookingRepo.findUnpaidBookingsBefore(reminderThreshold);
        System.out.println("Number of unpaid bookings found: " + unpaidBookings.size());

        for (Booking booking : unpaidBookings) {
            System.out.println("Unpaid booking ID: " + booking.getId() + " | Departure Time: " + booking.getTrip().getDepartureDateTime());
            String passengerName = booking.getCustFirstName() + " " + booking.getCustLastName();
            String message = String.format("Kính chào %s,\nVé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.", passengerName);
            sendNotificationAndMessages(booking, "Thanh toán vé đặt", message);
        }
    }

    // 2. Tự động hủy vé chưa thanh toán trước khi khởi hành
    @Scheduled(cron = "0 * * * * ?") // Chạy mỗi phút
    public void autoCancelUnpaidBookings() {
        System.out.println("autoCancelUnpaidBookings() is running...");
        LocalDateTime cancellationThreshold = LocalDateTime.now().plusHours(24);
        List<Booking> unpaidBookings = bookingRepo.findUnpaidBookingsBefore(cancellationThreshold);

        for (Booking booking : unpaidBookings) {
            PaymentStatus oldStatus = booking.getPaymentStatus();
            booking.setPaymentStatus(PaymentStatus.CANCEL);
            bookingRepo.save(booking);

            // Lưu lịch sử thanh toán
            paymentHistoryRepo.save(PaymentHistory.builder()
                    .oldStatus(oldStatus)
                    .newStatus(PaymentStatus.CANCEL)
                    .statusChangeDateTime(LocalDateTime.now())
                    .booking(booking)
                    .build());

            String passengerName = booking.getCustFirstName() + " " + booking.getCustLastName();
            String message = String.format("Kính chào %s,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.", passengerName);
            sendNotificationAndMessages(booking, "Vé đặt đã bị hủy", message);
        }
    }

    // 3. Nhắc nhở vé đã thanh toán về thời gian khởi hành
    @Scheduled(cron = "0 0 9 * * ?") // Chạy lúc 9 giờ sáng hàng ngày
    public void remindPaidBookingsForDeparture() {
        System.out.println("remindPaidBookingsForDeparture() is running...");
        LocalDateTime reminderThreshold = LocalDateTime.now().plusDays(1);
        List<Booking> paidBookings = bookingRepo.findPaidBookingsBefore(reminderThreshold);

        for (Booking booking : paidBookings) {
            String passengerName = booking.getCustFirstName() + " " + booking.getCustLastName();
            String departureTime = booking.getTrip().getDepartureDateTime().toString();
            String message = String.format("Kính chào %s,\nChuyến xe của quý khách sẽ khởi hành vào %s.", passengerName, departureTime);
            sendNotificationAndMessages(booking, "Nhắc nhở khởi hành", message);
        }
    }

    //4. Chuyển đổi từ refund_pending sang refunded
    @Transactional
    @Scheduled(cron = "0 */15 * * * ?") // Chạy mỗi 15 phút
    public void autoConfirmRefunds() {
        // Tính toán thời điểm 24 giờ trước
        LocalDateTime thresholdTime = LocalDateTime.now().minusHours(24);

        // Lấy danh sách các bản ghi REFUND_PENDING trước 24 giờ
        List<PaymentHistory> refundHistories = paymentHistoryRepo.findPendingRefundsBefore(thresholdTime);

        for (PaymentHistory history : refundHistories) {
            Booking booking = history.getBooking();

            // Kiểm tra trạng thái hiện tại của booking
            if (booking.getPaymentStatus() == PaymentStatus.REFUND_PENDING) {
                // Cập nhật trạng thái sang REFUNDED
                booking.setPaymentStatus(PaymentStatus.REFUNDED);
                bookingRepo.save(booking);

                // Thêm bản ghi lịch sử thanh toán
                paymentHistoryRepo.save(PaymentHistory.builder()
                        .booking(booking)
                        .oldStatus(PaymentStatus.REFUND_PENDING)
                        .newStatus(PaymentStatus.REFUNDED)
                        .statusChangeDateTime(LocalDateTime.now())
                        .build());

                // Gửi email thông báo hoàn tiền
                sendRefundCompletedEmail(booking);

                System.out.println("Auto-refunded booking ID: " + booking.getId());
            } else {
                // Ghi log trạng thái không hợp lệ
                System.out.println("Booking ID " + booking.getId() + " is not in REFUND_PENDING state. Skipping...");
            }
        }
    }

    // Phương thức chung để gửi thông báo, SMS và email
    private void sendNotificationAndMessages(Booking booking, String title, String message) {
        if (booking.getUser() == null) {
            System.out.println("Booking ID " + booking.getId() + " không có người dùng gắn liền, không thể gửi thông báo.");
            return;
        }
        Trip trip = booking.getTrip();
        String sỏurce = trip != null ? trip.getSource().getName() : "Chuyến đi không xác định";
        String destination = trip != null ? trip.getDestination().getName() : "Chuyến đi không xác định";
        String departureTime = trip != null ? trip.getDepartureDateTime().toString() : "Không có thông tin";
        String pickUpLocation = trip != null && trip.getPickUpLocation() != null ? trip.getPickUpLocation().getAddress() : "Không có thông tin địa điểm đón";
        String dropOffLocation = trip != null && trip.getDropOffLocation() != null ? trip.getDropOffLocation().getAddress() : "Không có thông tin địa điểm trả";
        String seatNumbers = booking.getSeatNumber() != null ? booking.getSeatNumber() : "Không có thông tin ghế";
        String price = booking.getTotalPayment() != null ? NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(booking.getTotalPayment()) : "Không có thông tin giá";

        // Thông báo chi tiết với đầy đủ thông tin
        String detailedMessage = String.format(
                "%s\n\nThông tin chuyến đi:\n" +
                        "- Tuyến: %s\n" +
                        "- Giờ khởi hành: %s\n" +
                        "- Địa điểm đón: %s\n" +
                        "- Địa điểm trả: %s\n" +
                        "- Chỗ ngồi: %s\n" +
                        "- Giá vé: %s\n",
                message, sỏurce, destination, departureTime, pickUpLocation, dropOffLocation, seatNumbers, price
        );


        // Tạo và lưu thông báo
        Notification notification = new Notification();
        notification.setTitle(title);
        notification.setMessage(detailedMessage);
        notification.setSendDateTime(LocalDateTime.now());
        notification.setRecipientType(RecipientType.INDIVIDUAL);
        notification.setRecipientIdentifiers(booking.getUser().getUsername());
        notification.setSender(User.builder().username("system").build()); // Người gửi là "system"
        notificationRepo.save(notification);

        // Tạo UserNotification
        UserNotification userNotification = new UserNotification();
        userNotification.setNotification(notification);
        userNotification.setUser(booking.getUser());
        userNotification.setIsRead(false);
        userNotificationRepo.save(userNotification);
/*
        // Gửi SMS
        smsService.sendSms(booking.getPhone(), message);

        // Gửi Email
        String emailContent = "Kính chào quý khách, " + message;
        mailService.send(new EmailMessage(env.getProperty("spring.mail.username"),
                booking.getEmail(),
                title,
                emailContent));

 */
    }

    private void sendRefundCompletedEmail(Booking booking) {
        String source = booking.getTrip().getSource().getName();
        String destination = booking.getTrip().getDestination().getName();
        String busInfo = booking.getTrip().getCoach().getName();
        String departureTime = booking.getTrip().getDepartureDateTime().toString();
        String seatNumbers = booking.getSeatNumber();
        BigDecimal totalPayment = booking.getTotalPayment();
        String pickUpLocation = booking.getTrip().getPickUpLocation().getName();
        String dropOffLocation = booking.getTrip().getDropOffLocation().getName();

        notificationService.sendRefundSuccessNotification(
                booking.getEmail(),
                source,
                destination,
                busInfo,
                departureTime,
                seatNumbers,
                totalPayment,
                pickUpLocation,
                dropOffLocation
        );
    }

}
