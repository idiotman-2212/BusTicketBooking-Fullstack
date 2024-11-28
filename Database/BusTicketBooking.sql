create database busticketbooking;
use busticketbooking;

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `booking` WRITE;
INSERT INTO `booking` VALUES (1,'2024-10-29 15:21:00.000000','ONEWAY','staff','01','tvanh1803@gmail.com','2024-10-29 15:23:18.795555','CASH','CANCEL','0326917159',0.00,0.00,'A1',20000.00,5,NULL),(2,'2024-10-29 15:21:00.000000','ONEWAY','staff','01','tvanh1803@gmail.com','2024-10-29 15:23:18.796542','CASH','CANCEL','0326917159',0.00,0.00,'A2',20000.00,5,NULL),(3,'2024-10-29 15:25:00.000000','ONEWAY','staff','02','tvanh1803@gmail.com','2024-10-29 15:25:51.453816','CASH','CANCEL','0326917159',0.00,0.00,'B1',270000.00,5,NULL),(4,'2024-10-29 15:25:00.000000','ONEWAY','staff','02','tvanh1803@gmail.com','2024-10-29 15:25:51.463807','CASH','CANCEL','0326917159',0.00,0.00,'B2',270000.00,5,NULL),(5,'2024-10-29 14:39:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 15:30:29.348535','CASH','CANCEL','0901234567',0.00,0.00,'A9',145000.00,5,'user1'),(6,'2024-10-29 14:39:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 15:30:29.349552','CASH','CANCEL','0901234567',0.00,0.00,'A10',145000.00,5,'user1'),(7,'2024-10-29 14:39:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 15:35:19.000000','CASH','PAID','0901234567',0.00,2000.00,'B11',193000.00,5,NULL),(8,'2024-10-29 14:39:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 15:35:19.000000','CASH','PAID','0901234567',0.00,2000.00,'B10',193000.00,5,NULL),(9,'2024-10-29 15:41:00.000000','ONEWAY','staff','system','dienchau45@gmail.com','2024-10-29 15:42:04.931835','CASH','PAID','0901234567',0.00,0.00,'A11',20000.00,5,NULL),(10,'2024-10-29 15:41:00.000000','ONEWAY','staff','system','dienchau45@gmail.com','2024-10-29 15:42:04.932835','CASH','PAID','0901234567',0.00,0.00,'B9',20000.00,5,NULL),(11,'2024-10-29 16:06:00.000000','ONEWAY','staff','1','datvexegiare@gmail.com','2024-10-29 16:07:08.078517','CASH','CANCEL','0365899252',0.00,0.00,'A19',466164.00,4,NULL),(12,'2024-10-29 16:06:00.000000','ONEWAY','staff','1','datvexegiare@gmail.com','2024-10-29 16:07:08.079836','CASH','PAID','0365899252',0.00,0.00,'A20',466164.00,4,NULL),(13,'2024-10-29 16:05:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 16:08:11.000000','CASH','PAID','0901234567',0.00,0.00,'A6',153333.33,5,NULL),(14,'2024-10-29 16:05:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 16:08:11.000000','CASH','CANCEL','0901234567',0.00,0.00,'A7',153333.33,5,NULL),(15,'2024-10-29 16:05:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 16:08:11.000000','CASH','CANCEL','0901234567',0.00,0.00,'A8',153333.33,5,NULL),(16,'2024-10-29 16:06:00.000000','ONEWAY','staff','01','chauhuydien43@gmail.com','2024-10-29 16:13:42.263926','CASH','PAID','0901234567',0.00,0.00,'A15',391163.50,4,NULL),(17,'2024-10-29 16:06:00.000000','ONEWAY','staff','01','chauhuydien43@gmail.com','2024-10-29 16:13:42.263926','CASH','PAID','0901234567',0.00,0.00,'A16',391163.50,4,NULL),(18,'2024-10-29 16:06:00.000000','ONEWAY','staff','01','chauhuydien43@gmail.com','2024-10-29 16:13:42.263926','CASH','PAID','0901234567',0.00,0.00,'A17',391163.50,4,NULL),(19,'2024-07-01 12:33:00.000000','ONEWAY','Diễn','Châu','chauhuydien43@gmail.com','2024-07-01 12:39:47.000000','CARD','REFUNDED','0875120502',0.00,NULL,'A2',250000.00,5,'user1'),(20,'2024-10-29 16:29:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 16:33:26.000000','CARD','REFUNDED','0901234567',0.00,0.00,'A3',70000.00,5,NULL),(21,'2024-10-29 16:37:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 16:43:31.544598','CARD','PAID','0901234567',2500.00,0.00,'A1',250000.00,7,'user1'),(22,'2024-10-29 16:37:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 16:43:31.544598','CARD','PAID','0901234567',2500.00,0.00,'A2',250000.00,7,'user1'),(23,'2024-10-29 16:37:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 16:44:02.047730','CASH','CANCEL','0901234567',0.00,0.00,'B1',200000.00,7,'user1'),(24,'2024-10-29 16:37:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 16:44:02.047730','CASH','CANCEL','0901234567',0.00,0.00,'B2',200000.00,7,'user1'),(25,'2024-10-29 20:03:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-10-29 22:42:11.278700','CASH','CANCEL','0901234567',0.00,0.00,'A3',350000.00,7,'user1'),(26,'2024-10-30 12:55:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-10-30 12:59:45.767223','CASH','CANCEL','0987654321',0.00,0.00,'B3',350000.00,7,'HuyDien'),(27,'2024-07-01 12:33:00.000000','ONEWAY','Diễn','Châu','chauhuydien43@gmail.com','2024-07-01 12:39:47.000000','CARD','CANCEL','0875120502',0.00,NULL,'A2',250000.00,8,'user1'),(28,'2024-11-01 13:33:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-01 14:47:05.000000','CARD','REFUNDED','0987654321',0.00,0.00,'A2',191026.92,8,NULL),(29,'2024-11-02 00:08:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-11-02 00:28:25.655710','CASH','CANCEL','0901234567',0.00,2000.00,'A1',389163.50,4,'user1'),(30,'2024-10-12 17:11:00.000000','ONEWAY','Nguyen','Van A','nguyenvana@example.com','2024-11-04 13:03:37.000000','CASH','PAID','0901234567',0.00,0.00,'A5',841163.50,3,NULL),(31,'2024-11-04 13:44:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-11-04 13:48:21.000000','CARD','REFUNDED','0901234567',0.00,1000.00,'A2',290026.92,8,NULL),(32,'2024-11-04 19:02:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-11-04 19:03:12.000000','CARD','REFUNDED','0901234567',0.00,0.00,'A1',20000.00,5,NULL),(33,'2024-11-04 19:47:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-11-04 19:53:45.000000','CARD','REFUNDED','0901234567',0.00,0.00,'A2',20000.00,5,NULL),(34,'2024-11-06 14:23:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-11-06 14:41:46.102862','CASH','UNPAID','0901234567',0.00,0.00,'B1',20000.00,5,'user1'),(35,'2024-11-06 14:23:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-11-06 14:49:09.962522','CASH','CANCEL','0901234567',0.00,0.00,'A1',10000.00,9,'user1'),(36,'2024-11-06 14:23:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-11-06 14:49:52.308879','CARD','PAID','0901234567',1100.00,0.00,'A2',110000.00,9,'user1'),(37,'2024-11-06 19:52:00.000000','ONEWAY','helo','hole','datvexegiare@gmail.com','2024-11-06 19:53:42.302470','CASH','PAID','0326917159',0.00,0.00,'A4',10000.00,9,NULL),(38,'2024-11-06 19:50:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-11-06 19:53:50.326336','CASH','CANCEL','0901234567',0.00,0.00,'A3',10000.00,9,'user1'),(39,'2024-11-06 20:19:00.000000','ONEWAY','chào','chào','chauhuydien45@gmail.com','2024-11-06 20:20:21.971150','CASH','PAID','0901234567',0.00,0.00,'A5',10000.00,9,NULL),(40,'2024-11-06 20:19:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-11-06 20:21:25.023989','CASH','CANCEL','0901234567',0.00,0.00,'A6',10000.00,9,'user1'),(41,'2024-11-06 20:19:00.000000','ONEWAY','staff','system','datvexegiare@gmail.com','2024-11-06 20:52:43.017072','CASH','PAID','0901234567',0.00,0.00,'B1',10000.00,9,NULL),(42,'2024-11-06 20:19:00.000000','ONEWAY','Hệ thống','01','chauhuydien43@gmail.com','2024-11-06 20:53:54.659113','CASH','PAID','0365899252',0.00,0.00,'B2',10000.00,9,NULL),(43,'2024-11-06 20:54:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-11-06 20:56:36.093892','CASH','CANCEL','0901234567',0.00,0.00,'B3',10000.00,9,'user1'),(44,'2024-11-06 20:56:00.000000','ONEWAY','Châu ','Diễn','chauhuydien43@gmail.com','2024-11-06 21:00:11.614622','CASH','PAID','0321312321',0.00,0.00,'B4',10000.00,9,NULL);
UNLOCK TABLES;



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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `booking_cargo` WRITE;
INSERT INTO `booking_cargo` VALUES (1,100000.00,1,1,1),(2,150000.00,1,1,2),(3,100000.00,1,3,1),(4,150000.00,1,3,2),(5,100000.00,1,4,1),(6,150000.00,1,4,2),(7,100000.00,1,5,1),(8,150000.00,1,5,2),(9,200000.00,2,7,1),(10,150000.00,1,7,2),(11,200000.00,2,9,1),(12,150000.00,1,9,2),(13,200000.00,2,11,1),(14,150000.00,1,11,2),(15,100000.00,1,13,1),(16,300000.00,2,13,2),(17,300000.00,3,16,1),(18,100000.00,1,19,1),(19,100000.00,1,21,1),(20,150000.00,1,25,2),(21,150000.00,1,26,2),(22,100000.00,1,27,1),(23,100000.00,1,29,1),(24,200000.00,2,30,1),(25,150000.00,1,30,2),(26,100000.00,1,31,1),(27,100000.00,1,36,1);
UNLOCK TABLES;


DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `base_price` decimal(38,2) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `cargo` WRITE;
INSERT INTO `cargo` VALUES (1,100000.00,'Dịch vụ gửi xe máy',_binary '\0','Gửi xe máy',NULL),(2,150000.00,'Dịch vụ gửi xe tay gas ',_binary '\0','Gửi xe tay gas',NULL);
UNLOCK TABLES;


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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
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
  UNIQUE KEY `UK_i14w897ofrtv43vbx44rtv01u` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `discount` WRITE;
INSERT INTO `discount` VALUES (1,8652.70,'DISCOUNT-CODE-1','SUMMER20','2024-09-30 23:59:59.000000','2024-07-01 00:00:00.000000'),(2,8836.50,'DISCOUNT-CODE-2','WINTER10','2024-12-31 23:59:59.000000','2024-10-01 00:00:00.000000'),(3,3216.89,'DISCOUNT-CODE-3','FALL15','2024-11-30 23:59:59.000000','2024-09-01 00:00:00.000000'),(4,4275.03,'DISCOUNT-CODE-4','SPRING25','2025-03-31 23:59:59.000000','2025-03-01 00:00:00.000000'),(5,9853.81,'DISCOUNT-CODE-5','NEWUSER50','2024-12-31 23:59:59.000000','2024-10-01 00:00:00.000000'),(6,1615.32,'DISCOUNT-CODE-6','WEEKEND20','2024-10-31 23:59:59.000000','2024-10-01 00:00:00.000000'),(7,4764.90,'DISCOUNT-CODE-7','HOLIDAY30','2024-12-25 23:59:59.000000','2024-12-01 00:00:00.000000'),(8,1185.44,'DISCOUNT-CODE-8','STUDENT15','2024-10-31 23:59:59.000000','2024-09-01 00:00:00.000000'),(9,8973.08,'DISCOUNT-CODE-9','SENIOR20','2024-11-30 23:59:59.000000','2024-09-01 00:00:00.000000'),(10,5584.05,'DISCOUNT-CODE-10','FAMILY25','2024-12-31 23:59:59.000000','2024-10-01 00:00:00.000000'),(11,8168.04,'DISCOUNT-CODE-11','GROUP10','2025-01-31 23:59:59.000000','2024-10-01 00:00:00.000000'),(12,9250.42,'DISCOUNT-CODE-12','LOYALTY20','2025-02-28 23:59:59.000000','2024-10-01 00:00:00.000000'),(13,9807.27,'DISCOUNT-CODE-13','REFERRAL30','2024-12-31 23:59:59.000000','2024-10-01 00:00:00.000000'),(14,653.27,'DISCOUNT-CODE-14','BIRTHDAY50','2024-11-30 23:59:59.000000','2024-11-01 00:00:00.000000'),(15,2942.39,'DISCOUNT-CODE-15','ANNIVERSARY40','2025-02-28 23:59:59.000000','2024-10-01 00:00:00.000000'),(16,8153.62,'DISCOUNT-CODE-16','FLASHSALE50','2024-10-31 23:59:59.000000','2024-10-01 00:00:00.000000'),(17,7383.28,'DISCOUNT-CODE-17','EARLYBIRD20','2025-01-31 23:59:59.000000','2024-12-01 00:00:00.000000'),(18,7295.30,'DISCOUNT-CODE-18','LASTMINUTE25','2025-01-31 23:59:59.000000','2024-12-01 00:00:00.000000'),(19,1519.21,'DISCOUNT-CODE-19','NEWYEAR30','2025-01-31 23:59:59.000000','2024-12-01 00:00:00.000000'),(20,9665.49,'DISCOUNT-CODE-20','BLACKFRIDAY50','2024-11-30 23:59:59.000000','2024-11-01 00:00:00.000000'),(21,10.00,'DISCOUNT2024','Year-end discount','2024-12-31 23:59:59.000000','2024-12-01 00:00:00.000000');
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
  UNIQUE KEY `UK_phx4fa0f4397mg8kltbf7c2gy` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `driver` WRITE;
