-- Bảng user
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(255) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `loyalty_points` decimal(10, 2) DEFAULT 0.00, -- Cột tích xu
  PRIMARY KEY (`username`),
  UNIQUE KEY `UK_user_email` (`email`),
  UNIQUE KEY `UK_user_phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Bảng role
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `role_code` enum('ROLE_ADMIN','ROLE_CREATE','ROLE_CUSTOMER','ROLE_DELETE','ROLE_READ','ROLE_STAFF','ROLE_UPDATE') DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Bảng token
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expired` bit(1) NOT NULL,
  `revoked` bit(1) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_type` enum('BEARER') DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_token_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Bảng user_permission
DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE `user_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `screen_code` varchar(255) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_permission` (`username`,`role_id`,`screen_code`),
  CONSTRAINT `FK_user_permission_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FK_user_permission_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Bảng coach
DROP TABLE IF EXISTS `coach`;
CREATE TABLE `coach` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `capacity` int DEFAULT NULL,
  `coach_type` enum('BED','CHAIR','LIMOUSINE') DEFAULT NULL,
  `license_plate` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_coach_license_plate` (`license_plate`),
  UNIQUE KEY `UK_coach_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Bảng discount
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(38,2) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date_time` datetime(6) DEFAULT NULL,
  `start_date_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_discount_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Bảng driver
DROP TABLE IF EXISTS `driver`;
CREATE TABLE `driver` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `license_number` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `quit` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_driver_email` (`email`),
  UNIQUE KEY `UK_driver_license_number` (`license_number`),
  UNIQUE KEY `UK_driver_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Bảng province
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Bảng trip
DROP TABLE IF EXISTS `trip`;
CREATE TABLE `trip` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `departure_date_time` datetime(6) DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `coach_id` bigint DEFAULT NULL,
  `dest_id` bigint DEFAULT NULL,
  `discount_id` bigint DEFAULT NULL,
  `driver_id` bigint DEFAULT NULL,
  `source_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_trip` (`driver_id`,`coach_id`,`source_id`,`dest_id`,`departure_date_time`),
  CONSTRAINT `FK_trip_coach` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`),
  CONSTRAINT `FK_trip_dest` FOREIGN KEY (`dest_id`) REFERENCES `province` (`id`),
  CONSTRAINT `FK_trip_discount` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`),
  CONSTRAINT `FK_trip_driver` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`),
  CONSTRAINT `FK_trip_source` FOREIGN KEY (`source_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Bảng booking
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_date_time` datetime(6) DEFAULT NULL,
  `booking_type` enum('ONEWAY','ROUNDTRIP') DEFAULT NULL,
  `cust_first_name` varchar(255) DEFAULT NULL,
  `cust_last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `payment_date_time` datetime(6) DEFAULT NULL,
  `payment_method` enum('CARD','CASH') DEFAULT NULL,
  `payment_status` enum('CANCEL','PAID','UNPAID') DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `pick_up_address` varchar(255) DEFAULT NULL,
  `seat_number` varchar(255) DEFAULT NULL,
  `total_payment` decimal(38,2) DEFAULT NULL,
  `trip_id` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `points_earned` decimal(10, 2) DEFAULT 0.00, -- Điểm tích lũy
  `points_used` decimal(10, 2) DEFAULT 0.00, -- Điểm đã sử dụng
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_booking_trip` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`),
  CONSTRAINT `FK_booking_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Bảng payment_history
DROP TABLE IF EXISTS `payment_history`;
CREATE TABLE `payment_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `new_status` enum('CANCEL','PAID','UNPAID') DEFAULT NULL,
  `old_status` enum('CANCEL','PAID','UNPAID') DEFAULT NULL,
  `status_change_date_time` datetime(6) DEFAULT NULL,
  `booking_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_payment_history_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Bảng loyalty_transaction
DROP TABLE IF EXISTS `loyalty_transaction`;
CREATE TABLE `loyalty_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `amount` decimal(10, 2) NOT NULL,
  `transaction_date` datetime(6) NOT NULL,
  `transaction_type` enum('EARN', 'USE', 'EXPIRE') NOT NULL,
  `booking_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_loyalty_transaction_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FK_loyalty_transaction_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE Notification (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    trip_id BIGINT,
    message VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_read BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (username) REFERENCES `user` (username),
    FOREIGN KEY (trip_id) REFERENCES trip (id)
);

DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
DROP TABLE IF EXISTS `user_notification`;


CREATE TABLE `user_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `notification_id` bigint NOT NULL,
  `username` varchar(255) NOT NULL,
  `read` bit(1) DEFAULT 0, -- Trạng thái đã đọc
  `sent_at` datetime(6) DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_user_notification_notification` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`),
  CONSTRAINT `FK_user_notification_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

