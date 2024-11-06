package com.notificationschedulerservice.notificationschedulerservice.repo;

import com.notificationschedulerservice.notificationschedulerservice.model.PaymentHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentHistoryRepo extends JpaRepository<PaymentHistory, Long> {
}
