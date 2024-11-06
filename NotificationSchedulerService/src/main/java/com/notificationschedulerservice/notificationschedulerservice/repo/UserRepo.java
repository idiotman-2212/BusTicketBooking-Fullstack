package com.notificationschedulerservice.notificationschedulerservice.repo;

import com.notificationschedulerservice.notificationschedulerservice.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepo extends JpaRepository<User, String> {
}
