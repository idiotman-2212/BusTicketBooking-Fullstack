CREATE database BusTicketBooking;
Use BusTicketBooking;
drop database BusTicketBooking;



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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `base_price` decimal(38,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `coach`;
CREATE TABLE `coach` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `capacity` int DEFAULT NULL,
  `coach_type` enum('BED','CHAIR','LIMOUSINE') DEFAULT NULL,
  `license_plate` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rgupf3gfwjyxhl148ua00f4un` (`license_plate`),
  UNIQUE KEY `UK_sjv06n7tt5gkpndfwlaer0dkj` (`name`),
  KEY `idx_name` (`name`),
  KEY `idx_id` (`id`),
  KEY `idx_license_plate` (`license_plate`),
  KEY `idx_coach_type` (`coach_type`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `coach` WRITE;
INSERT INTO `coach` VALUES (1,29,'BED','77-C1 36840','Bus no.1'),(2,40,'BED','77-C1 40792','Bus no.2'),(3,22,'LIMOUSINE','77-C1 26266','Bus no.3'),(4,29,'BED','77-C1 29039','Bus no.4'),(5,29,'BED','77-C1 53124','Bus no.5'),(6,29,'CHAIR','77-C1 46204','Bus no.6'),(7,34,'CHAIR','77-C1 15022','Bus no.7'),(8,29,'CHAIR','77-C1 31634','Bus no.8'),(9,29,'CHAIR','77-C1 27494','Bus no.9'),(10,29,'CHAIR','77-C1 42382','Bus no.10'),(11,34,'LIMOUSINE','77-C1 35882','Bus no.11'),(12,34,'LIMOUSINE','77-C1 12790','Bus no.12'),(13,40,'LIMOUSINE','77-C1 23228','Bus no.13'),(14,40,'LIMOUSINE','77-C1 15584','Bus no.14'),(15,29,'LIMOUSINE','77-C1 22203','Bus no.15'),(16,40,'LIMOUSINE','77-C1 17085','Bus no.16'),(17,22,'LIMOUSINE','77-C1 41307','Bus no.17'),(18,40,'LIMOUSINE','77-C1 13672','Bus no.18'),(19,34,'LIMOUSINE','77-C1 16595','Bus no.19'),(20,29,'LIMOUSINE','77-C1 16370','Bus no.20');
UNLOCK TABLES;


DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(38,2) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date_time` datetime(6) DEFAULT NULL,
  `start_date_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i14w897ofrtv43vbx44rtv01u` (`code`),
  KEY `idx_discount_code` (`code`),
  KEY `idx_discount_dates` (`start_date_time`,`end_date_time`),
  KEY `idx_discount_amount` (`amount`),
  KEY `idx_discount_description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `discount` WRITE;
INSERT INTO `discount` VALUES 
(1, 8652.70, 'DISCOUNT-CODE-1', 'SUMMER20', '2024-09-30 23:59:59', '2024-07-01 00:00:00'),
(2, 8836.50, 'DISCOUNT-CODE-2', 'WINTER10', '2024-12-31 23:59:59', '2024-10-01 00:00:00'),
(3, 3216.89, 'DISCOUNT-CODE-3', 'FALL15', '2024-11-30 23:59:59', '2024-09-01 00:00:00'),
(4, 4275.03, 'DISCOUNT-CODE-4', 'SPRING25', '2025-03-31 23:59:59', '2025-03-01 00:00:00'),
(5, 9853.81, 'DISCOUNT-CODE-5', 'NEWUSER50', '2024-12-31 23:59:59', '2024-10-01 00:00:00'),
(6, 1615.32, 'DISCOUNT-CODE-6', 'WEEKEND20', '2024-10-31 23:59:59', '2024-10-01 00:00:00'),
(7, 4764.90, 'DISCOUNT-CODE-7', 'HOLIDAY30', '2024-12-25 23:59:59', '2024-12-01 00:00:00'),
(8, 1185.44, 'DISCOUNT-CODE-8', 'STUDENT15', '2024-10-31 23:59:59', '2024-09-01 00:00:00'),
(9, 8973.08, 'DISCOUNT-CODE-9', 'SENIOR20', '2024-11-30 23:59:59', '2024-09-01 00:00:00'),
(10, 5584.05, 'DISCOUNT-CODE-10', 'FAMILY25', '2024-12-31 23:59:59', '2024-10-01 00:00:00'),
(11, 8168.04, 'DISCOUNT-CODE-11', 'GROUP10', '2025-01-31 23:59:59', '2024-10-01 00:00:00'),
(12, 9250.42, 'DISCOUNT-CODE-12', 'LOYALTY20', '2025-02-28 23:59:59', '2024-10-01 00:00:00'),
(13, 9807.27, 'DISCOUNT-CODE-13', 'REFERRAL30', '2024-12-31 23:59:59', '2024-10-01 00:00:00'),
(14, 653.27, 'DISCOUNT-CODE-14', 'BIRTHDAY50', '2024-11-30 23:59:59', '2024-11-01 00:00:00'),
(15, 2942.39, 'DISCOUNT-CODE-15', 'ANNIVERSARY40', '2025-02-28 23:59:59', '2024-10-01 00:00:00'),
(16, 8153.62, 'DISCOUNT-CODE-16', 'FLASHSALE50', '2024-10-31 23:59:59', '2024-10-01 00:00:00'),
(17, 7383.28, 'DISCOUNT-CODE-17', 'EARLYBIRD20', '2025-01-31 23:59:59', '2024-12-01 00:00:00'),
(18, 7295.30, 'DISCOUNT-CODE-18', 'LASTMINUTE25', '2025-01-31 23:59:59', '2024-12-01 00:00:00'),
(19, 1519.21, 'DISCOUNT-CODE-19', 'NEWYEAR30', '2025-01-31 23:59:59', '2024-12-01 00:00:00'),
(20, 9665.49, 'DISCOUNT-CODE-20', 'BLACKFRIDAY50', '2024-11-30 23:59:59', '2024-11-01 00:00:00'),
(21, 10.00, 'DISCOUNT2024', 'Year-end discount', '2024-12-31 23:59:59', '2024-12-01 00:00:00');
UNLOCK TABLES;


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
  UNIQUE KEY `UK_phx4fa0f4397mg8kltbf7c2gy` (`phone`),
  UNIQUE KEY `idx_driver_email` (`email`),
  UNIQUE KEY `idx_driver_phone` (`phone`),
  UNIQUE KEY `idx_driver_license_number` (`license_number`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `driver` WRITE;
INSERT INTO `driver` VALUES (1,'123 Đường Lê Lợi, TP. Quy Nhơn, Bình Định','2002-01-01','driver1@gmail.com','Nguyễn',_binary '\0','Anh','LICENSE NO.1','0901234567',_binary '\0'),(2,'456 Đường Nguyễn Huệ, TP. Quy Nhơn, Bình Định','2002-01-01','driver2@gmail.com','Trần',_binary '\0','Bình','LICENSE NO.2','0912345678',_binary '\0'),(3,'789 Đường Ngô Quyền, TP. Quy Nhơn, Bình Định','2002-01-01','driver3@gmail.com','Lê',_binary '\0','Cường','LICENSE NO.3','0923456789',_binary '\0'),(4,'1011 Đường Trần Hưng Đạo, TP. Quy Nhơn, Bình Định','2002-01-01','driver4@gmail.com','Phạm',_binary '\0','Dương','LICENSE NO.4','0934567890',_binary '\0'),(5,'1213 Đường Nguyễn Văn Linh, TP. Quy Nhơn, Bình Định','2002-01-01','driver5@gmail.com','Hoàng',_binary '\0','Đức','LICENSE NO.5','0945678901',_binary '\0'),(6,'1415 Đường Nguyễn Tất Thành, TP. Quy Nhơn, Bình Định','2002-01-01','driver6@gmail.com','Ngô',_binary '\0','Hoàn','LICENSE NO.6','0956789012',_binary '\0'),(7,'1617 Đường Nguyễn Công Trứ, TP. Quy Nhơn, Bình Định','2002-01-01','driver7@gmail.com','Bùi',_binary '\0','Hưng','LICENSE NO.7','0967890123',_binary '\0'),(8,'1819 Đường Phan Đình Phùng, TP. Quy Nhơn, Bình Định','2002-01-01','driver8@gmail.com','Đỗ',_binary '\0','Khai','LICENSE NO.8','0978901234',_binary '\0'),(9,'2021 Đường Lý Tự Trọng, TP. Quy Nhơn, Bình Định','2002-01-01','driver9@gmail.com','Võ',_binary '\0','Long','LICENSE NO.9','0989012345',_binary '\0'),(10,'2223 Đường Bạch Đằng, TP. Quy Nhơn, Bình Định','2002-01-01','driver10@gmail.com','Đặng',_binary '\0','Minh','LICENSE NO.10','0990123456',_binary '\0'),(11,'2425 Đường Nguyễn Chí Thanh, TP. Quy Nhơn, Bình Định','2002-01-01','driver11@gmail.com','Ngô',_binary '\0','Nam','LICENSE NO.11','0901122334',_binary '\0'),(12,'2627 Đường Trần Phú, TP. Quy Nhơn, Bình Định','2002-01-01','driver12@gmail.com','Bùi',_binary '\0','Phúc','LICENSE NO.12','0912233445',_binary '\0'),(13,'2829 Đường Hoàng Diệu, TP. Quy Nhơn, Bình Định','2002-01-01','driver13@gmail.com','Lê',_binary '\0','Quân','LICENSE NO.13','0923344556',_binary '\0'),(14,'3031 Đường Phùng Khắc Khoan, TP. Quy Nhơn, Bình Định','2002-01-01','driver14@gmail.com','Phan',_binary '','Thị Thanh','LICENSE NO.14','0934455667',_binary '\0'),(15,'3233 Đường Trần Bình Trọng, TP. Quy Nhơn, Bình Định','2002-01-01','driver15@gmail.com','Nguyễn',_binary '','Thị Hương','LICENSE NO.15','0945566778',_binary '\0'),(16,'3435 Đường Phạm Hồng Thái, TP. Quy Nhơn, Bình Định','2002-01-01','driver16@gmail.com','Trần',_binary '','Thị Hoa','LICENSE NO.16','0956677889',_binary '\0'),(17,'3637 Đường Nguyễn Hữu Thọ, TP. Quy Nhơn, Bình Định','2002-01-01','driver17@gmail.com','Lê',_binary '','Thị Hạnh','LICENSE NO.17','0967788990',_binary '\0'),(18,'3839 Đường Lý Thường Kiệt, TP. Quy Nhơn, Bình Định','2002-01-01','driver18@gmail.com','Phạm',_binary '','Thị Phương','LICENSE NO.18','0978899001',_binary '\0'),(19,'4041 Đường Trần Quang Diệu, TP. Quy Nhơn, Bình Định','2002-01-01','driver19@gmail.com','Hoàng',_binary '','Thị Trang','LICENSE NO.19','0989900112',_binary '\0'),(20,'4243 Đường Nguyễn Văn Cừ, TP. Quy Nhơn, Bình Định','2002-01-01','driver20@gmail.com','Đặng',_binary '','Thị Ngọc','LICENSE NO.20','0991001223',_binary '\0'),(46,'Đội 7 thôn Lương Bình, xã Phước Thắng, huyện Tuy Phước, tỉnh Bình Định','2000-07-07','luanvanduc2000@gmail.com','Luân',_binary '\0','Văn Đức','LICENSE NO.21','0326917158',_binary '\0');
UNLOCK TABLES;


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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
  KEY `idx_notification_send_date_time` (`send_date_time`),
  KEY `idx_notification_recipient_type` (`recipient_type`),
  KEY `idx_notification_sender_username` (`sender_username`),
  KEY `idx_notification_trip_id` (`trip_id`),
  CONSTRAINT `FK5qb7kdu7bql8f6v75rrvi1i67` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`),
  CONSTRAINT `FKf6kkv92c81rhgis7n21br0946` FOREIGN KEY (`sender_username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_province_code_name` (`code_name`),
  KEY `idx_province_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `province` WRITE;
INSERT INTO `province` VALUES (1,'an_giang','An Giang'),(2,'ba_ria_vung_tau','Bà Rịa - Vũng Tàu'),(3,'bac_giang','Bắc Giang'),(4,'bac_kan','Bắc Kạn'),(5,'bac_lieu','Bạc Liêu'),(6,'bac_ninh','Bắc Ninh'),(7,'ben_tre','Bến Tre'),(8,'binh_dinh','Bình Định'),(9,'binh_duong','Bình Dương'),(10,'binh_phuoc','Bình Phước'),(11,'binh_thuan','Bình Thuận'),(12,'ca_mau','Cà Mau'),(13,'can_tho','Cần Thơ'),(14,'cao_bang','Cao Bằng'),(15,'da_nang','Đà Nẵng'),(16,'dak_lak','Đắk Lắk'),(17,'dak_nong','Đắk Nông'),(18,'dien_bien','Điện Biên'),(19,'dong_nai','Đồng Nai'),(20,'dong_thap','Đồng Tháp'),(21,'gia_lai','Gia Lai'),(22,'ha_giang','Hà Giang'),(23,'ha_nam','Hà Nam'),(24,'ha_noi','Hà Nội'),(25,'ha_tinh','Hà Tĩnh'),(26,'hai_duong','Hải Dương'),(27,'hai_phong','Hải Phòng'),(28,'hau_giang','Hậu Giang'),(29,'hoa_binh','Hòa Bình'),(30,'hung_yen','Hưng Yên'),(31,'khanh_hoa','Khánh Hòa'),(32,'kien_giang','Kiên Giang'),(33,'kon_tum','Kon Tum'),(34,'lai_chau','Lai Châu'),(35,'lam_dong','Lâm Đồng'),(36,'lang_son','Lạng Sơn'),(37,'lao_cai','Lào Cai'),(38,'long_an','Long An'),(39,'nam_dinh','Nam Định'),(40,'nghe_an','Nghệ An'),(41,'ninh_binh','Ninh Bình'),(42,'ninh_thuan','Ninh Thuận'),(43,'phu_tho','Phú Thọ'),(44,'phu_yen','Phú Yên'),(45,'quang_binh','Quảng Bình'),(46,'quang_nam','Quảng Nam'),(47,'quang_ngai','Quảng Ngãi'),(48,'quang_ninh','Quảng Ninh'),(49,'quang_tri','Quảng Trị'),(50,'soc_trang','Sóc Trăng'),(51,'son_la','Sơn La'),(52,'tay_ninh','Tây Ninh'),(53,'thai_binh','Thái Bình'),(54,'thai_nguyen','Thái Nguyên'),(55,'thanh_hoa','Thanh Hóa'),(56,'thua_thien_hue','Thừa Thiên Huế'),(57,'tien_giang','Tiền Giang'),(58,'tra_vinh','Trà Vinh'),(59,'tuyen_quang','Tuyên Quang'),(60,'vinh_long','Vĩnh Long'),(61,'vinh_phuc','Vĩnh Phúc'),(62,'yen_bai','Yên Bái'),(63,'thanh_pho_ho_chi_minh','Thành Phố Hồ Chí Minh');
UNLOCK TABLES;


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
  KEY `idx_review_trip_id` (`trip_id`),
  KEY `idx_review_username` (`username`),
  KEY `idx_review_created_at` (`created_at`),
  KEY `idx_review_coach_rating` (`coach_rating`),
  KEY `idx_review_driver_rating` (`driver_rating`),
  KEY `idx_review_trip_rating` (`trip_rating`),
  CONSTRAINT `FK117o6riye2xefmyeaanbvdx1i` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FKsdujhwxnw678xtqnvqre9gl3h` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `role_code` enum('ROLE_ADMIN','ROLE_CREATE','ROLE_CUSTOMER','ROLE_DELETE','ROLE_READ','ROLE_STAFF','ROLE_UPDATE') DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_role_code` (`role_code`),
  KEY `idx_role_role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `role` WRITE;
INSERT INTO `role` VALUES (1,'Quản lý toàn hệ thống','ROLE_ADMIN','Quản trị viên'),(2,'Quản lý nghiệp vụ nhân viên','ROLE_STAFF','Nhân viên'),(3,'Khách hàng sử dụng dịch vụ','ROLE_CUSTOMER','Khách hàng'),(4,'Quyền tạo mới dữ liệu','ROLE_CREATE','Tạo mới'),(5,'Quyền xem dữ liệu','ROLE_READ','Đọc'),(6,'Quyền cập nhật dữ liệu','ROLE_UPDATE','Cập nhật'),(7,'Quyền xóa dữ liệu','ROLE_DELETE','Xóa');
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_trip_fields` (`driver_id`,`coach_id`,`source_id`,`dest_id`,`departure_date_time`),
  KEY `FKs3c683ds4ckyessv3l8optnmb` (`discount_id`),
  KEY `idx_trip_source_dest_date` (`source_id`,`dest_id`,`departure_date_time`),
  KEY `idx_trip_driver` (`driver_id`),
  KEY `idx_trip_coach` (`coach_id`),
  KEY `idx_trip_source` (`source_id`),
  KEY `idx_trip_destination` (`dest_id`),
  KEY `idx_trip_source_dest_departure` (`source_id`,`dest_id`,`departure_date_time`),
  KEY `idx_trip_duplicate_check` (`driver_id`,`coach_id`,`source_id`,`dest_id`,`departure_date_time`),
  KEY `idx_trip_other_duplicate_check` (`id`,`driver_id`,`coach_id`,`source_id`,`dest_id`,`departure_date_time`),
  KEY `idx_trip_departure_date_time` (`departure_date_time`),
  CONSTRAINT `FK8ow8h4pjlljfdhlpbmh5lopyx` FOREIGN KEY (`source_id`) REFERENCES `province` (`id`),
  CONSTRAINT `FK9qw6r3fpf34ldxj3febn4jiym` FOREIGN KEY (`dest_id`) REFERENCES `province` (`id`),
  CONSTRAINT `FKpuhkx68hnwy4by2b0onybv5x1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`),
  CONSTRAINT `FKs3c683ds4ckyessv3l8optnmb` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`),
  CONSTRAINT `FKxq0qrdn0xmupsnq4mlplprke` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `trip` (`id`, `departure_date_time`, `duration`, `price`, `coach_id`, `dest_id`, `discount_id`, `driver_id`, `source_id`)
