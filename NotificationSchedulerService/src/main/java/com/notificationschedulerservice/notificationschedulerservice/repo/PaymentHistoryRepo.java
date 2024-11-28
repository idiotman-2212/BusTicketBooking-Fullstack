package com.notificationschedulerservice.notificationschedulerservice.repo;

import com.notificationschedulerservice.notificationschedulerservice.model.PaymentHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface PaymentHistoryRepo extends JpaRepository<PaymentHistory, Long> {

    @Query("SELECT ph FROM PaymentHistory ph " +
            "WHERE ph.newStatus = 'REFUND_PENDING' " +
            "AND ph.statusChangeDateTime < :thresholdTime")
    List<PaymentHistory> findPendingRefundsBefore(LocalDateTime thresholdTime);
}
