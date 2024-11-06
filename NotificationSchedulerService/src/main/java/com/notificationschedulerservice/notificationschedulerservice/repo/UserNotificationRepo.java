package com.notificationschedulerservice.notificationschedulerservice.repo;

import com.notificationschedulerservice.notificationschedulerservice.model.UserNotification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserNotificationRepo extends JpaRepository<UserNotification, Long> {
}