VALUES 
(1, '2024-10-10 08:00:00.000000', 7.0, 750000.00, 1, 63, 1, 1, 8),
(2, '2024-10-11 09:00:00.000000', 7.0, 750000.00, 2, 63, 2, 2, 8),
(3, '2024-10-12 10:30:00.000000', 5.5, 600000.00, 3, 9, 3, 3, 8),
(4, '2024-10-13 12:30:00.000000', 5.5, 600000.00, 4, 9, 4, 4, 8),
(5, '2024-10-14 08:00:00.000000', 6.0, 700000.00, 5, 35, 5, 5, 8),
(6, '2024-10-15 09:00:00.000000', 6.0, 700000.00, 6, 35, 6, 6, 8),
(7, '2024-10-16 07:30:00.000000', 5.5, 600000.00, 7, 7, 7, 7, 8),
(8, '2024-10-17 09:30:00.000000', 5.5, 600000.00, 8, 7, 8, 8, 8),
(9, '2024-10-18 06:00:00.000000', 4.0, 450000.00, 9, 21, 9, 9, 8),
(10, '2024-10-19 07:00:00.000000', 4.0, 450000.00, 10, 21, 10, 10, 8),
(11, '2024-10-20 07:15:00.000000', 2.5, 300000.00, 11, 42, 11, 11, 8),
(12, '2024-10-21 08:15:00.000000', 2.5, 300000.00, 12, 42, 12, 12, 8),
(13, '2024-10-22 09:00:00.000000', 3.5, 350000.00, 13, 31, 13, 13, 8),
(14, '2024-10-23 10:00:00.000000', 3.5, 350000.00, 14, 31, 14, 14, 8),
(15, '2024-10-11 08:00:00.000000', 7.0, 750000.00, 1, 8, 1, 1, 63),
(16, '2024-10-12 09:00:00.000000', 7.0, 750000.00, 2, 8, 2, 2, 63),
(17, '2024-10-13 10:30:00.000000', 5.5, 600000.00, 3, 8, 3, 3, 9),
(18, '2024-10-14 12:30:00.000000', 5.5, 600000.00, 4, 8, 4, 4, 9),
(19, '2024-10-15 08:00:00.000000', 6.0, 700000.00, 5, 8, 5, 5, 35),
(20, '2024-10-16 09:00:00.000000', 6.0, 700000.00, 6, 8, 6, 6, 35),
(21, '2024-10-17 07:30:00.000000', 5.5, 600000.00, 7, 8, 7, 7, 7),
(22, '2024-10-18 09:30:00.000000', 5.5, 600000.00, 8, 8, 8, 8, 7),
(23, '2024-10-19 06:00:00.000000', 4.0, 450000.00, 9, 8, 9, 9, 21),
(24, '2024-10-20 07:00:00.000000', 4.0, 450000.00, 10, 8, 10, 10, 21),
(25, '2024-10-21 07:15:00.000000', 2.5, 300000.00, 11, 8, 11, 11, 42),
(26, '2024-10-22 08:15:00.000000', 2.5, 300000.00, 12, 8, 12, 12, 42),
(27, '2024-10-23 09:00:00.000000', 3.5, 350000.00, 13, 8, 13, 13, 31),
(28, '2024-10-24 10:00:00.000000', 3.5, 350000.00, 14, 8, 14, 14, 31);
UNLOCK TABLES;

