package com.ticketbooking.service.impl;

import com.ticketbooking.dto.EmailMessage;
import com.ticketbooking.dto.NotificationDTO;
import com.ticketbooking.dto.NotificationRequest;
import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.exception.ResourceNotFoundException;
import com.ticketbooking.model.Booking;
import com.ticketbooking.model.Notification;
import com.ticketbooking.model.User;
import com.ticketbooking.model.UserNotification;
import com.ticketbooking.model.enumType.RecipientType;
import com.ticketbooking.repo.NotificationRepo;
import com.ticketbooking.repo.TripRepo;
import com.ticketbooking.repo.UserNotificationRepo;
import com.ticketbooking.repo.UserRepo;
import com.ticketbooking.service.MailService;
import com.ticketbooking.service.NotificationService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {

    private final MailService mailService;
    private final Environment env;
    private final NotificationRepo notificationRepo;
    private final UserNotificationRepo userNotificationRepo;
    private final UserRepo userRepo;
    private final TripRepo tripRepo;

//    @Override
//    public void sendSmsConfirmation(String phoneNumber, String source, String destination, String busInfo, String departureTime, String seatNumbers, BigDecimal totalPayment) {
//        String message = String.format(
//                "THÔNG TIN VÉ ĐẶT\n" +
//                        "Tuyến: %s => %s\n" +
//                        "Xe: %s\n" +
//                        "Ngày đi: %s\n" +
//                        "Ghế: %s\n" +
//                        "Giá vé: %s",
//                source, destination, busInfo, departureTime, seatNumbers,
//                NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(totalPayment)
//        );
//
//        // Chuyển đổi số điện thoại
//        if (phoneNumber != null && phoneNumber.startsWith("0")) {
//            phoneNumber = "+84" + phoneNumber.substring(1);
//        }
//
//        // Gửi SMS tới số điện thoại khách hàng
//        smsService.sendSms(phoneNumber, message);
//    }

    private String formatCurrencyVN(BigDecimal amount) {
        Locale localeVN = new Locale("vi", "VN");
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(localeVN);
        return currencyFormatter.format(amount);
    }

    @Override
    public void sendEmailConfirmation(String email, String source, String destination, String busInfo,
                                      String departureTime, String seatNumbers, BigDecimal totalPayment,
                                      String pickUpLocation, String dropOffLocation) {
        String emailContent = String.format(
                "Kính chào quý khách,\n\n" +
                        "Cảm ơn bạn đã đặt vé với chúng tôi. Dưới đây là thông tin chi tiết vé của bạn:\n\n" +
                        "Tuyến: %s => %s\n" +
                        "Xe: %s\n" +
                        "Ngày đi: %s\n" +
                        "Ghế: %s\n" +
                        "Địa điểm đón: %s\n" +
                        "Địa điểm trả: %s\n" +
                        "Giá vé: %s\n\n" +
                        "Chúng tôi hy vọng bạn sẽ có một chuyến đi vui vẻ.\n" +
                        "Trân trọng,\n" +
                        "Đội ngũ hỗ trợ khách hàng.",
                source, destination, busInfo, departureTime, seatNumbers,
                pickUpLocation, dropOffLocation, formatCurrencyVN(totalPayment)
        );

        EmailMessage emailMessage = EmailMessage.builder()
                .from(env.getProperty("spring.mail.username"))
                .to(email)
                .subject("Xác nhận đặt vé thành công")
                .text(emailContent)
                .build();

        mailService.send(emailMessage);
    }

    @Override
    public void sendRefundSuccessNotification(String email, String source, String destination, String busInfo,
                                String departureTime, String seatNumbers, BigDecimal totalPayment,
                                String pickUpLocation, String dropOffLocation) {
        String subject = "Hoàn tiền vé đặt thành công";
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
        //String confirmationLink = "http://localhost:3000/refund/confirm/" + booking.getId();
        String confirmationLink = env.getProperty("confirmation.link.url") + booking.getId();
        System.out.println("Confirmation Link: " + confirmationLink);
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

    @Override
    public List<Notification> findAll() {
        return notificationRepo.findAll();
    }

    @Override
    public Notification findById(Long id) {
        return notificationRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("Not found notification with id: " + id));
    }

    @Override
    @Cacheable(cacheNames = {"notifications_paging"}, key = "{#page, #limit}")
    public PageResponse<NotificationDTO> findAll(Integer page, Integer limit) {
        Page<Notification> pageSlice = notificationRepo.findAll(PageRequest.of(page, limit));
        List<NotificationDTO> notificationDTOs = pageSlice.getContent()
                .stream()
                .map(this::convertToDTO)
                .collect(Collectors.toList());
        PageResponse<NotificationDTO> pageResponse = new PageResponse<>();
        pageResponse.setDataList(notificationDTOs);
        pageResponse.setPageCount(pageSlice.getTotalPages());
        pageResponse.setTotalElements(pageSlice.getTotalElements());

        return pageResponse;
    }

    // Gửi thông báo từ admin
    @Override
    @CacheEvict(cacheNames = {"notifications_paging"}, allEntries = true)
    @Transactional
    public void sendNotification(NotificationRequest request) {
        String senderUsername = getCurrentUsername();
        User sender = userRepo.findByUsername(senderUsername)
                .orElseThrow(() -> new ResourceNotFoundException("Sender not found"));

        Notification notification = Notification.builder()
                .title(request.getTitle())
                .message(request.getMessage())
                .sendDateTime(LocalDateTime.now())
                .sender(sender)
                .recipientType(request.getRecipientType())
                .build();

        List<User> recipients = new ArrayList<>();

        if (request.getRecipientType() == RecipientType.ALL) {
            // Gửi cho tất cả người dùng
            recipients = userRepo.findAll();
            notification.setRecipientIdentifiers("ALL_USERS");
        } else if (request.getRecipientType() == RecipientType.GROUP) {
            // Gửi cho nhóm người dùng
            recipients = request.getRecipientIdentifiers().stream()
                    .map(username -> userRepo.findByUsername(username)
                            .orElseThrow(() -> new ResourceNotFoundException("User not found: " + username)))
                    .collect(Collectors.toList());
            notification.setRecipientIdentifiers(String.join(",", request.getRecipientIdentifiers()));
        } else if (request.getRecipientType() == RecipientType.INDIVIDUAL) {
            // Gửi cho một người dùng cụ thể
            if (request.getRecipientIdentifiers().size() == 1) {
                String username = request.getRecipientIdentifiers().get(0);
                User user = userRepo.findByUsername(username)
                        .orElseThrow(() -> new ResourceNotFoundException("User not found: " + username));
                recipients.add(user);
                notification.setRecipientIdentifiers(username);
            }
        }
        notificationRepo.save(notification);
        for (User user : recipients) {
            UserNotification userNotification = new UserNotification();
            userNotification.setNotification(notification);
            userNotification.setUser(user);
            userNotificationRepo.save(userNotification);
        }
    }

    @Override
    public List<NotificationDTO> getUnreadNotificationsForUser(String username) {
        List<UserNotification> unreadNotifications = userNotificationRepo.findByUser_UsernameAndIsDeletedFalseAndIsReadFalse(username);
        return unreadNotifications.stream()
                .map(userNotification -> convertToDTO(userNotification.getNotification()))
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"notifications_paging"}, allEntries = true)
    public List<NotificationDTO> getRecentNotificationsForUser(String username) {
        LocalDateTime sevenDaysAgo = LocalDateTime.now().minusDays(7);
        List<UserNotification> recentNotifications = userNotificationRepo.findRecentByUserAndNotDeleted(username, sevenDaysAgo);
        return recentNotifications.stream()
                .map(userNotification -> convertToDTO(userNotification.getNotification()))
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public void softDeleteNotification(Long notificationId, String username) {
        Optional<UserNotification> userNotificationOpt = userNotificationRepo.findFirstByNotificationIdAndUsername(notificationId, username);

        if (userNotificationOpt.isEmpty()) {
            throw new ResourceNotFoundException("Notification not found or already deleted");
        }
        UserNotification userNotification = userNotificationOpt.get();
        userNotification.setIsDeleted(true);
        userNotificationRepo.save(userNotification);
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"notifications_paging"}, allEntries = true)
    public List<NotificationDTO> getAllNotificationsForUser(String username) {
        List<UserNotification> userNotifications = userNotificationRepo.findByUser_UsernameAndNotDeleted(username);
        return userNotifications.stream()
                .map(userNotification -> convertToDTO(userNotification.getNotification())) // Chuyển đổi sang DTO
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"notifications_paging"}, allEntries = true)
    public long getUnreadNotificationCount(String username) {
        return userNotificationRepo.countUnreadNotifications(username);
    }
    @Override
    @Transactional
    public void markAsRead(Long notificationId, String username) {
        UserNotification userNotification = userNotificationRepo.findByNotification_IdAndUser_Username(notificationId, username)
                .orElseThrow(() -> new ResourceNotFoundException("Không tìm thấy thông báo với ID: " + notificationId + " cho người dùng: " + username));

        if (!userNotification.getIsRead()) {
            userNotification.setIsRead(true);
            userNotification.setReadDateTime(LocalDateTime.now());
            userNotificationRepo.save(userNotification);
        }
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"notifications_paging"}, allEntries = true)
    public void updateNotification(Long notificationId, NotificationRequest request) {
        // Lấy thông báo hiện tại từ cơ sở dữ liệu
        Notification notification = notificationRepo.findById(notificationId)
                .orElseThrow(() -> new ResourceNotFoundException("Notification not found with id: " + notificationId));

        // Cập nhật các thông tin cơ bản của thông báo
        notification.setTitle(request.getTitle());
        notification.setMessage(request.getMessage());
        notification.setSendDateTime(LocalDateTime.now());
        notification.setRecipientType(request.getRecipientType());

        List<User> recipients = new ArrayList<>();

        if (request.getRecipientType() == RecipientType.ALL) {
            recipients = userRepo.findAll();
            notification.setRecipientIdentifiers("ALL_USERS");
        } else if (request.getRecipientType() == RecipientType.GROUP) {
            recipients = request.getRecipientIdentifiers().stream()
                    .map(username -> userRepo.findByUsername(username)
                            .orElseThrow(() -> new ResourceNotFoundException("User not found: " + username)))
                    .collect(Collectors.toList());
            notification.setRecipientIdentifiers(String.join(",", request.getRecipientIdentifiers()));
        } else if (request.getRecipientType() == RecipientType.INDIVIDUAL) {
            if (request.getRecipientIdentifiers().size() == 1) {
                String username = request.getRecipientIdentifiers().get(0);
                User user = userRepo.findByUsername(username)
                        .orElseThrow(() -> new ResourceNotFoundException("User not found: " + username));
                recipients.add(user);
                notification.setRecipientIdentifiers(username);
            } else {
                throw new IllegalArgumentException("RecipientIdentifiers must contain exactly one user for INDIVIDUAL type.");
            }
        }
        userNotificationRepo.deleteByNotificationId(notification.getId());
        for (User user : recipients) {
            UserNotification userNotification = new UserNotification();
            userNotification.setNotification(notification);
            userNotification.setUser(user);
            userNotificationRepo.save(userNotification);
        }
        notificationRepo.save(notification);
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"notifications_paging"}, allEntries = true)
    public void deleteNotificationById(Long notificationId) {
        Notification notification = notificationRepo.findById(notificationId)
                .orElseThrow(() -> new ResourceNotFoundException("Notification not found with id: " + notificationId));
        userNotificationRepo.deleteByNotificationId(notification.getId());
        notificationRepo.delete(notification);
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"notifications_paging"}, allEntries = true)
    public void deleteAllNotifications() {
        userNotificationRepo.deleteAll();
        notificationRepo.deleteAll();
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"notifications_paging"}, allEntries = true)
    public List<UserNotification> getRecentNotifications(String username) {
        LocalDateTime sevenDaysAgo = LocalDateTime.now().minusDays(7);
        return userNotificationRepo.findByUser_UsernameAndNotification_SendDateTimeAfter(username, sevenDaysAgo);
    }

    public String getCurrentUsername() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getName();
    }

    private NotificationDTO convertToDTO(Notification notification) {
        return NotificationDTO.builder()
                .id(notification.getId())
                .title(notification.getTitle())
                .message(notification.getMessage())
                .sendDateTime(notification.getSendDateTime())
                .senderUsername(notification.getSender() != null ? notification.getSender().getUsername() : null)
                .recipientType(notification.getRecipientType().name())
                .recipientIdentifiers(notification.getRecipientIdentifiers())
                .tripId(notification.getTrip() != null ? notification.getTrip().getId() : null)
                .build();
    }
}
