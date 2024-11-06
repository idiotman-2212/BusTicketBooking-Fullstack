package com.notificationschedulerservice.notificationschedulerservice.repo;

import com.notificationschedulerservice.notificationschedulerservice.model.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NotificationRepo extends JpaRepository<Notification, Long> {
}