DROP TABLE IF EXISTS `trip_log`;
CREATE TABLE `trip_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `log_time` datetime(6) DEFAULT NULL,
  `log_type` enum('BREAKDOWN','COMPLETED','INCIDENT','MAINTENANCE','OTHER') NOT NULL,
  `trip_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr063ik2s2h7wa5irgv8801vvc` (`trip_id`),
  KEY `FKhk8hmr33wodgtl2399eqgdi1f` (`created_by`),
  CONSTRAINT `FKhk8hmr33wodgtl2399eqgdi1f` FOREIGN KEY (`created_by`) REFERENCES `user` (`username`),
  CONSTRAINT `FKr063ik2s2h7wa5irgv8801vvc` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
  UNIQUE KEY `UK_589idila9li6a4arw1t8ht1gx` (`phone`),
  UNIQUE KEY `idx_email` (`email`),
  UNIQUE KEY `idx_phone` (`phone`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `user` (`username`, `active`, `address`, `dob`, `email`, `first_name`, `gender`, `last_name`, `password`, `phone`)
VALUES 
('admin',_binary '','Lương Bình, Phước Thắng, Tuy Phước, Bình Định','2002-02-22','dienchau45@gmail.com','Diễn',_binary '\0','Châu','$2a$10$dki8BBLw8Z2DKKFUM4mlzutBuhPmZ75rlQ/2j1Y40YnO1k1ROrIwG','0326917158'),
('HuyDien',_binary '','23 Lý Thường Kiệt, Quy Nhơn, Bình Định','2002-12-22','abclsdjf23@gmail.com','Châu ',_binary '\0','Diễn','$2a$10$twnkqal5hZFqA9yFo0J6/OqWOYbnWXNmD02zN44b1J1AIox1vW2Aq','0987654321'),
('johndoe',_binary '',NULL,NULL,'johndoe@example.com','John',_binary '\0','Doe','$2a$10$bdykQQ7qHDCs4Z1btywaL.qDc8MFfeysPKu/bpd6qn/C3GKzi5Ruu','0123456789'),
('LeHaThanh',_binary '',NULL,NULL,'lehathanh@ptithcm.edu.vn','Lê',_binary '\0','Thanh','$2a$10$zagRsm5vU.4wuITFziq3euNNg/vuLINW1T1fI80uPhOFG0WY4jcGC','0937142075'),
('nguyenvana',_binary '','127A Trần Phú, Quy Nhơn, Bình Định','2002-07-07','nguyenvana@gmail.com','Nguyễn ',_binary '','Văn A','$2a$10$qoVRUAPQXAQhaw1eOcvoJ.UqHlZlKKxfDlC0uiSG6sn3ovrlmLwOO','0935841720'),
('nguyenvanb',_binary '','53A Hàm Nghi, Quy Nhơn, Bình Định','2001-07-07','nguyenvanb@gmail.com','Nguyễn ',_binary '\0','Văn B','$2a$10$Og5Py3or23yle/YnDSFG5OBFyUUmN337/K6TAepm7Hr.D.DwIMPnS','0772419780'),
('user1',_binary '','Số 10 Lê Duẩn, TP Quy Nhơn, Bình Định','2002-01-01','user1@gmail.com','Nguyễn',_binary '\0','Hải','$2a$10$Ea.f5pdM7vKPuuL4sz4zju8Yu7y4tMMG4QvLGYKAqmhn1bOeO1dhS','0901234567'),
('user10',_binary '','Số 100 Nguyễn Tất Thành, TP Quy Nhơn, Bình Định','2002-01-01','user10@gmail.com','Trần',_binary '\0','Dũng','$2a$10$gEuuqReE4fgIt19sqQedhO7Jl9dp/dSOh812evH9Ta3cHaB5m9NNi','0901234568'),
('user11',_binary '','321 Hùng Vương, Hoài Nhơn, Bình Định','2002-01-01','user11@gmail.com','Lê',_binary '','Trang','$2a$10$Eyj77RCrpQ8BIRHjgZLDUOfpUESo8hL/70cSCVc4G3XRzBGeWK.KS','0934567890'),
('user12',_binary '','654 Lê Lợi, Phù Mỹ, Bình Định','2002-01-01','user12@gmail.com','Lê',_binary '','Anh','$2a$10$8WHNmWqsHbEmzWz69BdxMOhClzwWgKRtvNXCqxa1zpLXxQevXOF6y','0901234569'),
('user13',_binary '','Số 130 Phan Thanh, TP Quy Nhơn, Bình Định','2002-01-01','user13@gmail.com','Phạm',_binary '','Trang','$2a$10$rYbs/TgA.DkZBXvJzetdS.vTRsHW8ZkIXtsHUqG68p7k02HA2.1aO','0956789012'),
('user14',_binary '','Số 140 Lê Hồng Phong, TP Quy Nhơn, Bình Định','2002-01-01','user14@gmail.com','Nguyễn',_binary '\0','Vũ','$2a$10$MU1AA8cd4n/IzOWB7evW3eyDoubngvDlIMPrXbFZu88ADylZTr1D.','0967890123'),
('user15',_binary '','Số 150 Nguyễn Văn Linh, TP Quy Nhơn, Bình Định','2002-01-01','user15@gmail.com','Nguyễn',_binary '\0','Hoàng','$2a$10$o7uP7ZsiavyN6NyAqoEdIeWFBcn3.0zJhRy8Fb/SiP3FJw4CraAXq','0902112233'),
('user16',_binary '','Số 160 Trần Phú, TP Quy Nhơn, Bình Định','2002-01-01','user16@gmail.com','Lê',_binary '\0','Dũng','$2a$10$dxCKeDDxSo1Mb2lX8A8RxeN0HbL34PaktLxiBXZcYqDKhDfyGIV/2','0989012345'),
('user17',_binary '','Số 170 Hoàng Văn Thụ, TP Quy Nhơn, Bình Định','2002-01-01','user17@gmail.com','Võ',_binary '\0','Quân','$2a$10$7OKlpFDnHhR1SdlwBlz9mOeeGnKzfM5gqiamYGKpSL3cK/vK/I5nW','0990123456'),
('user18',_binary '','Số 180 Trần Quang Diệu, TP Quy Nhơn, Bình Định','2002-01-01','user18@gmail.com','Trương',_binary '\0','Thắng','$2a$10$Z0ejcC4NZYL6nI1VcP4ryuaE.SFtm.Dpwp6FnLgv.GVJq55cvfD/C','0901122334'),
('user19',_binary '','Số 190 Phan Đình Phùng, TP Quy Nhơn, Bình Định','2002-01-01','user19@gmail.com','Nguyễn',_binary '\0','Tân','$2a$10$c.mpxAJNXQchhxoOCD8G6OEW5XRWEEO5gQ/fy/CgT0kPED7KGqG7e','0912233445'),
('user2',_binary '','Số 20 Trần Phú, TP Quy Nhơn, Bình Định','2002-01-01','user2@gmail.com','Nguyễn',_binary '','Anh','$2a$10$Gc1PBxW.s7egx7sEiUN63u0YFXVl/89h.Tf2s9c4vKnIRtB3nxq1m','0923344556'),
('user20',_binary '','Số 200 Lý Thái Tổ, TP Quy Nhơn, Bình Định','2002-01-01','user20@gmail.com','Phạm',_binary '','Thảo','$2a$10$3LJSGlfZZWKa2Ws/d2Dr8eiiN01laTJUg4t5yAshAizMVN0fqhjdy','0934455667'),
('user3',_binary '','Số 30 Nguyễn Huệ, TP Quy Nhơn, Bình Định','2002-01-01','user3@gmail.com','Nguyễn',_binary '\0','Đức','$2a$10$16ljwGzL8N0RNs0GVaUK3.ZHAv6ZqOhT.s6qeSQ4UgRZR9rLpT2u6','0945566778'),
('user4',_binary '','Số 40 Ngô Mây, TP Quy Nhơn, Bình Định','2002-01-01','user4@gmail.com','Châu',_binary '\0','Điền','$2a$10$6bDY.lLQBSvycUVkKSYueuhYINmafqF7eiigNi2R9q5xyXrt2jU16','0956677889'),
('user5',_binary '','Số 50 Hải Thượng Lãn Ông, TP Quy Nhơn, Bình Định','2002-01-01','user5@gmail.com','Hoàng',_binary '','Thảo','$2a$10$ePBRfddr.NGeW/tUmL.UNuS4ugXZBRP8XEF.mtL.IUfRyO0ty0F1u','0967788990'),
('user6',_binary '','Số 60 Phan Chu Trinh, TP Quy Nhơn, Bình Định','2002-01-01','user6@gmail.com','Trần',_binary '\0','Anh','$2a$10$CxqHqBtNGYUv7NH72tJ6eeTwhBGAWJS1YfgT1ycA5r4D2ZKXHuX1e','0978899001'),
('user7',_binary '','Số 70 Hùng Vương, TP Quy Nhơn, Bình Định','2002-01-01','user7@gmail.com','Phạm',_binary '','Trang','$2a$10$t5EvoayabxZ6iuLw5U5MqOudIrnQCgaB6XAoCzqoKcpuh9AHYc2lm','0989900112'),
('user8',_binary '','Số 80 Lê Lợi, TP Quy Nhơn, Bình Định','2002-01-01','user8@gmail.com','Võ',_binary '','Thảo','$2a$10$95CzhnFMCnu9eWQb6ne5mOe61WlUIrW/aj2nhaWlau.i3QJ5G0bNa','0991001223'),
('user9',_binary '','Số 90 Trần Hưng Đạo, TP Quy Nhơn, Bình Định','2002-01-01','user9@gmail.com','Trần',_binary '\0','Hải','$2a$10$0p/5Aq.jJEHTy.KOnjrLFuwwY1qY0Glxktq22RPRy8k0nGyt8wkLS','0913223344');
UNLOCK TABLES;

DROP TABLE IF EXISTS `user_notification`;
CREATE TABLE `user_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_deleted` bit(1) DEFAULT NULL,
  `is_read` bit(1) DEFAULT NULL,
  `read_date_time` datetime(6) DEFAULT NULL,
  `notification_id` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_notification_username` (`username`),
  KEY `idx_user_notification_is_read` (`is_read`),
  KEY `idx_user_notification_is_deleted` (`is_deleted`),
  KEY `idx_user_notification_read_date_time` (`read_date_time`),
  KEY `idx_user_notification_notification_id` (`notification_id`),
  CONSTRAINT `FK53pjy9iwmuvp3t5ayl1muviso` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FKi5naecliicmigrk01qx5me5sp` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
LOCK TABLES `user_permission` WRITE;
INSERT INTO `user_permission` VALUES (2,NULL,1,'admin'),(1,NULL,3,'HuyDien'),(59,NULL,3,'johndoe'),(60,NULL,3,'LeHaThanh'),(25,NULL,2,'nguyenvana'),(34,'COACHES',4,'nguyenvana'),(50,'DASHBOARD',4,'nguyenvana'),(30,'DRIVERS',4,'nguyenvana'),(46,'REPORT',4,'nguyenvana'),(42,'TICKETS',4,'nguyenvana'),(38,'TRIPS',4,'nguyenvana'),(54,'USERS',4,'nguyenvana'),(35,'COACHES',5,'nguyenvana'),(51,'DASHBOARD',5,'nguyenvana'),(31,'DRIVERS',5,'nguyenvana'),(47,'REPORT',5,'nguyenvana'),(43,'TICKETS',5,'nguyenvana'),(39,'TRIPS',5,'nguyenvana'),(55,'USERS',5,'nguyenvana'),(36,'COACHES',6,'nguyenvana'),(52,'DASHBOARD',6,'nguyenvana'),(32,'DRIVERS',6,'nguyenvana'),(48,'REPORT',6,'nguyenvana'),(44,'TICKETS',6,'nguyenvana'),(40,'TRIPS',6,'nguyenvana'),(56,'USERS',6,'nguyenvana'),(37,'COACHES',7,'nguyenvana'),(53,'DASHBOARD',7,'nguyenvana'),(33,'DRIVERS',7,'nguyenvana'),(49,'REPORT',7,'nguyenvana'),(45,'TICKETS',7,'nguyenvana'),(41,'TRIPS',7,'nguyenvana'),(57,'USERS',7,'nguyenvana'),(58,NULL,2,'nguyenvanb'),(3,NULL,3,'user1'),(13,NULL,3,'user10'),(14,NULL,3,'user11'),(15,NULL,3,'user12'),(16,NULL,3,'user13'),(17,NULL,3,'user14'),(18,NULL,3,'user15'),(19,NULL,3,'user16'),(20,NULL,3,'user17'),(21,NULL,3,'user18'),(22,NULL,3,'user19'),(5,NULL,3,'user2'),(23,NULL,3,'user20'),(6,NULL,3,'user3'),(7,NULL,3,'user4'),(8,NULL,3,'user5'),(9,NULL,3,'user6'),(10,NULL,3,'user7'),(11,NULL,3,'user8'),(12,NULL,3,'user9');
UNLOCK TABLES;


select * from role;
select * from token t ;
select * from user_permission up ;
select * from province p ;
select * from location l ;
select * from loyalty_transaction lt ;
select * from `user` u ;
select * from booking b ;
select * from trip t ;
select * from discount d ;
select * from coach c ;
select * from driver d ;
select * from payment_history ph ;
select * from notification n;
select * from user_notification un ;
select * from review r ;
select * from cargo c ;
select * from booking_cargo bc ;
select * from trip_log tl ;

-- Insert dữ liệu vào bảng trip với các trường mới
INSERT INTO `trip` 
(`completed`, `departure_date_time`, `duration`, `price`, `coach_id`, `dest_id`, `discount_id`, `driver_id`, `source_id`, `drop_off_location_id`, `pick_up_location_id`) 
VALUES
(0, '2024-10-30 08:30:00', 5.5, 500000.00, 1, 9, 1, 1, 8, 9, 8),
(0, '2024-10-26 09:00:00.000000', 4.0, 300000.00, 2, 8, 2, 2, 7, 7, 8);  -- Đà Nẵng -> Hà Nội
(0, '2024-10-27 07:15:00.000000', 6.0, 600000.00, 3, 48, 3, 3, 19, 103, 203),  -- Quảng Ninh -> Đồng Nai
(1, '2024-10-23 06:45:00.000000', 7.0, 700000.00, 4, 31, NULL, 4, 2, 104, 204), -- Khánh Hòa -> Bà Rịa - Vũng Tàu
(0, '2024-10-28 10:00:00.000000', 8.0, 800000.00, 1, 35, NULL, 1, 56, 105, 205); -- Lâm Đồng -> Thừa Thiên Huế



https://qr.sepay.vn/img?acc=0326917158&bank=MBBank&amount=SO_TIEN&des=NOI_DUNG&template=TEMPLATE&download=DOWNLOAD


select * from booking b where b.phone = '0901234567';

create index idx_username on user (username);
CREATE UNIQUE INDEX idx_email ON user (email);
CREATE UNIQUE INDEX idx_phone ON user (phone);

CREATE INDEX idx_id ON booking (id);
CREATE INDEX idx_trip_id ON booking (trip_id);
CREATE INDEX idx_phone ON booking (phone);
CREATE INDEX idx_email ON booking (email);
CREATE INDEX idx_booking_date_time ON booking (booking_date_time);
CREATE INDEX idx_payment_status ON booking(payment_status);

CREATE INDEX idx_name ON coach (name);
CREATE INDEX idx_id ON coach (id);
CREATE INDEX idx_license_plate ON coach (license_plate);
CREATE INDEX idx_coach_type ON coach(coach_type);

CREATE INDEX idx_discount_code ON discount (code);
CREATE INDEX idx_discount_dates ON discount (start_date_time, end_date_time);
CREATE INDEX idx_discount_amount ON discount (amount);
CREATE INDEX idx_discount_description ON discount (description);

CREATE UNIQUE INDEX idx_driver_email ON driver (email);
CREATE UNIQUE INDEX idx_driver_phone ON driver (phone);
CREATE UNIQUE INDEX idx_driver_license_number ON driver (license_number);

CREATE INDEX idx_payment_history_booking_id ON payment_history (booking_id);
CREATE INDEX idx_payment_history_status_change_date_time ON payment_history (status_change_date_time);

CREATE INDEX idx_province_code_name ON province (code_name);
CREATE INDEX idx_province_name ON province (name);

CREATE INDEX idx_role_role_code ON role (role_code);
CREATE INDEX idx_role_role_name ON role (role_name);

CREATE INDEX idx_trip_source_dest_date ON trip(source_id, dest_id, departure_date_time);
CREATE INDEX idx_trip_driver ON trip(driver_id);
CREATE INDEX idx_trip_coach ON trip(coach_id);
CREATE INDEX idx_trip_source ON trip(source_id);
CREATE INDEX idx_trip_destination ON trip(dest_id);
CREATE INDEX idx_trip_source_dest_departure ON trip(source_id, dest_id, departure_date_time);
CREATE INDEX idx_trip_duplicate_check ON trip(driver_id, coach_id, source_id, dest_id, departure_date_time);
CREATE INDEX idx_trip_other_duplicate_check ON trip(id, driver_id, coach_id, source_id, dest_id, departure_date_time);
CREATE INDEX idx_trip_departure_date_time ON trip(departure_date_time);

CREATE INDEX idx_loyalty_transaction_username ON loyalty_transaction(username);
CREATE INDEX idx_loyalty_transaction_booking_id ON loyalty_transaction(booking_id);

CREATE INDEX idx_notification_send_date_time ON `notification` (`send_date_time`);
CREATE INDEX idx_notification_recipient_type ON `notification` (`recipient_type`);
CREATE INDEX idx_notification_sender_username ON `notification` (`sender_username`);
CREATE INDEX idx_notification_trip_id ON `notification` (`trip_id`);


CREATE INDEX idx_review_trip_id ON `review` (`trip_id`);
CREATE INDEX idx_review_username ON `review` (`username`);
CREATE INDEX idx_review_created_at ON `review` (`created_at`);
CREATE INDEX idx_review_coach_rating ON `review` (`coach_rating`);
CREATE INDEX idx_review_driver_rating ON `review` (`driver_rating`);
CREATE INDEX idx_review_trip_rating ON `review` (`trip_rating`);

CREATE INDEX idx_user_notification_username ON `user_notification` (`username`);
CREATE INDEX idx_user_notification_is_read ON `user_notification` (`is_read`);
CREATE INDEX idx_user_notification_is_deleted ON `user_notification` (`is_deleted`);
CREATE INDEX idx_user_notification_read_date_time ON `user_notification` (`read_date_time`);
CREATE INDEX idx_user_notification_notification_id ON `user_notification` (`notification_id`);



