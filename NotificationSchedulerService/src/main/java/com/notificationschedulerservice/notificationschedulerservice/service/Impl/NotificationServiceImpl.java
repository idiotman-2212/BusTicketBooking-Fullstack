package com.notificationschedulerservice.notificationschedulerservice.service.Impl;

import com.notificationschedulerservice.notificationschedulerservice.model.Booking;
import com.notificationschedulerservice.notificationschedulerservice.model.EmailMessage;
import com.notificationschedulerservice.notificationschedulerservice.repo.NotificationRepo;
import com.notificationschedulerservice.notificationschedulerservice.service.MailService;
import com.notificationschedulerservice.notificationschedulerservice.service.NotificationService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {

    private final MailService mailService;
    private final Environment env;
    private final NotificationRepo notificationRepo;

    private String formatCurrencyVN(BigDecimal amount) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(localeVN);
        return currencyFormatter.format(amount);
    }

    @Override
    public void sendRefundSuccessNotification(String email, String source, String destination, String busInfo,
                                              String departureTime, String seatNumbers, BigDecimal totalPayment,
                                              String pickUpLocation, String dropOffLocation) {
        String subject = "Hoàn tiền vé đặt";
        String body = String.format("Kính gửi Quý khách,\n\nChúng tôi xin thông báo rằng vé của quý khách đã được hoàn tiền thành công. Dưới đây là thông tin chi tiết:\n" +
                        "Nơi đi: %s\nNơi đến: %s\nThông tin xe: %s\nThời gian khởi hành: %s\nSố ghế: %s\nĐịa điểm đón: %s\nĐịa điểm trả: %s\nTổng tiền hoàn lại: %s\n\nCảm ơn Quý khách đã sử dụng dịch vụ của chúng tôi!",
                source, destination, busInfo, departureTime, seatNumbers,
                pickUpLocation, dropOffLocation, formatCurrencyVN(totalPayment));

        EmailMessage emailMessage = EmailMessage.builder()
                .from(env.getProperty("spring.mail.username"))
                .to(email)
                .subject(subject)
                .text(body)
                .build();
        try {
            mailService.send(emailMessage);
            System.out.println("Email sent to " + email + " with subject: " + subject);
        } catch (Exception e) {
            System.err.println("Failed to send refund email: " + e.getMessage());
        }
    }

    @Override
    public void sendRefundConfirmationNotification(Booking booking) {
        String confirmationLink = "http://localhost:3000/refund/confirm/" + booking.getId();
        String emailContent = String.format(
                "Kính chào %s,\n\n" +
                        "Bạn đã yêu cầu hoàn tiền cho vé đặt của mình. Vui lòng nhấn vào liên kết dưới đây để xác nhận hoàn tiền:\n\n%s\n\n" +
                        "Nếu bạn không yêu cầu hoàn tiền, vui lòng bỏ qua email này hoặc liên hệ với chúng tôi.",
                booking.getCustFirstName(), confirmationLink
        );

        EmailMessage emailMessage = EmailMessage.builder()
                .from(env.getProperty("spring.mail.username"))
                .to(booking.getEmail())
                .subject("Xác nhận hoàn tiền vé đặt")
                .text(emailContent)
                .build();

        mailService.send(emailMessage);
    }
}