INSERT INTO `driver` VALUES (1,'123 Đường Lê Lợi, TP. Quy Nhơn, Bình Định','2002-01-01','driver1@gmail.com','Nguyễn',_binary '\0','Anh','LICENSE NO.1','0901234567',_binary '\0'),(2,'456 Đường Nguyễn Huệ, TP. Quy Nhơn, Bình Định','2002-01-01','driver2@gmail.com','Trần',_binary '\0','Bình','LICENSE NO.2','0912345678',_binary '\0'),(3,'789 Đường Ngô Quyền, TP. Quy Nhơn, Bình Định','2002-01-01','driver3@gmail.com','Lê',_binary '\0','Cường','LICENSE NO.3','0923456789',_binary '\0'),(4,'1011 Đường Trần Hưng Đạo, TP. Quy Nhơn, Bình Định','2002-01-01','driver4@gmail.com','Phạm',_binary '\0','Dương','LICENSE NO.4','0934567890',_binary '\0'),(5,'1213 Đường Nguyễn Văn Linh, TP. Quy Nhơn, Bình Định','2002-01-01','driver5@gmail.com','Hoàng',_binary '\0','Đức','LICENSE NO.5','0945678901',_binary '\0'),(6,'1415 Đường Nguyễn Tất Thành, TP. Quy Nhơn, Bình Định','2002-01-01','driver6@gmail.com','Ngô',_binary '\0','Hoàn','LICENSE NO.6','0956789012',_binary '\0'),(7,'1617 Đường Nguyễn Công Trứ, TP. Quy Nhơn, Bình Định','2002-01-01','driver7@gmail.com','Bùi',_binary '\0','Hưng','LICENSE NO.7','0967890123',_binary '\0'),(8,'1819 Đường Phan Đình Phùng, TP. Quy Nhơn, Bình Định','2002-01-01','driver8@gmail.com','Đỗ',_binary '\0','Khai','LICENSE NO.8','0978901234',_binary '\0'),(9,'2021 Đường Lý Tự Trọng, TP. Quy Nhơn, Bình Định','2002-01-01','driver9@gmail.com','Võ',_binary '\0','Long','LICENSE NO.9','0989012345',_binary '\0'),(10,'2223 Đường Bạch Đằng, TP. Quy Nhơn, Bình Định','2002-01-01','driver10@gmail.com','Đặng',_binary '\0','Minh','LICENSE NO.10','0990123456',_binary '\0'),(11,'2425 Đường Nguyễn Chí Thanh, TP. Quy Nhơn, Bình Định','2002-01-01','driver11@gmail.com','Ngô',_binary '\0','Nam','LICENSE NO.11','0901122334',_binary '\0'),(12,'2627 Đường Trần Phú, TP. Quy Nhơn, Bình Định','2002-01-01','driver12@gmail.com','Bùi',_binary '\0','Phúc','LICENSE NO.12','0912233445',_binary '\0'),(13,'2829 Đường Hoàng Diệu, TP. Quy Nhơn, Bình Định','2002-01-01','driver13@gmail.com','Lê',_binary '\0','Quân','LICENSE NO.13','0923344556',_binary '\0'),(14,'3031 Đường Phùng Khắc Khoan, TP. Quy Nhơn, Bình Định','2002-01-01','driver14@gmail.com','Phan',_binary '','Thị Thanh','LICENSE NO.14','0934455667',_binary '\0'),(15,'3233 Đường Trần Bình Trọng, TP. Quy Nhơn, Bình Định','2002-01-01','driver15@gmail.com','Nguyễn',_binary '','Thị Hương','LICENSE NO.15','0945566778',_binary '\0'),(16,'3435 Đường Phạm Hồng Thái, TP. Quy Nhơn, Bình Định','2002-01-01','driver16@gmail.com','Trần',_binary '','Thị Hoa','LICENSE NO.16','0956677889',_binary '\0'),(17,'3637 Đường Nguyễn Hữu Thọ, TP. Quy Nhơn, Bình Định','2002-01-01','driver17@gmail.com','Lê',_binary '','Thị Hạnh','LICENSE NO.17','0967788990',_binary '\0'),(18,'3839 Đường Lý Thường Kiệt, TP. Quy Nhơn, Bình Định','2002-01-01','driver18@gmail.com','Phạm',_binary '','Thị Phương','LICENSE NO.18','0978899001',_binary '\0'),(19,'4041 Đường Trần Quang Diệu, TP. Quy Nhơn, Bình Định','2002-01-01','driver19@gmail.com','Hoàng',_binary '','Thị Trang','LICENSE NO.19','0989900112',_binary '\0'),(20,'4243 Đường Nguyễn Văn Cừ, TP. Quy Nhơn, Bình Định','2002-01-01','driver20@gmail.com','Đặng',_binary '','Thị Ngọc','LICENSE NO.20','0991001223',_binary '\0'),(46,'Đội 7 thôn Lương Bình, xã Phước Thắng, huyện Tuy Phước, tỉnh Bình Định','2000-07-07','luanvanduc2000@gmail.com','Luân',_binary '\0','Văn Đức','LICENSE NO.21','0326917158',_binary '\0');
UNLOCK TABLES;


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
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `location` WRITE;
INSERT INTO `location` VALUES (1,'123 Đường Nguyễn Trãi','Thành phố Long Xuyên','Phường 1',1,1),(2,'456 Đường Trần Hưng Đạo','Thành phố Long Xuyên','Phường Bình Khánh',1,1),(3,'789 Đường 30/4','Thành phố Vũng Tàu','Phường 9',2,1),(4,'123 Đường Lê Lợi','Thành phố Vũng Tàu','Phường Thắng Nhì',2,1),(5,'234 Đường Hoàng Hoa Thám','Thành phố Bắc Giang','Phường Ngô Quyền',3,1),(6,'567 Đường Xương Giang','Thành phố Bắc Giang','Phường Trần Phú',3,1),(7,'89 Đường Võ Nguyên Giáp','Thành phố Bắc Kạn','Phường Sông Cầu',4,1),(8,'12 Đường Thanh Niên','Thành phố Bắc Kạn','Phường Đức Xuân',4,1),(9,'345 Đường Võ Thị Sáu','Thành phố Bạc Liêu','Phường 3',5,1),(10,'678 Đường Trần Phú','Thành phố Bạc Liêu','Phường 1',5,1),(11,'456 Đường Lý Thái Tổ','Thành phố Bắc Ninh','Phường Suối Hoa',6,1),(12,'789 Đường Ngô Gia Tự','Thành phố Bắc Ninh','Phường Ninh Xá',6,1),(13,'567 Đường Đồng Khởi','Thành phố Bến Tre','Phường 4',7,1),(14,'890 Đường Nguyễn Đình Chiểu','Thành phố Bến Tre','Phường 2',7,1),(15,'123 Đường Trần Hưng Đạo','Thành phố Quy Nhơn','Phường Lê Lợi',8,1),(16,'456 Đường Nguyễn Huệ','Thành phố Quy Nhơn','Phường Hải Cảng',8,1),(17,'789 Đường Cách Mạng Tháng 8','Thành phố Thủ Dầu Một','Phường Phú Cường',9,1),(18,'123 Đường Nguyễn Du','Thành phố Thủ Dầu Một','Phường Chánh Nghĩa',9,1),(19,'456 Đường Lê Quý Đôn','Thành phố Đồng Xoài','Phường Tân Bình',10,1),(20,'789 Đường Phú Riềng Đỏ','Thành phố Đồng Xoài','Phường Tân Xuân',10,1),(21,'123 Đường Nguyễn Thông','Thành phố Phan Thiết','Phường Phú Thủy',11,1),(22,'456 Đường Hùng Vương','Thành phố Phan Thiết','Phường Bình Hưng',11,1),(23,'789 Đường Lý Thường Kiệt','Thành phố Cà Mau','Phường 8',12,1),(24,'123 Đường Trần Hưng Đạo','Thành phố Cà Mau','Phường 2',12,1),(25,'456 Đường 3/2','Quận Ninh Kiều','Phường Xuân Khánh',13,1),(26,'789 Đường Nguyễn Văn Linh','Quận Ninh Kiều','Phường An Khánh',13,1),(27,'123 Đường Kim Đồng','Thành phố Cao Bằng','Phường Hợp Giang',14,1),(28,'456 Đường Bế Văn Đàn','Thành phố Cao Bằng','Phường Tân Giang',14,1),(29,'123 Đường Lê Duẩn','Quận Hải Châu','Phường Hải Châu 1',15,1),(30,'456 Đường Nguyễn Văn Linh','Quận Thanh Khê','Phường Thạc Gián',15,1),(31,'789 Đường Lý Thái Tổ','Thành phố Buôn Ma Thuột','Phường Tân Lợi',16,1),(32,'123 Đường Lê Hồng Phong','Thành phố Buôn Ma Thuột','Phường Thống Nhất',16,1),(33,'456 Đường Lý Tự Trọng','Thành phố Gia Nghĩa','Phường Nghĩa Trung',17,1),(34,'789 Đường Nguyễn Tất Thành','Thành phố Gia Nghĩa','Phường Nghĩa Tân',17,1),(35,'123 Đường Võ Nguyên Giáp','Thành phố Điện Biên Phủ','Phường Tân Thanh',18,1),(36,'456 Đường Nguyễn Chí Thanh','Thành phố Điện Biên Phủ','Phường Mường Thanh',18,1),(37,'789 Đường Võ Thị Sáu','Thành phố Biên Hòa','Phường Quyết Thắng',19,1),(38,'123 Đường Đồng Khởi','Thành phố Biên Hòa','Phường Tân Hiệp',19,1),(39,'456 Đường Nguyễn Sinh Sắc','Thành phố Cao Lãnh','Phường 1',20,1),(40,'789 Đường Hùng Vương','Thành phố Cao Lãnh','Phường Mỹ Phú',20,1),(41,'123 Đường Trần Phú','Thành phố Pleiku','Phường Phù Đổng',21,1),(42,'456 Đường Lý Thái Tổ','Thành phố Pleiku','Phường Hoa Lư',21,1),(43,'789 Đường Trần Hưng Đạo','Thành phố Hà Giang','Phường Minh Khai',22,1),(44,'123 Đường Lý Thường Kiệt','Thành phố Hà Giang','Phường Ngọc Hà',22,1),(45,'456 Đường Lê Hoàn','Thành phố Phủ Lý','Phường Lê Hồng Phong',23,1),(46,'789 Đường Nguyễn Văn Trỗi','Thành phố Phủ Lý','Phường Quang Trung',23,1),(47,'123 Đường Kim Mã','Quận Ba Đình','Phường Ngọc Khánh',24,1),(48,'456 Đường Giải Phóng','Quận Hai Bà Trưng','Phường Đồng Tâm',24,1),(49,'789 Đường Hà Huy Tập','Thành phố Hà Tĩnh','Phường Trần Phú',25,1),(50,'123 Đường Phan Đình Phùng','Thành phố Hà Tĩnh','Phường Nam Hà',25,1),(51,'456 Đường Trần Hưng Đạo','Thành phố Hải Dương','Phường Hải Tân',26,1),(52,'789 Đường Nguyễn Lương Bằng','Thành phố Hải Dương','Phường Nhị Châu',26,1),(53,'123 Đường Tô Hiệu','Quận Lê Chân','Phường Trần Nguyên Hãn',27,1),(54,'456 Đường Lạch Tray','Quận Ngô Quyền','Phường Lạch Tray',27,1),(55,'789 Đường 1/5','Thành phố Vị Thanh','Phường 5',28,1),(56,'123 Đường Trần Hưng Đạo','Thành phố Vị Thanh','Phường 7',28,1),(57,'456 Đường Cù Chính Lan','Thành phố Hòa Bình','Phường Thái Bình',29,1),(58,'789 Đường Trần Hưng Đạo','Thành phố Hòa Bình','Phường Phương Lâm',29,1),(59,'123 Đường Tô Hiệu','Thành phố Hưng Yên','Phường Hiến Nam',30,1),(60,'456 Đường Nguyễn Văn Linh','Thành phố Hưng Yên','Phường Lam Sơn',30,1),(61,'789 Đường Trần Phú','Thành phố Nha Trang','Phường Lộc Thọ',31,1),(62,'123 Đường Phạm Văn Đồng','Thành phố Nha Trang','Phường Vĩnh Hải',31,1),(63,'456 Đường Nguyễn Trung Trực','Thành phố Rạch Giá','Phường An Hòa',32,1),(64,'789 Đường Lê Lợi','Thành phố Rạch Giá','Phường Vĩnh Thanh Vân',32,1),(65,'123 Đường Phan Đình Phùng','Thành phố Kon Tum','Phường Quyết Thắng',33,1),(66,'456 Đường Trường Chinh','Thành phố Kon Tum','Phường Trường Chinh',33,1),(67,'789 Đường Trần Hưng Đạo','Thành phố Lai Châu','Phường Đoàn Kết',34,1),(68,'123 Đường Lê Lai','Thành phố Lai Châu','Phường Quyết Thắng',34,1),(69,'456 Đường 3/4','Thành phố Đà Lạt','Phường 1',35,1),(70,'789 Đường Trần Phú','Thành phố Đà Lạt','Phường 4',35,1),(71,'123 Đường Trần Đăng Ninh','Thành phố Lạng Sơn','Phường Chi Lăng',36,1),(72,'456 Đường Phai Vệ','Thành phố Lạng Sơn','Phường Đông Kinh',36,1),(73,'789 Đường Hồng Hà','Thành phố Lào Cai','Phường Kim Tân',37,1),(74,'123 Đường Hoàng Liên','Thành phố Lào Cai','Phường Cốc Lếu',37,1),(75,'456 Đường Hùng Vương','Thành phố Tân An','Phường 2',38,1),(76,'789 Đường Trần Hưng Đạo','Thành phố Tân An','Phường 6',38,1),(77,'123 Đường Trần Đăng Ninh','Thành phố Nam Định','Phường Ngô Quyền',39,1),(78,'456 Đường Hàn Thuyên','Thành phố Nam Định','Phường Bà Triệu',39,1),(79,'789 Đường Quang Trung','Thành phố Vinh','Phường Quang Trung',40,1),(80,'123 Đường Lê Duẩn','Thành phố Vinh','Phường Lê Lợi',40,1),(81,'456 Đường Trần Hưng Đạo','Thành phố Ninh Bình','Phường Đông Thành',41,1),(82,'789 Đường Lương Văn Tụy','Thành phố Ninh Bình','Phường Phúc Thành',41,1),(83,'123 Đường 21/8','Thành phố Phan Rang - Tháp Chàm','Phường Phủ Hà',42,1),(84,'456 Đường Ngô Gia Tự','Thành phố Phan Rang - Tháp Chàm','Phường Mỹ Bình',42,1),(85,'789 Đường Hùng Vương','Thành phố Việt Trì','Phường Gia Cẩm',43,1),(86,'123 Đường Trần Phú','Thành phố Việt Trì','Phường Tiên Cát',43,1),(87,'456 Đường Nguyễn Huệ','Thành phố Tuy Hòa','Phường 5',44,1),(88,'789 Đường Trần Hưng Đạo','Thành phố Tuy Hòa','Phường 7',44,1),(89,'123 Đường Trần Hưng Đạo','Thành phố Đồng Hới','Phường Đồng Phú',45,1),(90,'456 Đường Quang Trung','Thành phố Đồng Hới','Phường Nam Lý',45,1),(91,'789 Đường Hùng Vương','Thành phố Tam Kỳ','Phường Tân Thạnh',46,1),(92,'123 Đường Phan Bội Châu','Thành phố Tam Kỳ','Phường An Mỹ',46,1),(93,'456 Đường Quang Trung','Thành phố Quảng Ngãi','Phường Lê Hồng Phong',47,1),(94,'789 Đường Hùng Vương','Thành phố Quảng Ngãi','Phường Trần Phú',47,1),(95,'123 Đường Trần Hưng Đạo','Thành phố Hạ Long','Phường Hồng Hà',48,1),(96,'456 Đường Bạch Đằng','Thành phố Hạ Long','Phường Hồng Gai',48,1),(97,'789 Đường Hùng Vương','Thành phố Đông Hà','Phường 5',49,1),(98,'123 Đường Trần Hưng Đạo','Thành phố Đông Hà','Phường 3',49,1),(99,'456 Đường Lê Hồng Phong','Thành phố Sóc Trăng','Phường 3',50,1),(100,'789 Đường Phú Lợi','Thành phố Sóc Trăng','Phường 2',50,1),(101,'123 Đường Tô Hiệu','Thành phố Sơn La','Phường Quyết Thắng',51,1),(102,'456 Đường 3/2','Thành phố Sơn La','Phường Tô Hiệu',51,1),(103,'789 Đường 30/4','Thành phố Tây Ninh','Phường 1',52,1),(104,'123 Đường Lê Lợi','Thành phố Tây Ninh','Phường 2',52,1),(105,'456 Đường Lý Bôn','Thành phố Thái Bình','Phường Bồ Xuyên',53,1),(106,'789 Đường Trần Hưng Đạo','Thành phố Thái Bình','Phường Trần Hưng Đạo',53,1),(107,'123 Đường Hoàng Văn Thụ','Thành phố Thái Nguyên','Phường Phan Đình Phùng',54,1),(108,'456 Đường Cách Mạng Tháng 8','Thành phố Thái Nguyên','Phường Hoàng Văn Thụ',54,1),(109,'789 Đường Trần Phú','Thành phố Thanh Hóa','Phường Ba Đình',55,1),(110,'123 Đường Bà Triệu','Thành phố Thanh Hóa','Phường Điện Biên',55,1),(111,'456 Đường Hùng Vương','Thành phố Huế','Phường Phú Nhuận',56,1),(112,'789 Đường Lê Lợi','Thành phố Huế','Phường Vĩnh Ninh',56,1),(113,'123 Đường 30/4','Thành phố Mỹ Tho','Phường 1',57,1),(114,'456 Đường Lý Thường Kiệt','Thành phố Mỹ Tho','Phường 2',57,1),(115,'789 Đường Nguyễn Đình Chiểu','Thành phố Trà Vinh','Phường 7',58,1),(116,'123 Đường Phạm Ngũ Lão','Thành phố Trà Vinh','Phường 9',58,1),(117,'456 Đường Tân Trào','Thành phố Tuyên Quang','Phường Minh Xuân',59,1),(118,'789 Đường Lê Lợi','Thành phố Tuyên Quang','Phường Phan Thiết',59,1),(119,'123 Đường 3/2','Thành phố Vĩnh Long','Phường 1',60,1),(120,'456 Đường Phạm Hùng','Thành phố Vĩnh Long','Phường 9',60,1),(121,'789 Đường Mê Linh','Thành phố Vĩnh Yên','Phường Khai Quang',61,1),(122,'123 Đường Nguyễn Tất Thành','Thành phố Vĩnh Yên','Phường Ngô Quyền',61,1),(123,'456 Đường Điện Biên','Thành phố Yên Bái','Phường Đồng Tâm',62,1),(124,'789 Đường Trần Phú','Thành phố Yên Bái','Phường Nguyễn Phúc',62,1),(125,'123 Đường Nguyễn Thị Minh Khai','Quận 3','Phường 6',63,1),(126,'456 Đường Cộng Hòa','Quận Tân Bình','Phường 4',63,1),(127,'123 ABC','klạdfkl','sdfdf',1,0),(128,'123 Đường Nguyễn Trãi1','Phường 1','Phường 1',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `loyalty_transaction` WRITE;
INSERT INTO `loyalty_transaction` VALUES (1,-4000.00,'2024-10-29 15:35:19.000000','USE',NULL,NULL),(2,2500.00,'2024-10-31 20:55:23.581342','EARN',21,'user1'),(3,2500.00,'2024-10-31 20:55:23.871338','EARN',22,'user1'),(4,-2000.00,'2024-11-02 00:28:25.733037','USE',29,'user1'),(5,-1000.00,'2024-11-04 13:48:21.000000','USE',NULL,NULL),(6,1100.00,'2024-11-10 19:59:36.408956','EARN',36,'user1');
UNLOCK TABLES;


DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` text,
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `notification` WRITE;
INSERT INTO `notification` VALUES (4,'Chuyến đi của bạn từ Bình Định (Đón tại: 123 Đường Trần Hưng Đạo, Phường Lê Lợi, Thành phố Quy Nhơn, Bình Định) đến Bình Dương (Trả tại: 789 Đường Cách Mạng Tháng 8, Phường Phú Cường, Thành phố Thủ Dầu Một, Bình Dương) đã hoàn thành. Bạn đã nhận được 4913.4730 điểm xu.','user1','INDIVIDUAL','2024-10-25 19:35:19.071659','Hoàn thành chuyến đi','system',3),(5,'Vé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-26 22:00:00.053196','Nhắc nhở thanh toán','system',NULL),(6,'Vé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-26 22:00:00.208390','Vé đặt đã bị hủy','system',NULL),(7,'Vé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-29 14:41:41.136239','Nhắc nhở thanh toán','system',NULL),(8,'Vé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-29 14:41:41.169091','Nhắc nhở thanh toán','system',NULL),(9,'Vé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-29 14:41:41.186423','Nhắc nhở thanh toán','system',NULL),(10,'Vé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-29 14:41:41.227625','Vé đặt đã bị hủy','system',NULL),(11,'Vé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-29 14:41:41.281062','Vé đặt đã bị hủy','system',NULL),(12,'Vé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-29 14:41:41.350263','Vé đặt đã bị hủy','system',NULL),(13,'Chuyến đi của bạn từ An Giang (Đón tại: 123 Đường Nguyễn Trãi, Phường 1, Thành phố Long Xuyên, An Giang) đến Bà Rịa - Vũng Tàu (Trả tại: 123 Đường Lê Lợi, Phường Thắng Nhì, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu) đã hoàn thành. Bạn đã nhận được 2500.0000 điểm xu.','user1','INDIVIDUAL','2024-10-31 20:55:23.845798','Hoàn thành chuyến đi','system',7),(14,'Chuyến đi của bạn từ An Giang (Đón tại: 123 Đường Nguyễn Trãi, Phường 1, Thành phố Long Xuyên, An Giang) đến Bà Rịa - Vũng Tàu (Trả tại: 123 Đường Lê Lợi, Phường Thắng Nhì, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu) đã hoàn thành. Bạn đã nhận được 2500.0000 điểm xu.','user1','INDIVIDUAL','2024-10-31 20:55:24.129608','Hoàn thành chuyến đi','system',7),(15,'Kính chào Nguyễn Hải,\nVé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-31 21:00:00.047412','Nhắc nhở thanh toán','system',NULL),(16,'Kính chào Nguyễn Hải,\nVé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-31 21:00:00.190269','Nhắc nhở thanh toán','system',NULL),(17,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-31 21:00:00.205319','Vé đặt đã bị hủy','system',NULL),(18,'Kính chào Nguyễn Hải,\nVé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-31 21:00:00.321425','Nhắc nhở thanh toán','system',NULL),(19,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-31 21:00:00.412751','Vé đặt đã bị hủy','system',NULL),(20,'Kính chào Châu  Diễn,\nVé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','HuyDien','INDIVIDUAL','2024-10-31 21:00:00.438972','Nhắc nhở thanh toán','system',NULL),(21,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-31 21:00:00.703413','Vé đặt đã bị hủy','system',NULL),(22,'Kính chào Châu  Diễn,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','HuyDien','INDIVIDUAL','2024-10-31 21:00:00.881087','Vé đặt đã bị hủy','system',NULL),(23,'Kính chào Nguyễn Hải,\nChuyến xe của quý khách sẽ khởi hành vào 2024-10-31T18:30.','user1','INDIVIDUAL','2024-11-04 09:00:00.011255','Nhắc nhở khởi hành','system',NULL),(24,'Kính chào Nguyễn Hải,\nChuyến xe của quý khách sẽ khởi hành vào 2024-10-31T18:30.','user1','INDIVIDUAL','2024-11-04 09:00:00.074767','Nhắc nhở khởi hành','system',NULL),(25,'Kính chào Nguyễn Hải,\nChuyến xe của quý khách sẽ khởi hành vào 2024-10-31T18:30.','user1','INDIVIDUAL','2024-11-06 09:00:00.056756','Nhắc nhở khởi hành','system',NULL),(26,'Kính chào Nguyễn Hải,\nChuyến xe của quý khách sẽ khởi hành vào 2024-10-31T18:30.','user1','INDIVIDUAL','2024-11-06 09:00:00.300793','Nhắc nhở khởi hành','system',NULL),(27,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-11-07 15:17:00.345359','Vé đặt đã bị hủy','system',NULL),(28,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-11-07 15:17:00.463387','Vé đặt đã bị hủy','system',NULL),(29,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-11-07 15:17:00.542101','Vé đặt đã bị hủy','system',NULL),(30,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-11-07 15:17:00.611991','Vé đặt đã bị hủy','system',NULL),(31,'Chuyến đi của bạn từ An Giang (Đón tại: 456 Đường Trần Hưng Đạo, Phường Bình Khánh, Thành phố Long Xuyên, An Giang) đến Bà Rịa - Vũng Tàu (Trả tại: 789 Đường 30/4, Phường 9, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu) đã hoàn thành. Bạn đã nhận được 1100.0000 điểm xu.','user1','INDIVIDUAL','2024-11-10 19:59:36.702112','Hoàn thành chuyến đi','system',9);
UNLOCK TABLES;


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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `payment_history` WRITE;
INSERT INTO `payment_history` VALUES (1,'PAID',NULL,'2024-10-29 15:23:18.795555',1),(2,'PAID',NULL,'2024-10-29 15:23:18.796542',2),(3,'PAID',NULL,'2024-10-29 15:25:51.453816',3),(4,'PAID',NULL,'2024-10-29 15:25:51.463807',4),(5,'UNPAID',NULL,'2024-10-29 15:30:29.348535',5),(6,'UNPAID',NULL,'2024-10-29 15:30:29.349552',6),(7,'UNPAID',NULL,'2024-10-29 15:35:19.444954',7),(8,'UNPAID',NULL,'2024-10-29 15:35:19.445955',8),(9,'PAID',NULL,'2024-10-29 15:42:04.931835',9),(10,'PAID',NULL,'2024-10-29 15:42:04.932835',10),(11,'PAID',NULL,'2024-10-29 16:07:08.078517',11),(12,'PAID',NULL,'2024-10-29 16:07:08.079836',12),(13,'UNPAID',NULL,'2024-10-29 16:08:11.240431',13),(14,'UNPAID',NULL,'2024-10-29 16:08:11.242967',14),(15,'UNPAID',NULL,'2024-10-29 16:08:11.242967',15),(16,'PAID',NULL,'2024-10-29 16:13:42.263926',16),(17,'PAID',NULL,'2024-10-29 16:13:42.263926',17),(18,'PAID',NULL,'2024-10-29 16:13:42.263926',18),(19,'CANCEL','PAID','2024-10-29 16:32:05.186353',1),(20,'CANCEL','UNPAID','2024-10-29 16:32:18.778448',5),(21,'PAID',NULL,'2024-10-29 16:33:26.002464',19),(22,'PAID',NULL,'2024-10-29 16:33:26.003491',20),(23,'CANCEL','PAID','2024-10-29 16:33:50.877323',19),(24,'REFUNDED','CANCEL','2024-10-29 16:33:50.877323',19),(25,'PAID',NULL,'2024-10-29 16:43:31.544598',21),(26,'PAID',NULL,'2024-10-29 16:43:31.544598',22),(27,'UNPAID',NULL,'2024-10-29 16:44:02.047730',23),(28,'UNPAID',NULL,'2024-10-29 16:44:02.047730',24),(29,'UNPAID',NULL,'2024-10-29 22:42:11.278700',25),(30,'UNPAID',NULL,'2024-10-30 12:59:45.767223',26),(31,'CANCEL','UNPAID','2024-10-31 21:00:00.192272',23),(32,'CANCEL','UNPAID','2024-10-31 21:00:00.396737',24),(33,'CANCEL','UNPAID','2024-10-31 21:00:00.673208',25),(34,'CANCEL','UNPAID','2024-10-31 21:00:00.853069',26),(35,'PAID',NULL,'2024-11-01 12:19:27.017016',27),(36,'PAID',NULL,'2024-11-01 14:47:05.407454',28),(37,'UNPAID',NULL,'2024-11-02 00:28:25.655710',29),(38,'CANCEL','PAID','2024-11-04 08:45:03.973250',2),(39,'CANCEL','UNPAID','2024-11-04 08:58:26.612953',29),(40,'CANCEL','PAID','2024-11-04 08:59:32.986674',11),(41,'CANCEL','PAID','2024-11-04 09:46:52.962954',3),(42,'PAID','UNPAID','2024-11-04 09:48:59.637077',14),(43,'CANCEL','PAID','2024-11-04 09:49:17.732230',14),(44,'PAID','UNPAID','2024-11-04 09:50:21.797135',13),(45,'PAID','UNPAID','2024-11-04 09:50:27.963991',15),(46,'CANCEL','PAID','2024-11-04 09:51:32.252747',15),(47,'UNPAID','PAID','2024-11-04 09:51:38.055370',13),(48,'PAID','UNPAID','2024-11-04 09:51:43.937841',13),(49,'CANCEL','PAID','2024-11-04 09:53:29.627260',20),(50,'REFUNDED','CANCEL','2024-11-04 10:56:14.703505',20),(51,'CANCEL','UNPAID','2024-11-04 12:43:11.960114',6),(52,'PAID','UNPAID','2024-11-04 12:44:20.169600',7),(53,'PAID','PAID','2024-11-04 12:55:13.507005',7),(54,'PAID','PAID','2024-11-04 12:55:25.131301',7),(55,'CANCEL','PAID','2024-11-04 12:58:02.567849',28),(56,'UNPAID',NULL,'2024-11-04 13:03:37.243698',30),(57,'PAID','UNPAID','2024-11-04 13:04:15.619163',8),(58,'CANCEL','PAID','2024-11-04 13:17:20.963716',4),(69,'REFUNDED','REFUNDED','2024-11-04 13:40:47.859833',19),(70,'PAID',NULL,'2024-11-04 13:48:21.228453',31),(71,'REFUNDED','REFUNDED','2024-11-04 13:56:55.202171',19),(72,'CANCEL','PAID','2024-11-04 14:02:47.938838',27),(73,'CANCEL','CANCEL','2024-11-04 14:03:48.597853',27),(74,'CANCEL','PAID','2024-11-04 14:29:58.874633',31),(75,'PAID','UNPAID','2024-11-04 15:38:10.923478',30),(76,'PAID','PAID','2024-11-04 15:57:11.580965',30),(77,'PAID','PAID','2024-11-04 16:01:49.274358',30),(78,'PAID','PAID','2024-11-04 16:06:16.253038',30),(79,'PAID','PAID','2024-11-04 16:09:22.048305',30),(80,'PAID','PAID','2024-11-04 16:09:26.943418',30),(81,'REFUNDED','CANCEL','2024-11-04 16:12:16.289451',28),(82,'PAID','PAID','2024-11-04 16:13:12.029053',30),(83,'REFUNDED','CANCEL','2024-11-04 16:15:46.750882',31),(84,'PAID',NULL,'2024-11-04 19:03:12.048378',32),(85,'PAID',NULL,'2024-11-04 19:53:45.335031',33),(86,'UNPAID',NULL,'2024-11-06 14:41:46.102862',34),(87,'UNPAID',NULL,'2024-11-06 14:49:09.962522',35),(88,'PAID',NULL,'2024-11-06 14:49:52.308879',36),(89,'PAID',NULL,'2024-11-06 19:53:42.302470',37),(90,'UNPAID',NULL,'2024-11-06 19:53:50.326336',38),(91,'PAID',NULL,'2024-11-06 20:20:21.971150',39),(92,'UNPAID',NULL,'2024-11-06 20:21:25.023989',40),(93,'PAID',NULL,'2024-11-06 20:52:43.017072',41),(94,'PAID',NULL,'2024-11-06 20:53:54.659113',42),(95,'UNPAID',NULL,'2024-11-06 20:56:36.093892',43),(96,'PAID',NULL,'2024-11-06 21:00:11.614622',44),(97,'CANCEL','UNPAID','2024-11-07 15:17:00.305332',35),(98,'CANCEL','UNPAID','2024-11-07 15:17:00.448379',38),(99,'CANCEL','UNPAID','2024-11-07 15:17:00.526420',40),(100,'CANCEL','UNPAID','2024-11-07 15:17:00.604934',43),(101,'CANCEL','PAID','2024-11-07 15:32:49.732170',32),(102,'REFUNDED','CANCEL','2024-11-07 15:33:01.975969',32),(103,'CANCEL','PAID','2024-11-15 13:57:10.426485',33),(104,'REFUNDED','CANCEL','2024-11-15 13:57:28.937350',33);
UNLOCK TABLES;


DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
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
  KEY `FKsdujhwxnw678xtqnvqre9gl3h` (`trip_id`),
  KEY `FK117o6riye2xefmyeaanbvdx1i` (`username`),
  CONSTRAINT `FK117o6riye2xefmyeaanbvdx1i` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FKsdujhwxnw678xtqnvqre9gl3h` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `review` WRITE;
INSERT INTO `review` VALUES (1,5,'tuyệt vời','2024-10-25 19:35:41.010868',5,5,3,'user1'),(2,4,'tốt','2024-11-01 14:42:30.600832',4,4,7,'user1');
UNLOCK TABLES;


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `role_code` enum('ROLE_ADMIN','ROLE_CREATE','ROLE_CUSTOMER','ROLE_DELETE','ROLE_READ','ROLE_STAFF','ROLE_UPDATE') DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `token` WRITE;
INSERT INTO `token` VALUES (1,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTcyOTc1OTg3MCwiZXhwIjoxNzI5OTMyNjcwfQ.N3WaXYTRI3cjQNtBBuhZ0obASqf9HAd-_o2v7Jjsww4','BEARER','user1'),(2,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTcyOTc2MjIxNywiZXhwIjoxNzI5OTM1MDE3fQ.TOV3avF8W-8zTCyYKLygKCX8LcJS8b8p0oUn-r0NCp4','BEARER','user1'),(3,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyOTc3MjIyMywiZXhwIjoxNzI5OTQ1MDIzfQ.KccfjfqGy1h9XWe8x-xo_BRc4AaDtjLFoMbvZgW6GI0','BEARER','admin'),(4,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyOTg0NjEzOCwiZXhwIjoxNzMwMDE4OTM4fQ.o7LZCfg0AqhsO2nK61byVpoYsV_vPTNbVePLIge4GFI','BEARER','admin'),(5,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuZ3V5ZW52YW5hIiwiaWF0IjoxNzI5ODYzODYwLCJleHAiOjE3MzA0Njg2NjB9.vcMJr_ws3Hp6vrK5u2T9tkmKBxF7kY5yzzZghS53EeU','BEARER','nguyenvana'),(6,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyOTg2NjQ1NiwiZXhwIjoxNzMwNDcxMjU2fQ.kSqCFLAtP1E4B8fuhaWPb3mbZbpwn6r-4-Jk-B1qAOc','BEARER','admin'),(7,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTcyOTk5OTUwMCwiZXhwIjoxNzMwNjA0MzAwfQ.giwqdyiyb__Ec5NDvPOJvj0jiSA8VG4OWHD-WmDCxnM','BEARER','user1'),(8,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTcyOTk5OTUwMSwiZXhwIjoxNzMwNjA0MzAxfQ.2K9-8gyjtwSil3mqkr-Sq4fm6PW1Fz6OAql0r7jbOLc','BEARER','user1'),(9,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMiIsImlhdCI6MTcyOTk5OTk2NywiZXhwIjoxNzMwNjA0NzY3fQ.mWlTTjgEsSrLJBFHBhUhNGd0cokab-koVvQNcSU3W1w','BEARER','user2'),(10,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDAwMDQxNCwiZXhwIjoxNzMwNjA1MjE0fQ.2aYrR1opIhnylF_dri9SLL2QEpwk3XPiv6NthTVa5wM','BEARER','user1'),(11,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDAwMDQyNywiZXhwIjoxNzMwNjA1MjI3fQ.qsARugkxWfKAHjvBuC4mGabfViXnXoE-gXXL5nVTDF0','BEARER','user1'),(12,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDAwNjUxNiwiZXhwIjoxNzMwNjExMzE2fQ.dwCBfCXMVp_mCye-yJMtMrSpTw8eDyK1ISaHjrocuV4','BEARER','user1'),(13,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDA0NjM3NywiZXhwIjoxNzMwNjUxMTc3fQ.sw5MFz6o-Le0vnKCE9Rt3P1eABc5S7wBpdforwJKzuI','BEARER','user1'),(14,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMDA0NzA1MSwiZXhwIjoxNzMwNjUxODUxfQ.UzOH2mfEVonMbfhm_9y19ZvGlIJPvkSghhVtThyhv4Y','BEARER','admin'),(15,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMDA4MTY4NCwiZXhwIjoxNzMwNjg2NDg0fQ.DeSumZVaJwTaxVa2GfRWLEMiRof6KjwdJFVykWmyEyU','BEARER','admin'),(16,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDE5NDgyOSwiZXhwIjoxNzMwNzk5NjI5fQ.n8N4L3X6hmWhBQW-QoYGgT2MTATwJlKj_v_RiH4aAAo','BEARER','user1'),(17,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMDIwNDExNCwiZXhwIjoxNzMwODA4OTE0fQ.jcDtHj_nCOYUqIzlN7SY3DiPDyddMISHi5sEO2bmxBE','BEARER','admin'),(18,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMDIwNDEzNSwiZXhwIjoxNzMwODA4OTM1fQ.7GJOvkqwJgMAeQ-1VsSFHkvt-zSc0UeTeS7QBMAPa0o','BEARER','admin'),(19,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDIwNDE0OCwiZXhwIjoxNzMwODA4OTQ4fQ.9sYZb2sJATE6RQ9p541fXCcqr3woBDnAATh_KQ87ywg','BEARER','user1'),(20,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDIwNDE5NSwiZXhwIjoxNzMwODA4OTk1fQ.k7TNqGa2zZnF6TjyhS3yz4BYdl1UF0O1mtlDRiG64ZQ','BEARER','user1'),(21,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMwMjY3OTI2LCJleHAiOjE3MzA4NzI3MjZ9.N9FSI5GpECxq031rp26CsgNSt_SSlY-lNiW_Wxghnws','BEARER','HuyDien'),(22,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDM4MzAxMywiZXhwIjoxNzMwOTg3ODEzfQ.1DUR0qhVTzc1glPbIjbRjlCjJ1bmtZE5_TuaCvDynsU','BEARER','user1'),(23,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDM4MzAxNCwiZXhwIjoxNzMwOTg3ODE0fQ.ALIb05kW9U9UIreDoH-Sj7-SRyEPvNHqYCfVhwNISCU','BEARER','user1'),(24,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMDM4MzExNywiZXhwIjoxNzMwOTg3OTE3fQ.X1K2EWOpowNf0A8Qp_GiIf0ecy2BTukgfvnFLTSxQq0','BEARER','admin'),(25,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMDM4Mzc4NiwiZXhwIjoxNzMwOTg4NTg2fQ.MmfMtxDonNsgR4B8bxQdGDV1aFxeUH-iQ7V2-hIhQRE','BEARER','admin'),(26,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMDM4MzgwMiwiZXhwIjoxNzMwOTg4NjAyfQ.NNNTEf5euAwyq3L0Gqv-fYi8Z4BF9NDNZWRkeOlsdn4','BEARER','admin'),(27,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDM4NDA3NywiZXhwIjoxNzMwOTg4ODc3fQ.MJhN5_9O2g5L_2rZLh9y9yeAYYs6_zJhRsMDiJvG_1c','BEARER','user1'),(28,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMDM4NDkyMSwiZXhwIjoxNzMwOTg5NzIxfQ.w7EANT20EDlS8PcqjcyPOXWI0rxUSVaxCq6ib65FYlc','BEARER','admin'),(29,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMDM5MzQyOCwiZXhwIjoxNzMwOTk4MjI4fQ.k9B16SkOYOiPUDloCL3GP4a1nBdnDknhhfNxkp2l7ig','BEARER','admin'),(30,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMDQzNzk4MywiZXhwIjoxNzMxMDQyNzgzfQ.s4REKRBk-B5VGlKicRSQvwa4zCY00pNK5cDbWXL8TSA','BEARER','admin'),(31,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDQ0NjM2MiwiZXhwIjoxNzMxMDUxMTYyfQ.OVUYRCY9UF7F27lYrCeufjLsKagdjdB1Ae0FhYw0U0E','BEARER','user1'),(32,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMwNDQ3MTIwLCJleHAiOjE3MzEwNTE5MjB9.A8x1EebFaqhEzOc_K47pxEfe3YmBe-pkyY2g4XKh1cA','BEARER','HuyDien'),(33,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDQ0Nzc0NywiZXhwIjoxNzMxMDUyNTQ3fQ.YFYBoKxAngSV3Puu8aR-YuAdZx4yE6nJHIaY248sj-Y','BEARER','user1'),(34,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMwNDc0NzA2LCJleHAiOjE3MzEwNzk1MDZ9.0cluxqGvvPws657juP6d6Q1GNWZMUNyCyVRbXogPjNo','BEARER','HuyDien'),(35,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDQ3OTU4MSwiZXhwIjoxNzMxMDg0MzgxfQ.AZF5mvpm3yQ_pnymlAeBEam-1BgSzyiMLeVOVG5e8_0','BEARER','user1'),(36,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDQ4MTI5NywiZXhwIjoxNzMxMDg2MDk3fQ.oK20Nhxr2oULMkrRgKfnnEbL7xVMYww_1PtYuDSc3zc','BEARER','user1'),(37,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMDUxODkyNiwiZXhwIjoxNzMxMTIzNzI2fQ.7cb0KGD61L6L_DIV2UCOywON66oGZdFO3ALdSuY0fIE','BEARER','admin'),(38,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyNyIsImlhdCI6MTczMDU2NDA5NSwiZXhwIjoxNzMxMTY4ODk1fQ.vus34zixP-13abbWsRLG8sRCGWKHaioLtKu15Qvda1U','BEARER','user7'),(39,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyNyIsImlhdCI6MTczMDU2NDA5NywiZXhwIjoxNzMxMTY4ODk3fQ.9cTfVMGzoU5nQswqZ4L0f02KxVeTH2VDEV0cHM_66bs','BEARER','user7'),(40,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMDU2NDEyOSwiZXhwIjoxNzMxMTY4OTI5fQ.I_dX1bBx4s0bMW8ivhVf_8x-I9a-4tPiwNd25KF_2dw','BEARER','user1'),(41,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMDY4NDY4OSwiZXhwIjoxNzMxMjg5NDg5fQ.IJ5qsw6CJlzUcrVaM2qCKl9Rph4JJsjIiKmBXxpv2po','BEARER','admin'),(42,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMwODc4MDUwLCJleHAiOjE3MzE0ODI4NTB9.wjpVuQzdfJBzrNyD5FwshbpsUBkrfFN10GuazmyAfK0','BEARER','HuyDien'),(43,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMTI0MzYyNiwiZXhwIjoxNzMxODQ4NDI2fQ.2Fs103fFQeEmfgJG6fyxtahue8EZYO0PEQByCowpHG0','BEARER','admin'),(44,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMTU2MjE3NSwiZXhwIjoxNzMyMTY2OTc1fQ.TkeB5bOtBPP53Djst-ynvhGz14xFe3POTMGGsfN0uag','BEARER','user1'),(45,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMTU2MjMyMCwiZXhwIjoxNzMyMTY3MTIwfQ.XYBPEOrjTldxgsLh8PzGN5-O5XcyeIoZNIjqYO_kEfE','BEARER','admin'),(46,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMTU2NDA5NSwiZXhwIjoxNzMyMTY4ODk1fQ.6iDE28lzQ8CUukicjxwJfCiaNDfW49UpGiNWiXbb6kM','BEARER','user1'),(47,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMTU2NjM2OCwiZXhwIjoxNzMyMTcxMTY4fQ.CMj-ENGCWmHiXM1oYOH5bxu8YHWj-pogQCDwRa-BI8o','BEARER','user1'),(48,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMTY0MTAzNSwiZXhwIjoxNzMyMjQ1ODM1fQ.hVc6mNqZPuvHBfIPrZ6XqFK6CuLakvL-j33_ldCBWko','BEARER','admin'),(49,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuZ3V5ZW52YW5hIiwiaWF0IjoxNzMxNjU0MzgwLCJleHAiOjE3MzIyNTkxODB9.u9cPXSIRdNy5W7x5tNI9SWhBs7zzW7AAByJ3_M3RX2g','BEARER','nguyenvana');
UNLOCK TABLES;


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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `trip` WRITE;
INSERT INTO `trip` VALUES (3,_binary '\0','2024-11-20 19:10:00.000000',0.05,500000.00,1,9,1,1,8,17,15),(4,_binary '\0','2024-11-30 09:00:00.000000',4,300000.00,2,8,2,2,7,17,15),(5,_binary '\0','2024-11-30 23:55:00.000000',2,20000.00,3,2,NULL,5,1,3,1),(7,_binary '','2024-10-31 18:30:00.000000',2,200000.00,8,2,NULL,20,1,4,1),(8,_binary '\0','2024-11-16 12:11:00.000000',10,200000.00,3,2,9,6,1,3,2),(9,_binary '','2024-11-08 01:42:00.000000',10,10000.00,9,2,NULL,11,1,3,2),(10,_binary '\0','2024-11-30 15:16:00.000000',0.1,300000.00,19,9,2,46,8,18,15),(12,_binary '\0','2025-12-15 16:31:00.000000',12,250000.00,10,9,3,9,8,18,15),(13,_binary '\0','2024-12-10 16:30:00.000000',12,300000.00,6,9,NULL,7,8,17,15),(14,_binary '\0','2024-12-14 16:30:00.000000',300000,250000.00,4,63,NULL,7,8,126,15),(15,_binary '','2024-01-14 16:00:00.000000',10,250000.00,1,63,NULL,1,8,126,16),(16,_binary '\0','2024-12-14 16:00:00.000000',10,500000.00,3,2,4,6,1,3,2),(17,_binary '\0','2024-12-20 16:00:00.000000',12,600000.00,11,63,20,13,8,126,16),(18,_binary '\0','2024-12-10 12:43:00.000000',300000,25000.00,2,63,NULL,8,8,126,15);
UNLOCK TABLES;



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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `trip_log` WRITE;
INSERT INTO `trip_log` VALUES (2,'cháy xe','bình thuận','2024-10-27 19:12:27.756708','OTHER','admin',3);
UNLOCK TABLES;



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
-- Insert data
LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES ('admin',_binary '','Lương Bình, Phước Thắng, Tuy Phước, Bình Định','2002-02-22','dienchau45@gmail.com','Diễn',_binary '\0','Châu',0.00,'$2a$10$YHoIOMIkWkcFmEvIqHWzA.9YSL7GyqFHVmjxtBkeX9.xiHlf3CypW','0326917158'),('HuyDien',_binary '','23 Lý Thường Kiệt, Quy Nhơn, Bình Định','2002-12-22','abclsdjf23@gmail.com','Châu ',_binary '\0','Diễn',0.00,'$2a$10$twnkqal5hZFqA9yFo0J6/OqWOYbnWXNmD02zN44b1J1AIox1vW2Aq','0987654321'),('johndoe',_binary '',NULL,NULL,'johndoe@example.com','John',_binary '\0','Doe',0.00,'$2a$10$bdykQQ7qHDCs4Z1btywaL.qDc8MFfeysPKu/bpd6qn/C3GKzi5Ruu','0123456789'),('LeHaThanh',_binary '',NULL,NULL,'lehathanh@ptithcm.edu.vn','Lê',_binary '\0','Thanh',0.00,'$2a$10$zagRsm5vU.4wuITFziq3euNNg/vuLINW1T1fI80uPhOFG0WY4jcGC','0937142075'),('nguyenvana',_binary '','127A Trần Phú, Quy Nhơn, Bình Định','2002-07-07','nguyenvana@gmail.com','Nguyễn ',_binary '','Văn A',0.00,'$2a$10$qoVRUAPQXAQhaw1eOcvoJ.UqHlZlKKxfDlC0uiSG6sn3ovrlmLwOO','0935841720'),('nguyenvanb',_binary '','53A Hàm Nghi, Quy Nhơn, Bình Định','2001-07-07','nguyenvanb@gmail.com','Nguyễn ',_binary '\0','Văn B',0.00,'$2a$10$Og5Py3or23yle/YnDSFG5OBFyUUmN337/K6TAepm7Hr.D.DwIMPnS','0772419780'),('system',_binary '','','2002-10-25','datvexegiare@gmail.com','Hệ thống',_binary '\0','DATVEXE',0.00,'$2a$10$SID8gFLVqBnIhvxzmb58N.J5sw58XIbnTZnYFmWdRyQKDSRRn6Zim','0321312321'),('user1',_binary '','Số 10 Lê Duẩn, TP Quy Nhơn, Bình Định','2002-01-01','user1@gmail.com','Nguyễn',_binary '\0','Hải',3100.00,'$2a$10$Ea.f5pdM7vKPuuL4sz4zju8Yu7y4tMMG4QvLGYKAqmhn1bOeO1dhS','0901234567'),('user10',_binary '','Số 100 Nguyễn Tất Thành, TP Quy Nhơn, Bình Định','2002-01-01','user10@gmail.com','Trần',_binary '\0','Dũng',0.00,'$2a$10$gEuuqReE4fgIt19sqQedhO7Jl9dp/dSOh812evH9Ta3cHaB5m9NNi','0901234568'),('user11',_binary '','321 Hùng Vương, Hoài Nhơn, Bình Định','2002-01-01','user11@gmail.com','Lê',_binary '','Trang',0.00,'$2a$10$Eyj77RCrpQ8BIRHjgZLDUOfpUESo8hL/70cSCVc4G3XRzBGeWK.KS','0934567890'),('user12',_binary '','654 Lê Lợi, Phù Mỹ, Bình Định','2002-01-01','user12@gmail.com','Lê',_binary '','Anh',0.00,'$2a$10$8WHNmWqsHbEmzWz69BdxMOhClzwWgKRtvNXCqxa1zpLXxQevXOF6y','0901234569'),('user13',_binary '','Số 130 Phan Thanh, TP Quy Nhơn, Bình Định','2002-01-01','user13@gmail.com','Phạm',_binary '','Trang',0.00,'$2a$10$rYbs/TgA.DkZBXvJzetdS.vTRsHW8ZkIXtsHUqG68p7k02HA2.1aO','0956789012'),('user14',_binary '','Số 140 Lê Hồng Phong, TP Quy Nhơn, Bình Định','2002-01-01','user14@gmail.com','Nguyễn',_binary '\0','Vũ',0.00,'$2a$10$MU1AA8cd4n/IzOWB7evW3eyDoubngvDlIMPrXbFZu88ADylZTr1D.','0967890123'),('user15',_binary '','Số 150 Nguyễn Văn Linh, TP Quy Nhơn, Bình Định','2002-01-01','user15@gmail.com','Nguyễn',_binary '\0','Hoàng',0.00,'$2a$10$o7uP7ZsiavyN6NyAqoEdIeWFBcn3.0zJhRy8Fb/SiP3FJw4CraAXq','0902112233'),('user16',_binary '','Số 160 Trần Phú, TP Quy Nhơn, Bình Định','2002-01-01','user16@gmail.com','Lê',_binary '\0','Dũng',0.00,'$2a$10$dxCKeDDxSo1Mb2lX8A8RxeN0HbL34PaktLxiBXZcYqDKhDfyGIV/2','0989012345'),('user17',_binary '','Số 170 Hoàng Văn Thụ, TP Quy Nhơn, Bình Định','2002-01-01','user17@gmail.com','Võ',_binary '\0','Quân',0.00,'$2a$10$7OKlpFDnHhR1SdlwBlz9mOeeGnKzfM5gqiamYGKpSL3cK/vK/I5nW','0990123456'),('user18',_binary '','Số 180 Trần Quang Diệu, TP Quy Nhơn, Bình Định','2002-01-01','user18@gmail.com','Trương',_binary '\0','Thắng',0.00,'$2a$10$Z0ejcC4NZYL6nI1VcP4ryuaE.SFtm.Dpwp6FnLgv.GVJq55cvfD/C','0901122334'),('user19',_binary '','Số 190 Phan Đình Phùng, TP Quy Nhơn, Bình Định','2002-01-01','user19@gmail.com','Nguyễn',_binary '\0','Tân',0.00,'$2a$10$c.mpxAJNXQchhxoOCD8G6OEW5XRWEEO5gQ/fy/CgT0kPED7KGqG7e','0912233445'),('user2',_binary '','Số 20 Trần Phú, TP Quy Nhơn, Bình Định','2002-01-01','user2@gmail.com','Nguyễn',_binary '','Anh',0.00,'$2a$10$Gc1PBxW.s7egx7sEiUN63u0YFXVl/89h.Tf2s9c4vKnIRtB3nxq1m','0923344556'),('user20',_binary '','Số 200 Lý Thái Tổ, TP Quy Nhơn, Bình Định','2002-01-01','user20@gmail.com','Phạm',_binary '','Thảo',0.00,'$2a$10$3LJSGlfZZWKa2Ws/d2Dr8eiiN01laTJUg4t5yAshAizMVN0fqhjdy','0934455667'),('user3',_binary '','Số 30 Nguyễn Huệ, TP Quy Nhơn, Bình Định','2002-01-01','user3@gmail.com','Nguyễn',_binary '\0','Đức',0.00,'$2a$10$16ljwGzL8N0RNs0GVaUK3.ZHAv6ZqOhT.s6qeSQ4UgRZR9rLpT2u6','0945566778'),('user4',_binary '','Số 40 Ngô Mây, TP Quy Nhơn, Bình Định','2002-01-01','user4@gmail.com','Châu',_binary '\0','Điền',0.00,'$2a$10$6bDY.lLQBSvycUVkKSYueuhYINmafqF7eiigNi2R9q5xyXrt2jU16','0956677889'),('user5',_binary '','Số 50 Hải Thượng Lãn Ông, TP Quy Nhơn, Bình Định','2002-01-01','user5@gmail.com','Hoàng',_binary '','Thảo',0.00,'$2a$10$ePBRfddr.NGeW/tUmL.UNuS4ugXZBRP8XEF.mtL.IUfRyO0ty0F1u','0967788990'),('user6',_binary '','Số 60 Phan Chu Trinh, TP Quy Nhơn, Bình Định','2002-01-01','user6@gmail.com','Trần',_binary '\0','Anh',0.00,'$2a$10$CxqHqBtNGYUv7NH72tJ6eeTwhBGAWJS1YfgT1ycA5r4D2ZKXHuX1e','0978899001'),('user7',_binary '','Số 70 Hùng Vương, TP Quy Nhơn, Bình Định','2002-01-01','user7@gmail.com','Phạm',_binary '','Trang',0.00,'$2a$10$t5EvoayabxZ6iuLw5U5MqOudIrnQCgaB6XAoCzqoKcpuh9AHYc2lm','0989900112'),('user8',_binary '','Số 80 Lê Lợi, TP Quy Nhơn, Bình Định','2002-01-01','user8@gmail.com','Võ',_binary '','Thảo',0.00,'$2a$10$95CzhnFMCnu9eWQb6ne5mOe61WlUIrW/aj2nhaWlau.i3QJ5G0bNa','0991001223'),('user9',_binary '','Số 90 Trần Hưng Đạo, TP Quy Nhơn, Bình Định','2002-01-01','user9@gmail.com','Trần',_binary '\0','Hải',0.00,'$2a$10$0p/5Aq.jJEHTy.KOnjrLFuwwY1qY0Glxktq22RPRy8k0nGyt8wkLS','0913223344');
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
  KEY `FKi5naecliicmigrk01qx5me5sp` (`notification_id`),
  KEY `FK53pjy9iwmuvp3t5ayl1muviso` (`username`),
  CONSTRAINT `FK53pjy9iwmuvp3t5ayl1muviso` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `FKi5naecliicmigrk01qx5me5sp` FOREIGN KEY (`notification_id`) REFERENCES `notification` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `user_notification` WRITE;
INSERT INTO `user_notification` VALUES (2,_binary '\0',_binary '','2024-10-25 19:35:29.459544',4,'user1'),(3,_binary '\0',_binary '','2024-10-27 20:30:40.311267',5,'user1'),(4,_binary '\0',_binary '','2024-10-27 20:30:37.484165',6,'user1'),(5,_binary '\0',_binary '','2024-10-29 16:45:03.408217',7,'user1'),(6,_binary '\0',_binary '','2024-10-29 16:09:29.747651',8,'user1'),(7,_binary '\0',_binary '','2024-10-29 16:45:06.329657',9,'user1'),(8,_binary '\0',_binary '','2024-10-29 16:08:49.961268',10,'user1'),(9,_binary '\0',_binary '','2024-10-29 16:45:05.085093',11,'user1'),(10,_binary '\0',_binary '','2024-10-29 16:08:43.383973',12,'user1'),(11,_binary '\0',_binary '','2024-11-02 23:31:23.505455',13,'user1'),(12,_binary '\0',_binary '','2024-11-06 14:24:04.388459',14,'user1'),(13,_binary '\0',_binary '','2024-11-06 14:24:05.776387',15,'user1'),(14,_binary '\0',_binary '','2024-11-06 14:24:06.974281',16,'user1'),(15,_binary '\0',_binary '','2024-11-06 14:24:07.955360',17,'user1'),(16,_binary '\0',_binary '','2024-11-06 14:24:09.772989',18,'user1'),(17,_binary '\0',_binary '','2024-11-06 14:24:10.788351',19,'user1'),(18,_binary '\0',_binary '','2024-11-01 12:17:40.153040',20,'HuyDien'),(19,_binary '\0',_binary '','2024-11-06 14:24:11.837553',21,'user1'),(20,_binary '\0',_binary '','2024-11-01 14:32:18.222182',22,'HuyDien'),(21,_binary '\0',_binary '','2024-11-06 14:24:12.872486',23,'user1'),(22,_binary '\0',_binary '','2024-11-06 14:24:13.938920',24,'user1'),(23,_binary '\0',_binary '','2024-11-06 14:24:15.090315',25,'user1'),(24,_binary '\0',_binary '','2024-11-06 14:24:16.076762',26,'user1'),(25,_binary '\0',_binary '','2024-11-14 12:58:45.528484',27,'user1'),(26,_binary '\0',_binary '','2024-11-15 13:34:54.727746',28,'user1'),(27,_binary '\0',_binary '','2024-11-15 13:34:53.107108',29,'user1'),(28,_binary '\0',_binary '','2024-11-15 13:34:47.923745',30,'user1'),(29,_binary '\0',_binary '','2024-11-15 13:34:56.238192',31,'user1');
UNLOCK TABLES;


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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- Insert data
LOCK TABLES `user_permission` WRITE;
INSERT INTO `user_permission` VALUES (2,NULL,1,'admin'),(1,NULL,3,'HuyDien'),(59,NULL,3,'johndoe'),(60,NULL,3,'LeHaThanh'),(25,NULL,2,'nguyenvana'),(34,'COACHES',4,'nguyenvana'),(50,'DASHBOARD',4,'nguyenvana'),(30,'DRIVERS',4,'nguyenvana'),(46,'REPORT',4,'nguyenvana'),(42,'TICKETS',4,'nguyenvana'),(54,'USERS',4,'nguyenvana'),(35,'COACHES',5,'nguyenvana'),(51,'DASHBOARD',5,'nguyenvana'),(31,'DRIVERS',5,'nguyenvana'),(47,'REPORT',5,'nguyenvana'),(43,'TICKETS',5,'nguyenvana'),(62,'TRIPS',5,'nguyenvana'),(55,'USERS',5,'nguyenvana'),(36,'COACHES',6,'nguyenvana'),(52,'DASHBOARD',6,'nguyenvana'),(32,'DRIVERS',6,'nguyenvana'),(48,'REPORT',6,'nguyenvana'),(44,'TICKETS',6,'nguyenvana'),(63,'TRIPS',6,'nguyenvana'),(56,'USERS',6,'nguyenvana'),(37,'COACHES',7,'nguyenvana'),(53,'DASHBOARD',7,'nguyenvana'),(33,'DRIVERS',7,'nguyenvana'),(49,'REPORT',7,'nguyenvana'),(45,'TICKETS',7,'nguyenvana'),(57,'USERS',7,'nguyenvana'),(58,NULL,2,'nguyenvanb'),(61,NULL,2,'system'),(3,NULL,3,'user1'),(13,NULL,3,'user10'),(14,NULL,3,'user11'),(15,NULL,3,'user12'),(16,NULL,3,'user13'),(17,NULL,3,'user14'),(18,NULL,3,'user15'),(19,NULL,3,'user16'),(20,NULL,3,'user17'),(21,NULL,3,'user18'),(22,NULL,3,'user19'),(5,NULL,3,'user2'),(23,NULL,3,'user20'),(6,NULL,3,'user3'),(7,NULL,3,'user4'),(8,NULL,3,'user5'),(9,NULL,3,'user6'),(10,NULL,3,'user7'),(11,NULL,3,'user8'),(12,NULL,3,'user9');
UNLOCK TABLES;

select * from `user` u ;
select * from token t ;
select * from booking b;
select * from payment_history ph ;
select * from trip t ;
select * from booking_cargo bc ;
select * from `user` u ;

SELECT * 
FROM trip
WHERE source_id = 1 
  AND dest_id = 2
  AND departure_date_time BETWEEN '2024-11-01' AND '2024-12-30'
  AND departure_date_time > CURRENT_TIMESTAMP()
ORDER BY departure_date_time ASC;

SELECT ph.*
FROM payment_history ph
WHERE ph.new_status = 'REFUND_PENDING' 
  AND ph.status_change_date_time < :thresholdTime;


