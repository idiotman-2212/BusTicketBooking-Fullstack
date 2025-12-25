package com.ticketbooking.service;

import com.ticketbooking.model.PaymentHistory;

import java.util.List;

public interface PaymentHistoryService {

    List<PaymentHistory> findHistoriesByBookingId(Long bookingId);

    List<PaymentHistory> findAll();

    List<PaymentHistory> findAll(Integer page, Integer limit, String sortBy);

}
