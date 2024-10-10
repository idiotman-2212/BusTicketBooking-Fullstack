
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


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `role_code` enum('ROLE_ADMIN','ROLE_CREATE','ROLE_CUSTOMER','ROLE_DELETE','ROLE_READ','ROLE_STAFF','ROLE_UPDATE') DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `role` VALUES (1,'Quản lý toàn hệ thống','ROLE_ADMIN','Quản trị viên'),(2,'Quản lý nghiệp vụ nhân viên','ROLE_STAFF','Nhân viên'),(3,'Khách hàng sử dụng dịch vụ','ROLE_CUSTOMER','Khách hàng'),(4,'Quyền tạo mới dữ liệu','ROLE_CREATE','Tạo mới'),(5,'Quyền xem dữ liệu','ROLE_READ','Đọc'),(6,'Quyền cập nhật dữ liệu','ROLE_UPDATE','Cập nhật'),(7,'Quyền xóa dữ liệu','ROLE_DELETE','Xóa');


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `coach` VALUES (1,29,'BED','77-C1 36840','Bus no.1'),(2,40,'BED','77-C1 40792','Bus no.2'),(3,22,'LIMOUSINE','77-C1 26266','Bus no.3'),(4,29,'BED','77-C1 29039','Bus no.4'),(5,29,'BED','77-C1 53124','Bus no.5'),(6,29,'CHAIR','77-C1 46204','Bus no.6'),(7,34,'CHAIR','77-C1 15022','Bus no.7'),(8,29,'CHAIR','77-C1 31634','Bus no.8'),(9,29,'CHAIR','77-C1 27494','Bus no.9'),(10,29,'CHAIR','77-C1 42382','Bus no.10'),(11,34,'LIMOUSINE','77-C1 35882','Bus no.11'),(12,34,'LIMOUSINE','77-C1 12790','Bus no.12'),(13,40,'LIMOUSINE','77-C1 23228','Bus no.13'),(14,40,'LIMOUSINE','77-C1 15584','Bus no.14'),(15,29,'LIMOUSINE','77-C1 22203','Bus no.15'),(16,40,'LIMOUSINE','77-C1 17085','Bus no.16'),(17,22,'LIMOUSINE','77-C1 41307','Bus no.17'),(18,40,'LIMOUSINE','77-C1 13672','Bus no.18'),(19,34,'LIMOUSINE','77-C1 16595','Bus no.19'),(20,29,'LIMOUSINE','77-C1 16370','Bus no.20');


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `driver` VALUES (1,'123 Đường Lê Lợi, TP. Quy Nhơn, Bình Định','2002-01-01','driver1@gmail.com','Nguyễn',_binary '\0','Anh','LICENSE NO.1','0901234567',_binary '\0'),(2,'456 Đường Nguyễn Huệ, TP. Quy Nhơn, Bình Định','2002-01-01','driver2@gmail.com','Trần',_binary '\0','Bình','LICENSE NO.2','0912345678',_binary '\0'),(3,'789 Đường Ngô Quyền, TP. Quy Nhơn, Bình Định','2002-01-01','driver3@gmail.com','Lê',_binary '\0','Cường','LICENSE NO.3','0923456789',_binary '\0'),(4,'1011 Đường Trần Hưng Đạo, TP. Quy Nhơn, Bình Định','2002-01-01','driver4@gmail.com','Phạm',_binary '\0','Dương','LICENSE NO.4','0934567890',_binary '\0'),(5,'1213 Đường Nguyễn Văn Linh, TP. Quy Nhơn, Bình Định','2002-01-01','driver5@gmail.com','Hoàng',_binary '\0','Đức','LICENSE NO.5','0945678901',_binary '\0'),(6,'1415 Đường Nguyễn Tất Thành, TP. Quy Nhơn, Bình Định','2002-01-01','driver6@gmail.com','Ngô',_binary '\0','Hoàn','LICENSE NO.6','0956789012',_binary '\0'),(7,'1617 Đường Nguyễn Công Trứ, TP. Quy Nhơn, Bình Định','2002-01-01','driver7@gmail.com','Bùi',_binary '\0','Hưng','LICENSE NO.7','0967890123',_binary '\0'),(8,'1819 Đường Phan Đình Phùng, TP. Quy Nhơn, Bình Định','2002-01-01','driver8@gmail.com','Đỗ',_binary '\0','Khai','LICENSE NO.8','0978901234',_binary '\0'),(9,'2021 Đường Lý Tự Trọng, TP. Quy Nhơn, Bình Định','2002-01-01','driver9@gmail.com','Võ',_binary '\0','Long','LICENSE NO.9','0989012345',_binary '\0'),(10,'2223 Đường Bạch Đằng, TP. Quy Nhơn, Bình Định','2002-01-01','driver10@gmail.com','Đặng',_binary '\0','Minh','LICENSE NO.10','0990123456',_binary '\0'),(11,'2425 Đường Nguyễn Chí Thanh, TP. Quy Nhơn, Bình Định','2002-01-01','driver11@gmail.com','Ngô',_binary '\0','Nam','LICENSE NO.11','0901122334',_binary '\0'),(12,'2627 Đường Trần Phú, TP. Quy Nhơn, Bình Định','2002-01-01','driver12@gmail.com','Bùi',_binary '\0','Phúc','LICENSE NO.12','0912233445',_binary '\0'),(13,'2829 Đường Hoàng Diệu, TP. Quy Nhơn, Bình Định','2002-01-01','driver13@gmail.com','Lê',_binary '\0','Quân','LICENSE NO.13','0923344556',_binary '\0'),(14,'3031 Đường Phùng Khắc Khoan, TP. Quy Nhơn, Bình Định','2002-01-01','driver14@gmail.com','Phan',_binary '','Thị Thanh','LICENSE NO.14','0934455667',_binary '\0'),(15,'3233 Đường Trần Bình Trọng, TP. Quy Nhơn, Bình Định','2002-01-01','driver15@gmail.com','Nguyễn',_binary '','Thị Hương','LICENSE NO.15','0945566778',_binary '\0'),(16,'3435 Đường Phạm Hồng Thái, TP. Quy Nhơn, Bình Định','2002-01-01','driver16@gmail.com','Trần',_binary '','Thị Hoa','LICENSE NO.16','0956677889',_binary '\0'),(17,'3637 Đường Nguyễn Hữu Thọ, TP. Quy Nhơn, Bình Định','2002-01-01','driver17@gmail.com','Lê',_binary '','Thị Hạnh','LICENSE NO.17','0967788990',_binary '\0'),(18,'3839 Đường Lý Thường Kiệt, TP. Quy Nhơn, Bình Định','2002-01-01','driver18@gmail.com','Phạm',_binary '','Thị Phương','LICENSE NO.18','0978899001',_binary '\0'),(19,'4041 Đường Trần Quang Diệu, TP. Quy Nhơn, Bình Định','2002-01-01','driver19@gmail.com','Hoàng',_binary '','Thị Trang','LICENSE NO.19','0989900112',_binary '\0'),(20,'4243 Đường Nguyễn Văn Cừ, TP. Quy Nhơn, Bình Định','2002-01-01','driver20@gmail.com','Đặng',_binary '','Thị Ngọc','LICENSE NO.20','0991001223',_binary '\0'),(46,'Đội 7 thôn Lương Bình, xã Phước Thắng, huyện Tuy Phước, tỉnh Bình Định','2000-07-07','luanvanduc2000@gmail.com','Luân',_binary '\0','Văn Đức','LICENSE NO.21','0326917158',_binary '\0');


DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `province` VALUES (1,'an_giang','An Giang'),(2,'ba_ria_vung_tau','Bà Rịa - Vũng Tàu'),(3,'bac_giang','Bắc Giang'),(4,'bac_kan','Bắc Kạn'),(5,'bac_lieu','Bạc Liêu'),(6,'bac_ninh','Bắc Ninh'),(7,'ben_tre','Bến Tre'),(8,'binh_dinh','Bình Định'),(9,'binh_duong','Bình Dương'),(10,'binh_phuoc','Bình Phước'),(11,'binh_thuan','Bình Thuận'),(12,'ca_mau','Cà Mau'),(13,'can_tho','Cần Thơ'),(14,'cao_bang','Cao Bằng'),(15,'da_nang','Đà Nẵng'),(16,'dak_lak','Đắk Lắk'),(17,'dak_nong','Đắk Nông'),(18,'dien_bien','Điện Biên'),(19,'dong_nai','Đồng Nai'),(20,'dong_thap','Đồng Tháp'),(21,'gia_lai','Gia Lai'),(22,'ha_giang','Hà Giang'),(23,'ha_nam','Hà Nam'),(24,'ha_noi','Hà Nội'),(25,'ha_tinh','Hà Tĩnh'),(26,'hai_duong','Hải Dương'),(27,'hai_phong','Hải Phòng'),(28,'hau_giang','Hậu Giang'),(29,'hoa_binh','Hòa Bình'),(30,'hung_yen','Hưng Yên'),(31,'khanh_hoa','Khánh Hòa'),(32,'kien_giang','Kiên Giang'),(33,'kon_tum','Kon Tum'),(34,'lai_chau','Lai Châu'),(35,'lam_dong','Lâm Đồng'),(36,'lang_son','Lạng Sơn'),(37,'lao_cai','Lào Cai'),(38,'long_an','Long An'),(39,'nam_dinh','Nam Định'),(40,'nghe_an','Nghệ An'),(41,'ninh_binh','Ninh Bình'),(42,'ninh_thuan','Ninh Thuận'),(43,'phu_tho','Phú Thọ'),(44,'phu_yen','Phú Yên'),(45,'quang_binh','Quảng Bình'),(46,'quang_nam','Quảng Nam'),(47,'quang_ngai','Quảng Ngãi'),(48,'quang_ninh','Quảng Ninh'),(49,'quang_tri','Quảng Trị'),(50,'soc_trang','Sóc Trăng'),(51,'son_la','Sơn La'),(52,'tay_ninh','Tây Ninh'),(53,'thai_binh','Thái Bình'),(54,'thai_nguyen','Thái Nguyên'),(55,'thanh_hoa','Thanh Hóa'),(56,'thua_thien_hue','Thừa Thiên Huế'),(57,'tien_giang','Tiền Giang'),(58,'tra_vinh','Trà Vinh'),(59,'tuyen_quang','Tuyên Quang'),(60,'vinh_long','Vĩnh Long'),(61,'vinh_phuc','Vĩnh Phúc'),(62,'yen_bai','Yên Bái'),(63,'thanh_pho_ho_chi_minh','Thành Phố Hồ Chí Minh');


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
  KEY `FKxq0qrdn0xmupsnq4mlplprke` (`coach_id`),
  KEY `FK9qw6r3fpf34ldxj3febn4jiym` (`dest_id`),
  KEY `FKs3c683ds4ckyessv3l8optnmb` (`discount_id`),
  KEY `FK8ow8h4pjlljfdhlpbmh5lopyx` (`source_id`),
  CONSTRAINT `FK8ow8h4pjlljfdhlpbmh5lopyx` FOREIGN KEY (`source_id`) REFERENCES `province` (`id`),
  CONSTRAINT `FK9qw6r3fpf34ldxj3febn4jiym` FOREIGN KEY (`dest_id`) REFERENCES `province` (`id`),
  CONSTRAINT `FKpuhkx68hnwy4by2b0onybv5x1` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`id`),
  CONSTRAINT `FKs3c683ds4ckyessv3l8optnmb` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`id`),
  CONSTRAINT `FKxq0qrdn0xmupsnq4mlplprke` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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



DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_date_time` datetime(6) DEFAULT NULL,
  `booking_type` enum('ONEWAY','ROUNDTRIP') DEFAULT NULL,
  `cust_first_name` varchar(255) DEFAULT NULL,
  `cust_last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `payment_date_time` datetime(6) DEFAULT NULL,
  `payment_method` enum('CARD','CASH','QR') DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



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

