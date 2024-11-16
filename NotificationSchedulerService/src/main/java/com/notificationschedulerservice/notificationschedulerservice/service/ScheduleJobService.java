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

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ScheduleJobService{

    private final BookingRepo bookingRepo;
    private final NotificationRepo notificationRepo;
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
            sendNotificationAndMessages(booking, "Nhắc nhở thanh toán", message);
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

    // Phương thức chung để gửi thông báo, SMS và email
    private void sendNotificationAndMessages(Booking booking, String title, String message) {
        if (booking.getUser() == null) {
            System.out.println("Booking ID " + booking.getId() + " không có người dùng gắn liền, không thể gửi thông báo.");
            return;
        }

        // Tạo và lưu thông báo
        Notification notification = new Notification();
        notification.setTitle(title);
        notification.setMessage(message);
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

}
