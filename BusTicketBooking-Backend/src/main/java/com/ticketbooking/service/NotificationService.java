package com.ticketbooking.service;

import com.ticketbooking.dto.NotificationDTO;
import com.ticketbooking.dto.NotificationRequest;
import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Booking;
import com.ticketbooking.model.Notification;
import com.ticketbooking.model.UserNotification;

import java.math.BigDecimal;
import java.util.List;

public interface NotificationService {
    //void sendSmsConfirmation(String phoneNumber, String source, String destination, String busInfo, String departureTime, String seatNumbers, BigDecimal totalPayment);

    void sendEmailConfirmation(String email, String source, String destination, String busInfo,
                               String departureTime, String seatNumbers, BigDecimal totalPayment,
                               String pickUpLocation, String dropOffLocation);

    void sendRefundSuccessNotification(String email, String source, String destination, String busInfo,
                         String departureTime, String seatNumbers, BigDecimal totalPayment,
                         String pickUpLocation, String dropOffLocation);

    void sendRefundConfirmationNotification(Booking booking);
    List<Notification> findAll();

    Notification findById(Long id);

    PageResponse<NotificationDTO> findAll(Integer page, Integer limit);

    void sendNotification(NotificationRequest request);

    List<NotificationDTO> getUnreadNotificationsForUser(String username);

    List<NotificationDTO> getAllNotificationsForUser(String username);

    long getUnreadNotificationCount(String username);

    void markAsRead(Long notificationId, String username);

    void updateNotification(Long notificationId, NotificationRequest request);

    void deleteAllNotifications();

    void deleteNotificationById(Long notificationId);

    List<UserNotification> getRecentNotifications(String username);

    List<NotificationDTO> getRecentNotificationsForUser(String username);

    void softDeleteNotification(Long notificationId, String username);
}
