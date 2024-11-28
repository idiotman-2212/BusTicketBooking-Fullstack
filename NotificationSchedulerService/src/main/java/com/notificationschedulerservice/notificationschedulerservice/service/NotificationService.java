package com.notificationschedulerservice.notificationschedulerservice.service;

import com.notificationschedulerservice.notificationschedulerservice.model.Booking;

import java.math.BigDecimal;

public interface NotificationService {
    void sendRefundSuccessNotification(String email, String source, String destination, String busInfo,
                                       String departureTime, String seatNumbers, BigDecimal totalPayment,
                                       String pickUpLocation, String dropOffLocation);

    void sendRefundConfirmationNotification(Booking booking);
}
