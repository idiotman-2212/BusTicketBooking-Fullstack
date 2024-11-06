package com.notificationschedulerservice.notificationschedulerservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class NotificationSchedulerServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(NotificationSchedulerServiceApplication.class, args);
    }

}
