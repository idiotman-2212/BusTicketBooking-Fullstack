package com.ticketbooking.controller;

import com.ticketbooking.dto.NotificationDTO;
import com.ticketbooking.dto.NotificationRequest;
import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.UserNotification;
import com.ticketbooking.service.NotificationService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/notifications")
@RequiredArgsConstructor
@Tag(name = "Notification Controller")
public class NotificationController {

    private final NotificationService notificationService;

    @GetMapping("/all")
    public ResponseEntity<?> findAll(){
        return ResponseEntity.ok(notificationService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> findById(@PathVariable Long id){
        return ResponseEntity.ok(notificationService.findById(id));
    }

    @GetMapping("/paging")
    public PageResponse<NotificationDTO> getPageOfDrivers(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "5") Integer limit) {
        return notificationService.findAll(page, limit);
    }

    @GetMapping("/unread")
    public ResponseEntity<List<NotificationDTO>> getUnreadNotifications(Authentication authentication) {
            String username = authentication.getName();
            List<NotificationDTO> unreadNotifications = notificationService.getUnreadNotificationsForUser(username);
            return ResponseEntity.ok(unreadNotifications);
        }

    // Lấy danh sách thông báo của người dùng
    @GetMapping("/user")
    public ResponseEntity<?> getUserNotifications(Authentication authentication) {
        String username = authentication.getName();
        return ResponseEntity.ok(notificationService.getAllNotificationsForUser(username));
    }

    @GetMapping("/unread-count")
    public ResponseEntity<Long> getUnreadNotificationCount(Authentication authentication) {
        String username = authentication.getName();
        return ResponseEntity.ok(notificationService.getUnreadNotificationCount(username));
    }

    @GetMapping("/recent")
    public ResponseEntity<List<NotificationDTO>> getRecentNotifications(Authentication authentication) {
        if (authentication == null || !authentication.isAuthenticated()) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(null);
        }

        String username = authentication.getName();
        // Gọi service để lấy danh sách thông báo trong vòng 7 ngày
        List<NotificationDTO> recentNotifications = notificationService.getRecentNotificationsForUser(username);
        return ResponseEntity.ok(recentNotifications);
    }


    // Đánh dấu thông báo là đã đọc
    @PostMapping("/{notificationId}/read")
    public ResponseEntity<?> markAsRead(@PathVariable Long notificationId, Authentication authentication) {
        if (authentication == null || !authentication.isAuthenticated()) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Bạn cần đăng nhập để đánh dấu thông báo này là đã đọc.");
        }

        String username = authentication.getName();
        // Gọi service để đánh dấu thông báo là đã đọc
        notificationService.markAsRead(notificationId, username);
        return ResponseEntity.ok().build();
    }

    // Admin gửi thông báo
    @PostMapping("/send")
    public ResponseEntity<?> sendNotification(@RequestBody NotificationRequest request) {
        notificationService.sendNotification(request);
        return ResponseEntity.ok("Notification sent successfully.");
    }

    @PutMapping("/{notificationId}")
    public ResponseEntity<?> updateNotification(
            @PathVariable Long notificationId,
            @RequestBody NotificationRequest request) {
        notificationService.updateNotification(notificationId, request);
        return ResponseEntity.ok("Notification updated successfully.");
    }

    @DeleteMapping("/user/{notificationId}")
    public ResponseEntity<?> softDeleteNotification(@PathVariable Long notificationId, Authentication authentication) {
        String username = authentication.getName();
        notificationService.softDeleteNotification(notificationId, username);
        return ResponseEntity.ok("Notification soft deleted");
    }

    @DeleteMapping("/all")
    public ResponseEntity<?> deleteAllNotifications() {
        notificationService.deleteAllNotifications();
        return ResponseEntity.ok("All notifications deleted successfully.");
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteNotificationById(@PathVariable Long id){
        notificationService.deleteNotificationById(id);
        return ResponseEntity.ok("Delete notification deleted successfully.");
    }
}
