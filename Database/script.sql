
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
  `payment_status` enum('CANCEL','COMPLETED','PAID','REFUNDED','UNPAID') DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `pick_up_address` varchar(255) DEFAULT NULL,
  `points_earned` decimal(38,2) NOT NULL DEFAULT '0.00',
  `points_used` decimal(38,2) DEFAULT '0.00',
  `seat_number` varchar(255) DEFAULT NULL,
  `total_payment` decimal(38,2) DEFAULT NULL,
  `trip_id` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkp5ujmgvd2pmsehwpu2vyjkwb` (`trip_id`),
  KEY `FKrjob56yal18kk1mvwj2d2elki` (`username`),
  CONSTRAINT `FKkp5ujmgvd2pmsehwpu2vyjkwb` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`),
  CONSTRAINT `FKrjob56yal18kk1mvwj2d2elki` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `booking_cargo`;
CREATE TABLE `booking_cargo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` decimal(38,2) NOT NULL,
  `quantity` int NOT NULL,
  `booking_id` bigint NOT NULL,
  `cargo_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6ifbn2w0dpwsorxorvm2o3d95` (`booking_id`),
  KEY `FK761jdsr9i6tf9gxy5gkq3aoki` (`cargo_id`),
  CONSTRAINT `FK6ifbn2w0dpwsorxorvm2o3d95` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`),
  CONSTRAINT `FK761jdsr9i6tf9gxy5gkq3aoki` FOREIGN KEY (`cargo_id`) REFERENCES `cargo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `base_price` decimal(38,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `coach`;
CREATE TABLE `coach` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `capacity` int DEFAULT NULL,
  `coach_type` enum('BED','CHAIR','LIMOUSINE') DEFAULT NULL,
  `license_plate` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rgupf3gfwjyxhl148ua00f4un` (`license_plate`),
  UNIQUE KEY `UK_sjv06n7tt5gkpndfwlaer0dkj` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(38,2) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date_time` datetime(6) DEFAULT NULL,
  `start_date_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i14w897ofrtv43vbx44rtv01u` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
  UNIQUE KEY `UK_fchuyotq64tagkwktlh4qttyy` (`email`),
  UNIQUE KEY `UK_9yq25nknyh5y5gihylet1ypy9` (`license_number`),
  UNIQUE KEY `UK_phx4fa0f4397mg8kltbf7c2gy` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `district` varchar(255) DEFAULT NULL,
  `ward` varchar(255) DEFAULT NULL,
  `province_id` bigint DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKsc2eeog2gul5a5ctc1sub8k81` (`province_id`),
  CONSTRAINT `FKsc2eeog2gul5a5ctc1sub8k81` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `loyalty_transaction`;
CREATE TABLE `loyalty_transaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(38,2) DEFAULT NULL,
  `transaction_date` datetime(6) DEFAULT NULL,
  `transaction_type` enum('EARN','EXPIRE','USE') DEFAULT NULL,
  `booking_id` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1tauigo64nwpichfxp66qhjp2` (`booking_id`),
  KEY `FK1mqcqiujk08yan1doqjy2xfib` (`username`),
  CONSTRAINT `FK1mqcqiujk08yan1doqjy2xfib` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FK1tauigo64nwpichfxp66qhjp2` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `recipient_identifiers` varchar(255) DEFAULT NULL,
  `recipient_type` enum('ALL','GROUP','INDIVIDUAL') DEFAULT NULL,
  `send_date_time` datetime(6) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sender_username` varchar(255) DEFAULT NULL,
  `trip_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf6kkv92c81rhgis7n21br0946` (`sender_username`),
  KEY `FK5qb7kdu7bql8f6v75rrvi1i67` (`trip_id`),
  CONSTRAINT `FK5qb7kdu7bql8f6v75rrvi1i67` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`),
  CONSTRAINT `FKf6kkv92c81rhgis7n21br0946` FOREIGN KEY (`sender_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `payment_history`;
CREATE TABLE `payment_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `new_status` enum('CANCEL','COMPLETED','PAID','REFUNDED','UNPAID') DEFAULT NULL,
  `old_status` enum('CANCEL','COMPLETED','PAID','REFUNDED','UNPAID') DEFAULT NULL,
  `status_change_date_time` datetime(6) DEFAULT NULL,
  `booking_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK78c8n1i1pc83oleh4xdbm46d5` (`booking_id`),
  CONSTRAINT `FK78c8n1i1pc83oleh4xdbm46d5` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coach_rating` int DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `driver_rating` int DEFAULT NULL,
  `trip_rating` int DEFAULT NULL,
  `trip_id` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsdujhwxnw678xtqnvqre9gl3h` (`trip_id`),
  KEY `FK117o6riye2xefmyeaanbvdx1i` (`username`),
  CONSTRAINT `FK117o6riye2xefmyeaanbvdx1i` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FKsdujhwxnw678xtqnvqre9gl3h` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `role_code` enum('ROLE_ADMIN','ROLE_CREATE','ROLE_CUSTOMER','ROLE_DELETE','ROLE_READ','ROLE_STAFF','ROLE_UPDATE') DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expired` bit(1) NOT NULL,
  `revoked` bit(1) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_type` enum('BEARER') DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKofh3vp2yx7uo49ane1s4dh6g3` (`username`),
  CONSTRAINT `FKofh3vp2yx7uo49ane1s4dh6g3` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `trip`;
CREATE TABLE `trip` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `completed` bit(1) DEFAULT NULL,
  `departure_date_time` datetime(6) DEFAULT NULL,
  `duration` double DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `coach_id` bigint DEFAULT NULL,
  `dest_id` bigint DEFAULT NULL,
  `discount_id` bigint DEFAULT NULL,
  `driver_id` bigint DEFAULT NULL,
  `source_id` bigint DEFAULT NULL,
  `drop_off_location_id` bigint DEFAULT NULL,
  `pick_up_location_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_trip_fields` (`driver_id`,`coach_id`,`source_id`,`dest_id`,`departure_date_time`),
  KEY `FKxq0qrdn0xmupsnq4mlplprke` (`coach_id`),
  KEY `FK9qw6r3fpf34ldxj3febn4jiym` (`dest_id`),
  KEY `FKs3c683ds4ckyessv3l8optnmb` (`discount_id`),
  KEY `FK8ow8h4pjlljfdhlpbmh5lopyx` (`source_id`),
  KEY `FKrpos7pom0982eu50idqqapj5e` (`drop_off_location_id`),
  KEY `FKewkd28g7y2cisawfxv3i8dlsu` (`pick_up_location_id`),
  CONSTRAINT `FK8ow8h4pjlljfdhlpbmh5lopyx` FOREIGN KEY (`source_id`) REFERENCES `province` (`id`),
  CONSTRAINT `FK9qw6r3fpf34ldxj3febn4jiym` FOREIGN KEY (`dest_id`) REFERENCES `province` (`id`),
  CONSTRAINT `FKewkd28g7y2cisawfxv3i8dlsu` FOREIGN KEY (`pick_up_location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKpuhkx68hnwy4by2b0onybv5x1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`),
  CONSTRAINT `FKrpos7pom0982eu50idqqapj5e` FOREIGN KEY (`drop_off_location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FKs3c683ds4ckyessv3l8optnmb` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`),
  CONSTRAINT `FKxq0qrdn0xmupsnq4mlplprke` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `trip_log`;
CREATE TABLE `trip_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `log_time` datetime(6) DEFAULT NULL,
  `log_type` enum('BREAKDOWN','COMPLETED','INCIDENT','MAINTENANCE','OTHER') NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `trip_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhk8hmr33wodgtl2399eqgdi1f` (`created_by`),
  KEY `FKr063ik2s2h7wa5irgv8801vvc` (`trip_id`),
  CONSTRAINT `FKhk8hmr33wodgtl2399eqgdi1f` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`),
  CONSTRAINT `FKr063ik2s2h7wa5irgv8801vvc` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
  `loyalty_points` decimal(38,2) NOT NULL DEFAULT '0.00',
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UK_589idila9li6a4arw1t8ht1gx` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `user_notification`;
CREATE TABLE `user_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_deleted` bit(1) DEFAULT NULL,
  `is_read` bit(1) DEFAULT NULL,
  `read_date_time` datetime(6) DEFAULT NULL,
  `notification_id` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi5naecliicmigrk01qx5me5sp` (`notification_id`),
  KEY `FK53pjy9iwmuvp3t5ayl1muviso` (`username`),
  CONSTRAINT `FK53pjy9iwmuvp3t5ayl1muviso` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FKi5naecliicmigrk01qx5me5sp` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `user_permission`;
CREATE TABLE `user_permission` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `screen_code` varchar(255) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_role_screen` (`username`,`role_id`,`screen_code`),
  KEY `FKhgr5k8iik7jdokqjdeg8nkwm5` (`role_id`),
  CONSTRAINT `FK37krwnqotjma6n9hrjkdnj60n` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FKhgr5k8iik7jdokqjdeg8nkwm5` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
