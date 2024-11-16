package com.ticketbooking.repo;

import com.ticketbooking.model.PaymentHistory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PaymentHistoryRepo extends JpaRepository<PaymentHistory, Long> {

    List<PaymentHistory> findAllByBookingId(Long id);
}
