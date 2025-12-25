package com.ticketbooking.service.impl;

import com.ticketbooking.model.PaymentHistory;
import com.ticketbooking.repo.PaymentHistoryRepo;
import com.ticketbooking.service.PaymentHistoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PaymentHistoryServiceImpl implements PaymentHistoryService {
    private final PaymentHistoryRepo paymentHistoryRepo;

    @Override
    public List<PaymentHistory> findHistoriesByBookingId(Long bookingId) {
        var histories = paymentHistoryRepo
                .findAllByBookingId(bookingId);
        Collections.sort(histories, Comparator.comparing(PaymentHistory::getStatusChangeDateTime).reversed());
        return histories;
    }
    @Override
    public List<PaymentHistory> findAll() {
        return paymentHistoryRepo.findAll();
    }

    @Override
    public List<PaymentHistory> findAll(Integer page, Integer limit, String sortBy) {
        return null;
    }
}