CREATE database BusTicketBooking;
use BusTicketBooking;

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
LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES ('admin',_binary '','Lương Bình, Phước Thắng, Tuy Phước, Bình Định','2002-02-22','dienchau45@gmail.com','Diễn',_binary '\0','Châu',0.00,'$2a$10$YHoIOMIkWkcFmEvIqHWzA.9YSL7GyqFHVmjxtBkeX9.xiHlf3CypW','0326917158'),('HuyDien',_binary '','23 Lý Thường Kiệt, Quy Nhơn, Bình Định','2002-12-22','abclsdjf23@gmail.com','Châu ',_binary '\0','Diễn',21000.00,'$2a$10$twnkqal5hZFqA9yFo0J6/OqWOYbnWXNmD02zN44b1J1AIox1vW2Aq','0987654321'),('johndoe',_binary '',NULL,NULL,'johndoe@example.com','John',_binary '\0','Doe',0.00,'$2a$10$bdykQQ7qHDCs4Z1btywaL.qDc8MFfeysPKu/bpd6qn/C3GKzi5Ruu','0123456789'),('LeHaThanh',_binary '',NULL,NULL,'lehathanh@ptithcm.edu.vn','Lê',_binary '\0','Thanh',0.00,'$2a$10$zagRsm5vU.4wuITFziq3euNNg/vuLINW1T1fI80uPhOFG0WY4jcGC','0937142075'),('nguyenvana',_binary '','127A Trần Phú, Quy Nhơn, Bình Định','2002-07-07','nguyenvana@gmail.com','Nguyễn ',_binary '','Văn A',0.00,'$2a$10$qoVRUAPQXAQhaw1eOcvoJ.UqHlZlKKxfDlC0uiSG6sn3ovrlmLwOO','0935841720'),('nguyenvanb',_binary '','53A Hàm Nghi, Quy Nhơn, Bình Định','2001-07-07','nguyenvanb@gmail.com','Nguyễn ',_binary '\0','Văn B',0.00,'$2a$10$Og5Py3or23yle/YnDSFG5OBFyUUmN337/K6TAepm7Hr.D.DwIMPnS','0772419780'),('system',_binary '','','2002-10-25','datvexegiare@gmail.com','Hệ thống',_binary '\0','DATVEXE',0.00,'$2a$10$SID8gFLVqBnIhvxzmb58N.J5sw58XIbnTZnYFmWdRyQKDSRRn6Zim','0321312321'),('user1',_binary '','Số 10 Lê Duẩn, TP Quy Nhơn, Bình Định','2002-01-01','user1@gmail.com','Nguyễn',_binary '\0','Hải',4100.00,'$2a$12$OJObCMKCpZGMuNRsCbVphe1HVYZn79h0pcJBeYCOtjjrUTGPEVJ42','0901234567'),('user10',_binary '','Số 100 Nguyễn Tất Thành, TP Quy Nhơn, Bình Định','2002-01-01','user10@gmail.com','Trần',_binary '\0','Dũng',0.00,'$2a$10$gEuuqReE4fgIt19sqQedhO7Jl9dp/dSOh812evH9Ta3cHaB5m9NNi','0901234568'),('user11',_binary '','321 Hùng Vương, Hoài Nhơn, Bình Định','2002-01-01','user11@gmail.com','Lê',_binary '','Trang',0.00,'$2a$10$Eyj77RCrpQ8BIRHjgZLDUOfpUESo8hL/70cSCVc4G3XRzBGeWK.KS','0934567890'),('user12',_binary '','654 Lê Lợi, Phù Mỹ, Bình Định','2002-01-01','user12@gmail.com','Lê',_binary '','Anh',0.00,'$2a$10$8WHNmWqsHbEmzWz69BdxMOhClzwWgKRtvNXCqxa1zpLXxQevXOF6y','0901234569'),('user13',_binary '','Số 130 Phan Thanh, TP Quy Nhơn, Bình Định','2002-01-01','user13@gmail.com','Phạm',_binary '','Trang',0.00,'$2a$10$rYbs/TgA.DkZBXvJzetdS.vTRsHW8ZkIXtsHUqG68p7k02HA2.1aO','0956789012'),('user14',_binary '','Số 140 Lê Hồng Phong, TP Quy Nhơn, Bình Định','2002-01-01','user14@gmail.com','Nguyễn',_binary '\0','Vũ',0.00,'$2a$10$MU1AA8cd4n/IzOWB7evW3eyDoubngvDlIMPrXbFZu88ADylZTr1D.','0967890123'),('user15',_binary '','Số 150 Nguyễn Văn Linh, TP Quy Nhơn, Bình Định','2002-01-01','user15@gmail.com','Nguyễn',_binary '\0','Hoàng',0.00,'$2a$10$o7uP7ZsiavyN6NyAqoEdIeWFBcn3.0zJhRy8Fb/SiP3FJw4CraAXq','0902112233'),('user16',_binary '','Số 160 Trần Phú, TP Quy Nhơn, Bình Định','2002-01-01','user16@gmail.com','Lê',_binary '\0','Dũng',0.00,'$2a$10$dxCKeDDxSo1Mb2lX8A8RxeN0HbL34PaktLxiBXZcYqDKhDfyGIV/2','0989012345'),('user17',_binary '','Số 170 Hoàng Văn Thụ, TP Quy Nhơn, Bình Định','2002-01-01','user17@gmail.com','Võ',_binary '\0','Quân',0.00,'$2a$10$7OKlpFDnHhR1SdlwBlz9mOeeGnKzfM5gqiamYGKpSL3cK/vK/I5nW','0990123456'),('user18',_binary '','Số 180 Trần Quang Diệu, TP Quy Nhơn, Bình Định','2002-01-01','user18@gmail.com','Trương',_binary '\0','Thắng',0.00,'$2a$10$Z0ejcC4NZYL6nI1VcP4ryuaE.SFtm.Dpwp6FnLgv.GVJq55cvfD/C','0901122334'),('user19',_binary '','Số 190 Phan Đình Phùng, TP Quy Nhơn, Bình Định','2002-01-01','user19@gmail.com','Nguyễn',_binary '\0','Tân',0.00,'$2a$10$c.mpxAJNXQchhxoOCD8G6OEW5XRWEEO5gQ/fy/CgT0kPED7KGqG7e','0912233445'),('user2',_binary '','Số 20 Trần Phú, TP Quy Nhơn, Bình Định','2002-01-01','user2@gmail.com','Nguyễn',_binary '','Anh',0.00,'$2a$10$Gc1PBxW.s7egx7sEiUN63u0YFXVl/89h.Tf2s9c4vKnIRtB3nxq1m','0923344556'),('user20',_binary '','Số 200 Lý Thái Tổ, TP Quy Nhơn, Bình Định','2002-01-01','user20@gmail.com','Phạm',_binary '','Thảo',0.00,'$2a$10$3LJSGlfZZWKa2Ws/d2Dr8eiiN01laTJUg4t5yAshAizMVN0fqhjdy','0934455667'),('user3',_binary '','Số 30 Nguyễn Huệ, TP Quy Nhơn, Bình Định','2002-01-01','user3@gmail.com','Nguyễn',_binary '\0','Đức',0.00,'$2a$10$16ljwGzL8N0RNs0GVaUK3.ZHAv6ZqOhT.s6qeSQ4UgRZR9rLpT2u6','0945566778'),('user5',_binary '','Số 50 Hải Thượng Lãn Ông, TP Quy Nhơn, Bình Định','2002-01-01','user5@gmail.com','Hoàng',_binary '','Thảo',0.00,'$2a$10$ePBRfddr.NGeW/tUmL.UNuS4ugXZBRP8XEF.mtL.IUfRyO0ty0F1u','0967788990'),('user6',_binary '','Số 60 Phan Chu Trinh, TP Quy Nhơn, Bình Định','2002-01-01','user6@gmail.com','Trần',_binary '\0','Anh',0.00,'$2a$10$CxqHqBtNGYUv7NH72tJ6eeTwhBGAWJS1YfgT1ycA5r4D2ZKXHuX1e','0978899001'),('user7',_binary '','Số 70 Hùng Vương, TP Quy Nhơn, Bình Định','2002-01-01','user7@gmail.com','Phạm',_binary '','Trang',0.00,'$2a$10$t5EvoayabxZ6iuLw5U5MqOudIrnQCgaB6XAoCzqoKcpuh9AHYc2lm','0989900112'),('user8',_binary '','Số 80 Lê Lợi, TP Quy Nhơn, Bình Định','2002-01-01','user8@gmail.com','Võ',_binary '','Thảo',0.00,'$2a$10$95CzhnFMCnu9eWQb6ne5mOe61WlUIrW/aj2nhaWlau.i3QJ5G0bNa','0991001223'),('user9',_binary '','Số 90 Trần Hưng Đạo, TP Quy Nhơn, Bình Định','2002-01-01','user9@gmail.com','Trần',_binary '\0','Hải',0.00,'$2a$10$0p/5Aq.jJEHTy.KOnjrLFuwwY1qY0Glxktq22RPRy8k0nGyt8wkLS','0913223344');
UNLOCK TABLES;


DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `description` varchar(255) DEFAULT NULL,
                        `role_code` enum('ROLE_ADMIN','ROLE_CREATE','ROLE_CUSTOMER','ROLE_DELETE','ROLE_READ','ROLE_STAFF','ROLE_UPDATE') DEFAULT NULL,
                        `role_name` varchar(255) DEFAULT NULL,
                        PRIMARY KEY (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `token` WRITE;
INSERT INTO `token` VALUES (1,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMjgwMzM5MSwiZXhwIjoxNzMzNDA4MTkxfQ.KkY3UEzNr54tk43hy9f-RR0rJDT8tMtDQVUxfO7yWbA','BEARER','admin'),(2,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMjgwMzkzNSwiZXhwIjoxNzMzNDA4NzM1fQ.kPpxA658a3mnRoYpmj0fTtJw6FRvjhi1vY9WRfA8aWs','BEARER','admin'),(3,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMyODQ2MTcyLCJleHAiOjE3MzM0NTA5NzJ9.Dee-VKpPFAzJzmsC9IMg779wBGLa9Bx9Q1_8iOcqrGM','BEARER','HuyDien'),(4,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMjg0NjgxNiwiZXhwIjoxNzMzNDUxNjE2fQ.J6g5eKnpT_0LYwTcThApodZmQTQqBqBzsjaxyGm6lHQ','BEARER','user1'),(5,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMyODQ3MDA3LCJleHAiOjE3MzM0NTE4MDd9.4f7pJKOHMtHWY4nIZ7D40GpolsaPRAJ2U3fI0nwB3bY','BEARER','HuyDien'),(6,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMjg1MTAzNCwiZXhwIjoxNzMzNDU1ODM0fQ.11LLjYy6PPg-43aFxlKjY3UaJ8NVKPtvqMQyaMpaPYQ','BEARER','user1'),(7,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMyODUxMDUxLCJleHAiOjE3MzM0NTU4NTF9.ya-1UuRcRsBLigynDVcye0rsB0qb_CY-OrMqG4Etv_U','BEARER','HuyDien'),(8,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMjg1MTExNiwiZXhwIjoxNzMzNDU1OTE2fQ.nYHW9DF-Zli6CPJ_BxZLUg1JXtRKoZXjxqum4HnpvAk','BEARER','user1'),(9,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMyODUxNjU1LCJleHAiOjE3MzM0NTY0NTV9.3pvtGsqaakMSYN94AECZ6Nk1sbkT14Yigo1YnRPlf3c','BEARER','HuyDien'),(10,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMyODYyNzEzLCJleHAiOjE3MzM0Njc1MTN9.-HEp65KApPis7zf-3FZGrN0NUatWCqytxqSIfu0wbms','BEARER','HuyDien'),(11,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMyODYyODg3LCJleHAiOjE3MzM0Njc2ODd9.fcY5gKssRTMZvTbej6WefsiTdN29zj0u0QRjMmlV0SU','BEARER','HuyDien'),(12,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMyODYzMDMzLCJleHAiOjE3MzM0Njc4MzN9.nJklp8eJXhkxAAMuLynpnLXKUkYAOKGTTbza4b4qlQA','BEARER','HuyDien'),(13,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMyODYzODY4LCJleHAiOjE3MzM0Njg2Njh9.lPdbhzoFViYvIRVJMRENlzkAvB6C9-IZdf0ybBMYkeU','BEARER','HuyDien'),(14,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMyODY0MTU4LCJleHAiOjE3MzM0Njg5NTh9.tUz05lMEfaYBLXdpIaFbFVszLKJU1kyjXKePPdU1gNg','BEARER','HuyDien'),(15,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTczMzMwMjY2MCwiZXhwIjoxNzMzOTA3NDYwfQ.wmRKxLmdfgUkMBCxPdAyZtHl_PWbb0w6OLOIILOhu1I','BEARER','user1'),(16,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMzMyNjI5NywiZXhwIjoxNzMzOTMxMDk3fQ.TZbio0jxnJ7wuKL7M5_DgrrhVC86zeRJoYLntlAG5tU','BEARER','admin'),(17,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTczMzMyOTIwOSwiZXhwIjoxNzMzOTM0MDA5fQ.uXfDPdkDROH6c7YgkwAFSzQszu3IJPJSlIGcUEfLUTI','BEARER','admin'),(18,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzMzMzI5NTc1LCJleHAiOjE3MzM5MzQzNzV9.UJNtj7DdBKJbhIuCk2CJhGgxm_BJ5tE3hCjs2LwkCYA','BEARER','HuyDien');
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
LOCK TABLES `user_permission` WRITE;
INSERT INTO `user_permission` VALUES (2,NULL,1,'admin'),(1,NULL,3,'HuyDien'),(59,NULL,3,'johndoe'),(60,NULL,3,'LeHaThanh'),(25,NULL,2,'nguyenvana'),(34,'COACHES',4,'nguyenvana'),(50,'DASHBOARD',4,'nguyenvana'),(30,'DRIVERS',4,'nguyenvana'),(46,'REPORT',4,'nguyenvana'),(42,'TICKETS',4,'nguyenvana'),(54,'USERS',4,'nguyenvana'),(35,'COACHES',5,'nguyenvana'),(51,'DASHBOARD',5,'nguyenvana'),(31,'DRIVERS',5,'nguyenvana'),(47,'REPORT',5,'nguyenvana'),(43,'TICKETS',5,'nguyenvana'),(62,'TRIPS',5,'nguyenvana'),(55,'USERS',5,'nguyenvana'),(36,'COACHES',6,'nguyenvana'),(52,'DASHBOARD',6,'nguyenvana'),(32,'DRIVERS',6,'nguyenvana'),(48,'REPORT',6,'nguyenvana'),(44,'TICKETS',6,'nguyenvana'),(63,'TRIPS',6,'nguyenvana'),(56,'USERS',6,'nguyenvana'),(37,'COACHES',7,'nguyenvana'),(53,'DASHBOARD',7,'nguyenvana'),(33,'DRIVERS',7,'nguyenvana'),(49,'REPORT',7,'nguyenvana'),(45,'TICKETS',7,'nguyenvana'),(57,'USERS',7,'nguyenvana'),(58,NULL,2,'nguyenvanb'),(61,NULL,2,'system'),(3,NULL,3,'user1'),(13,NULL,3,'user10'),(14,NULL,3,'user11'),(15,NULL,3,'user12'),(16,NULL,3,'user13'),(17,NULL,3,'user14'),(18,NULL,3,'user15'),(19,NULL,3,'user16'),(20,NULL,3,'user17'),(21,NULL,3,'user18'),(22,NULL,3,'user19'),(5,NULL,3,'user2'),(23,NULL,3,'user20'),(6,NULL,3,'user3'),(8,NULL,3,'user5'),(9,NULL,3,'user6'),(10,NULL,3,'user7'),(11,NULL,3,'user8'),(12,NULL,3,'user9');
UNLOCK TABLES;


DROP TABLE IF EXISTS `cargo`;
CREATE TABLE `cargo` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `base_price` decimal(38,2) NOT NULL,
                         `description` varchar(255) DEFAULT NULL,
                         `name` varchar(255) NOT NULL,
                         PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `cargo` WRITE;
INSERT INTO `cargo` VALUES (1,100000.00,'Dịch vụ gửi xe máy','Gửi xe máy'),(2,150000.00,'Dịch vụ gửi xe tay gas ','Gửi xe tay gas');
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
LOCK TABLES `driver` WRITE;
INSERT INTO `driver` VALUES (1,'123 Đường Lê Lợi, TP. Quy Nhơn, Bình Định','2002-01-01','driver1@gmail.com','Nguyễn',_binary '\0','Anh','LICENSE NO.1','0901234567',_binary '\0'),(2,'456 Đường Nguyễn Huệ, TP. Quy Nhơn, Bình Định','2002-01-01','driver2@gmail.com','Trần',_binary '\0','Bình','LICENSE NO.2','0912345678',_binary '\0'),(3,'789 Đường Ngô Quyền, TP. Quy Nhơn, Bình Định','2002-01-01','driver3@gmail.com','Lê',_binary '\0','Cường','LICENSE NO.3','0923456789',_binary '\0'),(4,'1011 Đường Trần Hưng Đạo, TP. Quy Nhơn, Bình Định','2002-01-01','driver4@gmail.com','Phạm',_binary '\0','Dương','LICENSE NO.4','0934567890',_binary '\0'),(5,'1213 Đường Nguyễn Văn Linh, TP. Quy Nhơn, Bình Định','2002-01-01','driver5@gmail.com','Hoàng',_binary '\0','Đức','LICENSE NO.5','0945678901',_binary '\0'),(6,'1415 Đường Nguyễn Tất Thành, TP. Quy Nhơn, Bình Định','2002-01-01','driver6@gmail.com','Ngô',_binary '\0','Hoàn','LICENSE NO.6','0956789012',_binary '\0'),(7,'1617 Đường Nguyễn Công Trứ, TP. Quy Nhơn, Bình Định','2002-01-01','driver7@gmail.com','Bùi',_binary '\0','Hưng','LICENSE NO.7','0967890123',_binary '\0'),(8,'1819 Đường Phan Đình Phùng, TP. Quy Nhơn, Bình Định','2002-01-01','driver8@gmail.com','Đỗ',_binary '\0','Khai','LICENSE NO.8','0978901234',_binary '\0'),(9,'2021 Đường Lý Tự Trọng, TP. Quy Nhơn, Bình Định','2002-01-01','driver9@gmail.com','Võ',_binary '\0','Long','LICENSE NO.9','0989012345',_binary '\0'),(10,'2223 Đường Bạch Đằng, TP. Quy Nhơn, Bình Định','2002-01-01','driver10@gmail.com','Đặng',_binary '\0','Minh','LICENSE NO.10','0990123456',_binary '\0'),(11,'2425 Đường Nguyễn Chí Thanh, TP. Quy Nhơn, Bình Định','2002-01-01','driver11@gmail.com','Ngô',_binary '\0','Nam','LICENSE NO.11','0901122334',_binary '\0'),(12,'2627 Đường Trần Phú, TP. Quy Nhơn, Bình Định','2002-01-01','driver12@gmail.com','Bùi',_binary '\0','Phúc','LICENSE NO.12','0912233445',_binary '\0'),(13,'2829 Đường Hoàng Diệu, TP. Quy Nhơn, Bình Định','2002-01-01','driver13@gmail.com','Lê',_binary '\0','Quân','LICENSE NO.13','0923344556',_binary '\0'),(14,'3031 Đường Phùng Khắc Khoan, TP. Quy Nhơn, Bình Định','2002-01-01','driver14@gmail.com','Phan',_binary '','Thị Thanh','LICENSE NO.14','0934455667',_binary '\0'),(15,'3233 Đường Trần Bình Trọng, TP. Quy Nhơn, Bình Định','2002-01-01','driver15@gmail.com','Nguyễn',_binary '','Thị Hương','LICENSE NO.15','0945566778',_binary '\0'),(16,'3435 Đường Phạm Hồng Thái, TP. Quy Nhơn, Bình Định','2002-01-01','driver16@gmail.com','Trần',_binary '','Thị Hoa','LICENSE NO.16','0956677889',_binary '\0'),(17,'3637 Đường Nguyễn Hữu Thọ, TP. Quy Nhơn, Bình Định','2002-01-01','driver17@gmail.com','Lê',_binary '','Thị Hạnh','LICENSE NO.17','0967788990',_binary '\0'),(18,'3839 Đường Lý Thường Kiệt, TP. Quy Nhơn, Bình Định','2002-01-01','driver18@gmail.com','Phạm',_binary '','Thị Phương','LICENSE NO.18','0978899001',_binary '\0'),(19,'4041 Đường Trần Quang Diệu, TP. Quy Nhơn, Bình Định','2002-01-01','driver19@gmail.com','Hoàng',_binary '','Thị Trang','LICENSE NO.19','0989900112',_binary '\0'),(20,'4243 Đường Nguyễn Văn Cừ, TP. Quy Nhơn, Bình Định','2002-01-01','driver20@gmail.com','Đặng',_binary '','Thị Ngọc','LICENSE NO.20','0991001223',_binary '\0'),(46,'Đội 7 thôn Lương Bình, xã Phước Thắng, huyện Tuy Phước, tỉnh Bình Định','2000-07-07','luanvanduc2000@gmail.com','Luân',_binary '\0','Văn Đức','LICENSE NO.21','0326917158',_binary '\0');
UNLOCK TABLES;


DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
                            `id` bigint NOT NULL AUTO_INCREMENT,
                            `code_name` varchar(255) DEFAULT NULL,
                            `name` varchar(255) DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `province` WRITE;
INSERT INTO `province` VALUES (1,'an_giang','An Giang'),(2,'ba_ria_vung_tau','Bà Rịa - Vũng Tàu'),(3,'bac_giang','Bắc Giang'),(4,'bac_kan','Bắc Kạn'),(5,'bac_lieu','Bạc Liêu'),(6,'bac_ninh','Bắc Ninh'),(7,'ben_tre','Bến Tre'),(8,'binh_dinh','Bình Định'),(9,'binh_duong','Bình Dương'),(10,'binh_phuoc','Bình Phước'),(11,'binh_thuan','Bình Thuận'),(12,'ca_mau','Cà Mau'),(13,'can_tho','Cần Thơ'),(14,'cao_bang','Cao Bằng'),(15,'da_nang','Đà Nẵng'),(16,'dak_lak','Đắk Lắk'),(17,'dak_nong','Đắk Nông'),(18,'dien_bien','Điện Biên'),(19,'dong_nai','Đồng Nai'),(20,'dong_thap','Đồng Tháp'),(21,'gia_lai','Gia Lai'),(22,'ha_giang','Hà Giang'),(23,'ha_nam','Hà Nam'),(24,'ha_noi','Hà Nội'),(25,'ha_tinh','Hà Tĩnh'),(26,'hai_duong','Hải Dương'),(27,'hai_phong','Hải Phòng'),(28,'hau_giang','Hậu Giang'),(29,'hoa_binh','Hòa Bình'),(30,'hung_yen','Hưng Yên'),(31,'khanh_hoa','Khánh Hòa'),(32,'kien_giang','Kiên Giang'),(33,'kon_tum','Kon Tum'),(34,'lai_chau','Lai Châu'),(35,'lam_dong','Lâm Đồng'),(36,'lang_son','Lạng Sơn'),(37,'lao_cai','Lào Cai'),(38,'long_an','Long An'),(39,'nam_dinh','Nam Định'),(40,'nghe_an','Nghệ An'),(41,'ninh_binh','Ninh Bình'),(42,'ninh_thuan','Ninh Thuận'),(43,'phu_tho','Phú Thọ'),(44,'phu_yen','Phú Yên'),(45,'quang_binh','Quảng Bình'),(46,'quang_nam','Quảng Nam'),(47,'quang_ngai','Quảng Ngãi'),(48,'quang_ninh','Quảng Ninh'),(49,'quang_tri','Quảng Trị'),(50,'soc_trang','Sóc Trăng'),(51,'son_la','Sơn La'),(52,'tay_ninh','Tây Ninh'),(53,'thai_binh','Thái Bình'),(54,'thai_nguyen','Thái Nguyên'),(55,'thanh_hoa','Thanh Hóa'),(56,'thua_thien_hue','Thừa Thiên Huế'),(57,'tien_giang','Tiền Giang'),(58,'tra_vinh','Trà Vinh'),(59,'tuyen_quang','Tuyên Quang'),(60,'vinh_long','Vĩnh Long'),(61,'vinh_phuc','Vĩnh Phúc'),(62,'yen_bai','Yên Bái'),(63,'thanh_pho_ho_chi_minh','Thành Phố Hồ Chí Minh');
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
LOCK TABLES `location` WRITE;
INSERT INTO `location` (id, address,district,ward,province_id, is_active) VALUES (1,'123 Đường Nguyễn Trãi','Thành phố Long Xuyên','Phường 1',1,1),(2,'456 Đường Trần Hưng Đạo','Thành phố Long Xuyên','Phường Bình Khánh',1,1),(3,'789 Đường 30/4','Thành phố Vũng Tàu','Phường 9',2,1),(4,'123 Đường Lê Lợi','Thành phố Vũng Tàu','Phường Thắng Nhì',2,1),(5,'234 Đường Hoàng Hoa Thám','Thành phố Bắc Giang','Phường Ngô Quyền',3,1),(6,'567 Đường Xương Giang','Thành phố Bắc Giang','Phường Trần Phú',3,1),(7,'89 Đường Võ Nguyên Giáp','Thành phố Bắc Kạn','Phường Sông Cầu',4,1),(8,'12 Đường Thanh Niên','Thành phố Bắc Kạn','Phường Đức Xuân',4,1),(9,'345 Đường Võ Thị Sáu','Thành phố Bạc Liêu','Phường 3',5,1),(10,'678 Đường Trần Phú','Thành phố Bạc Liêu','Phường 1',5,1),(11,'456 Đường Lý Thái Tổ','Thành phố Bắc Ninh','Phường Suối Hoa',6,1),(12,'789 Đường Ngô Gia Tự','Thành phố Bắc Ninh','Phường Ninh Xá',6,1),(13,'567 Đường Đồng Khởi','Thành phố Bến Tre','Phường 4',7,1),(14,'890 Đường Nguyễn Đình Chiểu','Thành phố Bến Tre','Phường 2',7,1),(15,'123 Đường Trần Hưng Đạo','Thành phố Quy Nhơn','Phường Lê Lợi',8,1),(16,'456 Đường Nguyễn Huệ','Thành phố Quy Nhơn','Phường Hải Cảng',8,1),(17,'789 Đường Cách Mạng Tháng 8','Thành phố Thủ Dầu Một','Phường Phú Cường',9,1),(18,'123 Đường Nguyễn Du','Thành phố Thủ Dầu Một','Phường Chánh Nghĩa',9,1),(19,'456 Đường Lê Quý Đôn','Thành phố Đồng Xoài','Phường Tân Bình',10,1),(20,'789 Đường Phú Riềng Đỏ','Thành phố Đồng Xoài','Phường Tân Xuân',10,1),(21,'123 Đường Nguyễn Thông','Thành phố Phan Thiết','Phường Phú Thủy',11,1),(22,'456 Đường Hùng Vương','Thành phố Phan Thiết','Phường Bình Hưng',11,1),(23,'789 Đường Lý Thường Kiệt','Thành phố Cà Mau','Phường 8',12,1),(24,'123 Đường Trần Hưng Đạo','Thành phố Cà Mau','Phường 2',12,1),(25,'456 Đường 3/2','Quận Ninh Kiều','Phường Xuân Khánh',13,1),(26,'789 Đường Nguyễn Văn Linh','Quận Ninh Kiều','Phường An Khánh',13,1),(27,'123 Đường Kim Đồng','Thành phố Cao Bằng','Phường Hợp Giang',14,1),(28,'456 Đường Bế Văn Đàn','Thành phố Cao Bằng','Phường Tân Giang',14,1),(29,'123 Đường Lê Duẩn','Quận Hải Châu','Phường Hải Châu 1',15,1),(30,'456 Đường Nguyễn Văn Linh','Quận Thanh Khê','Phường Thạc Gián',15,1),(31,'789 Đường Lý Thái Tổ','Thành phố Buôn Ma Thuột','Phường Tân Lợi',16,1),(32,'123 Đường Lê Hồng Phong','Thành phố Buôn Ma Thuột','Phường Thống Nhất',16,1),(33,'456 Đường Lý Tự Trọng','Thành phố Gia Nghĩa','Phường Nghĩa Trung',17,1),(34,'789 Đường Nguyễn Tất Thành','Thành phố Gia Nghĩa','Phường Nghĩa Tân',17,1),(35,'123 Đường Võ Nguyên Giáp','Thành phố Điện Biên Phủ','Phường Tân Thanh',18,1),(36,'456 Đường Nguyễn Chí Thanh','Thành phố Điện Biên Phủ','Phường Mường Thanh',18,1),(37,'789 Đường Võ Thị Sáu','Thành phố Biên Hòa','Phường Quyết Thắng',19,1),(38,'123 Đường Đồng Khởi','Thành phố Biên Hòa','Phường Tân Hiệp',19,1),(39,'456 Đường Nguyễn Sinh Sắc','Thành phố Cao Lãnh','Phường 1',20,1),(40,'789 Đường Hùng Vương','Thành phố Cao Lãnh','Phường Mỹ Phú',20,1),(41,'123 Đường Trần Phú','Thành phố Pleiku','Phường Phù Đổng',21,1),(42,'456 Đường Lý Thái Tổ','Thành phố Pleiku','Phường Hoa Lư',21,1),(43,'789 Đường Trần Hưng Đạo','Thành phố Hà Giang','Phường Minh Khai',22,1),(44,'123 Đường Lý Thường Kiệt','Thành phố Hà Giang','Phường Ngọc Hà',22,1),(45,'456 Đường Lê Hoàn','Thành phố Phủ Lý','Phường Lê Hồng Phong',23,1),(46,'789 Đường Nguyễn Văn Trỗi','Thành phố Phủ Lý','Phường Quang Trung',23,1),(47,'123 Đường Kim Mã','Quận Ba Đình','Phường Ngọc Khánh',24,1),(48,'456 Đường Giải Phóng','Quận Hai Bà Trưng','Phường Đồng Tâm',24,1),(49,'789 Đường Hà Huy Tập','Thành phố Hà Tĩnh','Phường Trần Phú',25,1),(50,'123 Đường Phan Đình Phùng','Thành phố Hà Tĩnh','Phường Nam Hà',25,1),(51,'456 Đường Trần Hưng Đạo','Thành phố Hải Dương','Phường Hải Tân',26,1),(52,'789 Đường Nguyễn Lương Bằng','Thành phố Hải Dương','Phường Nhị Châu',26,1),(53,'123 Đường Tô Hiệu','Quận Lê Chân','Phường Trần Nguyên Hãn',27,1),(54,'456 Đường Lạch Tray','Quận Ngô Quyền','Phường Lạch Tray',27,1),(55,'789 Đường 1/5','Thành phố Vị Thanh','Phường 5',28,1),(56,'123 Đường Trần Hưng Đạo','Thành phố Vị Thanh','Phường 7',28,1),(57,'456 Đường Cù Chính Lan','Thành phố Hòa Bình','Phường Thái Bình',29,1),(58,'789 Đường Trần Hưng Đạo','Thành phố Hòa Bình','Phường Phương Lâm',29,1),(59,'123 Đường Tô Hiệu','Thành phố Hưng Yên','Phường Hiến Nam',30,1),(60,'456 Đường Nguyễn Văn Linh','Thành phố Hưng Yên','Phường Lam Sơn',30,1),(61,'789 Đường Trần Phú','Thành phố Nha Trang','Phường Lộc Thọ',31,1),(62,'123 Đường Phạm Văn Đồng','Thành phố Nha Trang','Phường Vĩnh Hải',31,1),(63,'456 Đường Nguyễn Trung Trực','Thành phố Rạch Giá','Phường An Hòa',32,1),(64,'789 Đường Lê Lợi','Thành phố Rạch Giá','Phường Vĩnh Thanh Vân',32,1),(65,'123 Đường Phan Đình Phùng','Thành phố Kon Tum','Phường Quyết Thắng',33,1),(66,'456 Đường Trường Chinh','Thành phố Kon Tum','Phường Trường Chinh',33,1),(67,'789 Đường Trần Hưng Đạo','Thành phố Lai Châu','Phường Đoàn Kết',34,1),(68,'123 Đường Lê Lai','Thành phố Lai Châu','Phường Quyết Thắng',34,1),(69,'456 Đường 3/4','Thành phố Đà Lạt','Phường 1',35,1),(70,'789 Đường Trần Phú','Thành phố Đà Lạt','Phường 4',35,1),(71,'123 Đường Trần Đăng Ninh','Thành phố Lạng Sơn','Phường Chi Lăng',36,1),(72,'456 Đường Phai Vệ','Thành phố Lạng Sơn','Phường Đông Kinh',36,1),(73,'789 Đường Hồng Hà','Thành phố Lào Cai','Phường Kim Tân',37,1),(74,'123 Đường Hoàng Liên','Thành phố Lào Cai','Phường Cốc Lếu',37,1),(75,'456 Đường Hùng Vương','Thành phố Tân An','Phường 2',38,1),(76,'789 Đường Trần Hưng Đạo','Thành phố Tân An','Phường 6',38,1),(77,'123 Đường Trần Đăng Ninh','Thành phố Nam Định','Phường Ngô Quyền',39,1),(78,'456 Đường Hàn Thuyên','Thành phố Nam Định','Phường Bà Triệu',39,1),(79,'789 Đường Quang Trung','Thành phố Vinh','Phường Quang Trung',40,1),(80,'123 Đường Lê Duẩn','Thành phố Vinh','Phường Lê Lợi',40,1),(81,'456 Đường Trần Hưng Đạo','Thành phố Ninh Bình','Phường Đông Thành',41,1),(82,'789 Đường Lương Văn Tụy','Thành phố Ninh Bình','Phường Phúc Thành',41,1),(83,'123 Đường 21/8','Thành phố Phan Rang - Tháp Chàm','Phường Phủ Hà',42,1),(84,'456 Đường Ngô Gia Tự','Thành phố Phan Rang - Tháp Chàm','Phường Mỹ Bình',42,1),(85,'789 Đường Hùng Vương','Thành phố Việt Trì','Phường Gia Cẩm',43,1),(86,'123 Đường Trần Phú','Thành phố Việt Trì','Phường Tiên Cát',43,1),(87,'456 Đường Nguyễn Huệ','Thành phố Tuy Hòa','Phường 5',44,1),(88,'789 Đường Trần Hưng Đạo','Thành phố Tuy Hòa','Phường 7',44,1),(89,'123 Đường Trần Hưng Đạo','Thành phố Đồng Hới','Phường Đồng Phú',45,1),(90,'456 Đường Quang Trung','Thành phố Đồng Hới','Phường Nam Lý',45,1),(91,'789 Đường Hùng Vương','Thành phố Tam Kỳ','Phường Tân Thạnh',46,1),(92,'123 Đường Phan Bội Châu','Thành phố Tam Kỳ','Phường An Mỹ',46,1),(93,'456 Đường Quang Trung','Thành phố Quảng Ngãi','Phường Lê Hồng Phong',47,1),(94,'789 Đường Hùng Vương','Thành phố Quảng Ngãi','Phường Trần Phú',47,1),(95,'123 Đường Trần Hưng Đạo','Thành phố Hạ Long','Phường Hồng Hà',48,1),(96,'456 Đường Bạch Đằng','Thành phố Hạ Long','Phường Hồng Gai',48,1),(97,'789 Đường Hùng Vương','Thành phố Đông Hà','Phường 5',49,1),(98,'123 Đường Trần Hưng Đạo','Thành phố Đông Hà','Phường 3',49,1),(99,'456 Đường Lê Hồng Phong','Thành phố Sóc Trăng','Phường 3',50,1),(100,'789 Đường Phú Lợi','Thành phố Sóc Trăng','Phường 2',50,1),(101,'123 Đường Tô Hiệu','Thành phố Sơn La','Phường Quyết Thắng',51,1),(102,'456 Đường 3/2','Thành phố Sơn La','Phường Tô Hiệu',51,1),(103,'789 Đường 30/4','Thành phố Tây Ninh','Phường 1',52,1),(104,'123 Đường Lê Lợi','Thành phố Tây Ninh','Phường 2',52,1),(105,'456 Đường Lý Bôn','Thành phố Thái Bình','Phường Bồ Xuyên',53,1),(106,'789 Đường Trần Hưng Đạo','Thành phố Thái Bình','Phường Trần Hưng Đạo',53,1),(107,'123 Đường Hoàng Văn Thụ','Thành phố Thái Nguyên','Phường Phan Đình Phùng',54,1),(108,'456 Đường Cách Mạng Tháng 8','Thành phố Thái Nguyên','Phường Hoàng Văn Thụ',54,1),(109,'789 Đường Trần Phú','Thành phố Thanh Hóa','Phường Ba Đình',55,1),(110,'123 Đường Bà Triệu','Thành phố Thanh Hóa','Phường Điện Biên',55,1),(111,'456 Đường Hùng Vương','Thành phố Huế','Phường Phú Nhuận',56,1),(112,'789 Đường Lê Lợi','Thành phố Huế','Phường Vĩnh Ninh',56,1),(113,'123 Đường 30/4','Thành phố Mỹ Tho','Phường 1',57,1),(114,'456 Đường Lý Thường Kiệt','Thành phố Mỹ Tho','Phường 2',57,1),(115,'789 Đường Nguyễn Đình Chiểu','Thành phố Trà Vinh','Phường 7',58,1),(116,'123 Đường Phạm Ngũ Lão','Thành phố Trà Vinh','Phường 9',58,1),(117,'456 Đường Tân Trào','Thành phố Tuyên Quang','Phường Minh Xuân',59,1),(118,'789 Đường Lê Lợi','Thành phố Tuyên Quang','Phường Phan Thiết',59,1),(119,'123 Đường 3/2','Thành phố Vĩnh Long','Phường 1',60,1),(120,'456 Đường Phạm Hùng','Thành phố Vĩnh Long','Phường 9',60,1),(121,'789 Đường Mê Linh','Thành phố Vĩnh Yên','Phường Khai Quang',61,1),(122,'123 Đường Nguyễn Tất Thành','Thành phố Vĩnh Yên','Phường Ngô Quyền',61,1),(123,'456 Đường Điện Biên','Thành phố Yên Bái','Phường Đồng Tâm',62,1),(124,'789 Đường Trần Phú','Thành phố Yên Bái','Phường Nguyễn Phúc',62,1),(125,'123 Đường Nguyễn Thị Minh Khai','Quận 3','Phường 6',63,1),(126,'456 Đường Cộng Hòa','Quận Tân Bình','Phường 4',63,1),(127,'123 ABC','klạdfkl','sdfdf',1,0),(128,'123 Đường Nguyễn Trãi1','Phường 1','Phường 1',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `trip` WRITE;
INSERT INTO `trip` VALUES (3,_binary '','2024-11-20 19:10:00.000000',0.05,500000.00,1,9,1,1,8,17,15),(4,_binary '','2024-11-30 09:00:00.000000',4,300000.00,2,8,2,2,7,17,15),(5,_binary '','2024-11-30 23:55:00.000000',2,20000.00,3,2,NULL,5,1,3,1),(7,_binary '','2024-10-31 18:30:00.000000',2,200000.00,8,2,NULL,20,1,4,1),(8,_binary '','2024-11-16 12:11:00.000000',10,200000.00,3,2,9,6,1,3,2),(9,_binary '','2024-11-08 01:42:00.000000',10,10000.00,9,2,NULL,11,1,3,2),(10,_binary '','2024-11-30 15:16:00.000000',0.1,300000.00,19,9,2,46,8,18,15),(12,_binary '\0','2025-12-15 16:31:00.000000',12,250000.00,10,9,3,9,8,18,15),(13,_binary '\0','2024-12-10 16:30:00.000000',12,300000.00,6,9,NULL,7,8,17,15),(14,_binary '\0','2024-12-14 16:30:00.000000',3,250000.00,4,63,NULL,7,8,126,15),(15,_binary '','2024-01-14 16:00:00.000000',10,250000.00,1,63,NULL,1,8,126,16),(16,_binary '\0','2024-12-14 16:00:00.000000',10,500000.00,3,2,4,6,1,3,2),(17,_binary '\0','2024-12-20 16:00:00.000000',12,600000.00,11,63,20,13,8,126,16),(18,_binary '\0','2024-12-10 12:43:00.000000',3,300000.00,2,63,NULL,8,8,126,15),(19,_binary '','2024-11-30 13:48:00.000000',1,400000.00,11,2,NULL,2,1,4,1),(20,_binary '','2024-11-20 14:11:00.000000',10,100000.00,2,1,NULL,1,2,1,3),(21,_binary '','2024-11-19 14:29:00.000000',12,700000.00,17,63,7,46,8,126,15),(22,_binary '','2024-11-29 10:05:00.000000',0.1,100000.00,1,63,NULL,10,8,126,15);
UNLOCK TABLES;

LOCK TABLES `trip` WRITE;

LOCK TABLES `trip` WRITE;
INSERT INTO `trip`
(`id`, `completed`, `departure_date_time`, `duration`, `price`, `coach_id`, `dest_id`, `discount_id`, `driver_id`, `source_id`, `drop_off_location_id`, `pick_up_location_id`)
VALUES
    (23, b'0', '2024-12-25 08:00:00.000000', 5, 150000.00, 2, 10, 1, 3, 9, 12, 8),
    (24, b'1', '2024-12-31 10:30:00.000000', 8, 200000.00, 5, 7, 2, 4, 8, 15, 10),
    (25, b'0', '2025-01-05 14:15:00.000000', 6, 180000.00, 6, 8, 3, 5, 9, 13, 11),
    (26, b'1', '2024-11-18 06:45:00.000000', 7, 250000.00, 1, 9, NULL, 2, 8, 10, 7),
    (27, b'0', '2024-12-10 09:00:00.000000', 4, 220000.00, 3, 2, 4, 6, 7, 14, 6),
    (28, b'1', '2024-12-15 18:30:00.000000', 9, 300000.00, 7, 3, NULL, 7, 2, 9, 12),
    (29, b'0', '2024-11-25 12:00:00.000000', 2.5, 130000.00, 9, 5, NULL, 8, 4, 15, 9),
    (30, b'1', '2024-12-20 21:45:00.000000', 3, 200000.00, 4, 6, 2, 9, 6, 11, 13),
    (31, b'0', '2025-01-10 07:30:00.000000', 12, 450000.00, 10, 4, 5, 10, 1, 3, 2),
    (32, b'1', '2024-12-22 14:20:00.000000', 8, 400000.00, 8, 7, NULL, 3, 5, 16, 14),
    (33, b'1', '2025-01-15 11:15:00.000000', 6, 350000.00, 11, 9, 3, 4, 7, 12, 11),
    (34, b'0', '2025-01-08 20:00:00.000000', 5, 300000.00, 2, 3, 1, 5, 8, 14, 6),
    (35, b'0', '2024-12-29 16:40:00.000000', 10, 500000.00, 6, 10, 2, 7, 9, 13, 8),
    (36, b'1', '2024-11-30 19:00:00.000000', 3, 250000.00, 5, 4, NULL, 8, 6, 15, 10),
    (37, b'0', '2025-01-12 09:45:00.000000', 7, 280000.00, 3, 2, 4, 9, 4, 12, 7),
    (38, b'1', '2024-12-11 22:30:00.000000', 4, 300000.00, 7, 6, NULL, 2, 1, 11, 5),
    (39, b'0', '2025-01-02 08:15:00.000000', 6, 200000.00, 8, 9, 3, 6, 5, 10, 9),
    (40, b'1', '2024-12-27 17:00:00.000000', 5.5, 250000.00, 9, 7, NULL, 4, 3, 9, 12),
    (41, b'0', '2025-01-15 08:00:00.000000', 6, 350000.00, 1, 2, 3, 10, 1, 3, 8),
    (42, b'0', '2025-01-18 14:30:00.000000', 5.5, 320000.00, 2, 2, NULL, 11, 1, 4, 9),
    (43, b'0', '2025-01-20 07:45:00.000000', 6, 340000.00, 3, 1, 4, 12, 5, 9, 3),
    (44, b'0', '2025-01-22 12:15:00.000000', 5, 330000.00, 4, 1, 1, 13, 2, 8, 4),
    (45, b'0', '2025-01-10 09:00:00.000000', 8, 400000.00, 5, 9, 2, 14, 8, 16, 14),
    (46, b'0', '2025-01-12 13:45:00.000000', 7.5, 380000.00, 6, 9, 3, 15, 8, 15, 13),
    (47, b'0', '2025-01-14 06:30:00.000000', 8, 390000.00, 7, 8, 4, 16, 7, 13, 16),
    (48, b'0', '2025-01-16 19:00:00.000000', 8, 410000.00, 8, 8, 5, 17, 9, 14, 15),
    (49, b'0', '2025-01-08 22:30:00.000000', 10, 500000.00, 9, 63, NULL, 18, 8, 126, 15),
    (50, b'0', '2025-01-10 11:45:00.000000', 9.5, 480000.00, 10, 63, 2, 19, 8, 125, 14),
    (51, b'0', '2025-01-12 18:00:00.000000', 10, 520000.00, 11, 8, 1, 19, 63, 15, 126),
    (52, b'0', '2025-01-14 09:30:00.000000', 9.5, 490000.00, 12, 8, NULL, 20, 63, 14, 125);
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
LOCK TABLES `trip_log` WRITE;
INSERT INTO `trip_log` VALUES (2,'cháy xe','bình thuận','2024-10-27 19:12:27.756708','OTHER','admin',3);
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
LOCK TABLES `review` WRITE;
INSERT INTO `review` VALUES (1,5,'tuyệt vời','2024-10-25 19:35:41.010868',5,5,3,'user1'),(2,4,'tốt','2024-11-01 14:42:30.600832',4,4,7,'user1');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `notification` WRITE;
INSERT INTO `notification` VALUES (4,'Chuyến đi của bạn từ Bình Định (Đón tại: 123 Đường Trần Hưng Đạo, Phường Lê Lợi, Thành phố Quy Nhơn, Bình Định) đến Bình Dương (Trả tại: 789 Đường Cách Mạng Tháng 8, Phường Phú Cường, Thành phố Thủ Dầu Một, Bình Dương) đã hoàn thành. Bạn đã nhận được 4913.4730 điểm xu.','user1','INDIVIDUAL','2024-10-25 19:35:19.071659','Hoàn thành chuyến đi','system',3),(5,'Vé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-26 22:00:00.053196','Nhắc nhở thanh toán','system',NULL),(6,'Vé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-26 22:00:00.208390','Vé đặt đã bị hủy','system',NULL),(7,'Vé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-29 14:41:41.136239','Nhắc nhở thanh toán','system',NULL),(8,'Vé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-29 14:41:41.169091','Nhắc nhở thanh toán','system',NULL),(9,'Vé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-29 14:41:41.186423','Nhắc nhở thanh toán','system',NULL),(10,'Vé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-29 14:41:41.227625','Vé đặt đã bị hủy','system',NULL),(11,'Vé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-29 14:41:41.281062','Vé đặt đã bị hủy','system',NULL),(12,'Vé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-29 14:41:41.350263','Vé đặt đã bị hủy','system',NULL),(13,'Chuyến đi của bạn từ An Giang (Đón tại: 123 Đường Nguyễn Trãi, Phường 1, Thành phố Long Xuyên, An Giang) đến Bà Rịa - Vũng Tàu (Trả tại: 123 Đường Lê Lợi, Phường Thắng Nhì, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu) đã hoàn thành. Bạn đã nhận được 2500.0000 điểm xu.','user1','INDIVIDUAL','2024-10-31 20:55:23.845798','Hoàn thành chuyến đi','system',7),(14,'Chuyến đi của bạn từ An Giang (Đón tại: 123 Đường Nguyễn Trãi, Phường 1, Thành phố Long Xuyên, An Giang) đến Bà Rịa - Vũng Tàu (Trả tại: 123 Đường Lê Lợi, Phường Thắng Nhì, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu) đã hoàn thành. Bạn đã nhận được 2500.0000 điểm xu.','user1','INDIVIDUAL','2024-10-31 20:55:24.129608','Hoàn thành chuyến đi','system',7),(15,'Kính chào Nguyễn Hải,\nVé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-31 21:00:00.047412','Nhắc nhở thanh toán','system',NULL),(16,'Kính chào Nguyễn Hải,\nVé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-31 21:00:00.190269','Nhắc nhở thanh toán','system',NULL),(17,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-31 21:00:00.205319','Vé đặt đã bị hủy','system',NULL),(18,'Kính chào Nguyễn Hải,\nVé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-31 21:00:00.321425','Nhắc nhở thanh toán','system',NULL),(19,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-31 21:00:00.412751','Vé đặt đã bị hủy','system',NULL),(20,'Kính chào Châu  Diễn,\nVé đặt của quý khách chưa được thanh toán. Vui lòng thanh toán trước 24 giờ khởi hành.','HuyDien','INDIVIDUAL','2024-10-31 21:00:00.438972','Nhắc nhở thanh toán','system',NULL),(21,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-10-31 21:00:00.703413','Vé đặt đã bị hủy','system',NULL),(22,'Kính chào Châu  Diễn,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','HuyDien','INDIVIDUAL','2024-10-31 21:00:00.881087','Vé đặt đã bị hủy','system',NULL),(23,'Kính chào Nguyễn Hải,\nChuyến xe của quý khách sẽ khởi hành vào 2024-10-31T18:30.','user1','INDIVIDUAL','2024-11-04 09:00:00.011255','Nhắc nhở khởi hành','system',NULL),(24,'Kính chào Nguyễn Hải,\nChuyến xe của quý khách sẽ khởi hành vào 2024-10-31T18:30.','user1','INDIVIDUAL','2024-11-04 09:00:00.074767','Nhắc nhở khởi hành','system',NULL),(25,'Kính chào Nguyễn Hải,\nChuyến xe của quý khách sẽ khởi hành vào 2024-10-31T18:30.','user1','INDIVIDUAL','2024-11-06 09:00:00.056756','Nhắc nhở khởi hành','system',NULL),(26,'Kính chào Nguyễn Hải,\nChuyến xe của quý khách sẽ khởi hành vào 2024-10-31T18:30.','user1','INDIVIDUAL','2024-11-06 09:00:00.300793','Nhắc nhở khởi hành','system',NULL),(27,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-11-07 15:17:00.345359','Vé đặt đã bị hủy','system',NULL),(28,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-11-07 15:17:00.463387','Vé đặt đã bị hủy','system',NULL),(29,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-11-07 15:17:00.542101','Vé đặt đã bị hủy','system',NULL),(30,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.','user1','INDIVIDUAL','2024-11-07 15:17:00.611991','Vé đặt đã bị hủy','system',NULL),(31,'Chuyến đi của bạn từ An Giang (Đón tại: 456 Đường Trần Hưng Đạo, Phường Bình Khánh, Thành phố Long Xuyên, An Giang) đến Bà Rịa - Vũng Tàu (Trả tại: 789 Đường 30/4, Phường 9, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu) đã hoàn thành. Bạn đã nhận được 1100.0000 điểm xu.','user1','INDIVIDUAL','2024-11-10 19:59:36.702112','Hoàn thành chuyến đi','system',9),(32,'Chuyến đi của bạn từ Bà Rịa - Vũng Tàu (Đón tại: 789 Đường 30/4, Phường 9, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu) đến An Giang (Trả tại: 123 Đường Nguyễn Trãi, Phường 1, Thành phố Long Xuyên, An Giang) đã hoàn thành. Bạn đã nhận được 1.000 ₫ điểm xu.','user1','INDIVIDUAL','2024-11-22 12:00:06.809180','THÔNG BÁO HOÀN THÀNH CHUYẾN ĐI','system',20),(33,'Kính chào Nguyễn Hải,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.\n\nThông tin chuyến đi:\n- Tuyến: Bà Rịa - Vũng Tàu\n- Giờ khởi hành: An Giang\n- Địa điểm đón: 2024-11-20T14:11\n- Địa điểm trả: 789 Đường 30/4\n- Chỗ ngồi: 123 Đường Nguyễn Trãi\n- Giá vé: A1\n','user1','INDIVIDUAL','2024-11-22 12:47:24.961766','Vé đặt đã bị hủy','system',NULL),(34,'Chuyến đi của bạn từ Bình Định (Đón tại: 123 Đường Trần Hưng Đạo, Phường Lê Lợi, Thành phố Quy Nhơn, Bình Định) đến Thành Phố Hồ Chí Minh (Trả tại: 456 Đường Cộng Hòa, Phường 4, Quận Tân Bình, Thành Phố Hồ Chí Minh) đã hoàn thành. Bạn đã nhận được 1.000 ₫ điểm xu.','HuyDien','INDIVIDUAL','2024-11-29 10:18:40.204354','THÔNG BÁO HOÀN THÀNH CHUYẾN ĐI','system',22),(35,'Chuyến đi của bạn từ Bình Định (Đón tại: 123 Đường Trần Hưng Đạo, Phường Lê Lợi, Thành phố Quy Nhơn, Bình Định) đến Thành Phố Hồ Chí Minh (Trả tại: 456 Đường Cộng Hòa, Phường 4, Quận Tân Bình, Thành Phố Hồ Chí Minh) đã hoàn thành. Bạn đã nhận được 1.000 ₫ điểm xu.','HuyDien','INDIVIDUAL','2024-11-29 10:18:40.231873','THÔNG BÁO HOÀN THÀNH CHUYẾN ĐI','system',22),(36,'Chuyến đi của bạn từ Bình Định (Đón tại: 123 Đường Trần Hưng Đạo, Phường Lê Lợi, Thành phố Quy Nhơn, Bình Định) đến Thành Phố Hồ Chí Minh (Trả tại: 456 Đường Cộng Hòa, Phường 4, Quận Tân Bình, Thành Phố Hồ Chí Minh) đã hoàn thành. Bạn đã nhận được 1.000 ₫ điểm xu.','HuyDien','INDIVIDUAL','2024-11-29 10:18:40.246007','THÔNG BÁO HOÀN THÀNH CHUYẾN ĐI','system',22),(37,'Chuyến đi của bạn từ Bình Định (Đón tại: 123 Đường Trần Hưng Đạo, Phường Lê Lợi, Thành phố Quy Nhơn, Bình Định) đến Thành Phố Hồ Chí Minh (Trả tại: 456 Đường Cộng Hòa, Phường 4, Quận Tân Bình, Thành Phố Hồ Chí Minh) đã hoàn thành. Bạn đã nhận được 1.000 ₫ điểm xu.','HuyDien','INDIVIDUAL','2024-11-29 10:18:40.258275','THÔNG BÁO HOÀN THÀNH CHUYẾN ĐI','system',22),(38,'Chuyến đi của bạn từ Bình Định (Đón tại: 123 Đường Trần Hưng Đạo, Phường Lê Lợi, Thành phố Quy Nhơn, Bình Định) đến Thành Phố Hồ Chí Minh (Trả tại: 456 Đường Cộng Hòa, Phường 4, Quận Tân Bình, Thành Phố Hồ Chí Minh) đã hoàn thành. Bạn đã nhận được 1.000 ₫ điểm xu.','HuyDien','INDIVIDUAL','2024-11-29 10:18:40.274213','THÔNG BÁO HOÀN THÀNH CHUYẾN ĐI','system',22),(39,'Kính chào Châu  Diễn,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.\n\nThông tin chuyến đi:\n- Tuyến: An Giang\n- Giờ khởi hành: Bà Rịa - Vũng Tàu\n- Địa điểm đón: 2024-11-30T13:48\n- Địa điểm trả: 123 Đường Nguyễn Trãi\n- Chỗ ngồi: 123 Đường Lê Lợi\n- Giá vé: B1\n','HuyDien','INDIVIDUAL','2024-11-29 13:48:00.555249','Vé đặt đã bị hủy','system',NULL),(40,'Kính chào Châu  Diễn,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.\n\nThông tin chuyến đi:\n- Tuyến: An Giang\n- Giờ khởi hành: Bà Rịa - Vũng Tàu\n- Địa điểm đón: 2024-11-30T13:48\n- Địa điểm trả: 123 Đường Nguyễn Trãi\n- Chỗ ngồi: 123 Đường Lê Lợi\n- Giá vé: A3\n','HuyDien','INDIVIDUAL','2024-11-29 13:48:00.924968','Vé đặt đã bị hủy','system',NULL),(41,'Kính chào Châu  Diễn,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.\n\nThông tin chuyến đi:\n- Tuyến: Bình Định\n- Giờ khởi hành: Bình Dương\n- Địa điểm đón: 2024-11-30T15:16\n- Địa điểm trả: 123 Đường Trần Hưng Đạo\n- Chỗ ngồi: 123 Đường Nguyễn Du\n- Giá vé: A1\n','HuyDien','INDIVIDUAL','2024-12-04 13:25:01.072873','Vé đặt đã bị hủy','system',NULL),(42,'Kính chào Châu  Diễn,\nVé của quý khách đã bị hủy do không thanh toán trước 24 giờ khởi hành.\n\nThông tin chuyến đi:\n- Tuyến: Bình Định\n- Giờ khởi hành: Bình Dương\n- Địa điểm đón: 2024-11-30T15:16\n- Địa điểm trả: 123 Đường Trần Hưng Đạo\n- Chỗ ngồi: 123 Đường Nguyễn Du\n- Giá vé: A2\n','HuyDien','INDIVIDUAL','2024-12-04 13:25:01.191630','Vé đặt đã bị hủy','system',NULL),(43,'Chuyến đi của bạn từ An Giang (Đón tại: 123 Đường Nguyễn Trãi, Phường 1, Thành phố Long Xuyên, An Giang) đến Bà Rịa - Vũng Tàu (Trả tại: 123 Đường Lê Lợi, Phường Thắng Nhì, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu) đã hoàn thành. Bạn đã nhận được 4.000 ₫ điểm xu.','HuyDien','INDIVIDUAL','2024-12-04 13:25:01.888120','THÔNG BÁO HOÀN THÀNH CHUYẾN ĐI','system',19),(44,'Chuyến đi của bạn từ An Giang (Đón tại: 123 Đường Nguyễn Trãi, Phường 1, Thành phố Long Xuyên, An Giang) đến Bà Rịa - Vũng Tàu (Trả tại: 123 Đường Lê Lợi, Phường Thắng Nhì, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu) đã hoàn thành. Bạn đã nhận được 4.000 ₫ điểm xu.','HuyDien','INDIVIDUAL','2024-12-04 13:25:02.254472','THÔNG BÁO HOÀN THÀNH CHUYẾN ĐI','system',19),(45,'Chuyến đi của bạn từ An Giang (Đón tại: 123 Đường Nguyễn Trãi, Phường 1, Thành phố Long Xuyên, An Giang) đến Bà Rịa - Vũng Tàu (Trả tại: 123 Đường Lê Lợi, Phường Thắng Nhì, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu) đã hoàn thành. Bạn đã nhận được 4.000 ₫ điểm xu.','HuyDien','INDIVIDUAL','2024-12-04 13:25:02.583013','THÔNG BÁO HOÀN THÀNH CHUYẾN ĐI','system',19),(46,'Chuyến đi của bạn từ An Giang (Đón tại: 123 Đường Nguyễn Trãi, Phường 1, Thành phố Long Xuyên, An Giang) đến Bà Rịa - Vũng Tàu (Trả tại: 123 Đường Lê Lợi, Phường Thắng Nhì, Thành phố Vũng Tàu, Bà Rịa - Vũng Tàu) đã hoàn thành. Bạn đã nhận được 4.000 ₫ điểm xu.','HuyDien','INDIVIDUAL','2024-12-04 13:25:02.893800','THÔNG BÁO HOÀN THÀNH CHUYẾN ĐI','system',19);
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `user_notification` WRITE;
INSERT INTO `user_notification` VALUES (2,_binary '\0',_binary '','2024-10-25 19:35:29.459544',4,'user1'),(3,_binary '\0',_binary '','2024-10-27 20:30:40.311267',5,'user1'),(4,_binary '\0',_binary '','2024-10-27 20:30:37.484165',6,'user1'),(5,_binary '\0',_binary '','2024-10-29 16:45:03.408217',7,'user1'),(6,_binary '\0',_binary '','2024-10-29 16:09:29.747651',8,'user1'),(7,_binary '\0',_binary '','2024-10-29 16:45:06.329657',9,'user1'),(8,_binary '\0',_binary '','2024-10-29 16:08:49.961268',10,'user1'),(9,_binary '\0',_binary '','2024-10-29 16:45:05.085093',11,'user1'),(10,_binary '\0',_binary '','2024-10-29 16:08:43.383973',12,'user1'),(11,_binary '\0',_binary '','2024-11-02 23:31:23.505455',13,'user1'),(12,_binary '\0',_binary '','2024-11-06 14:24:04.388459',14,'user1'),(13,_binary '\0',_binary '','2024-11-06 14:24:05.776387',15,'user1'),(14,_binary '\0',_binary '','2024-11-06 14:24:06.974281',16,'user1'),(15,_binary '\0',_binary '','2024-11-06 14:24:07.955360',17,'user1'),(16,_binary '\0',_binary '','2024-11-06 14:24:09.772989',18,'user1'),(17,_binary '\0',_binary '','2024-11-06 14:24:10.788351',19,'user1'),(18,_binary '\0',_binary '','2024-11-01 12:17:40.153040',20,'HuyDien'),(19,_binary '\0',_binary '','2024-11-06 14:24:11.837553',21,'user1'),(20,_binary '\0',_binary '','2024-11-01 14:32:18.222182',22,'HuyDien'),(21,_binary '\0',_binary '','2024-11-06 14:24:12.872486',23,'user1'),(22,_binary '\0',_binary '','2024-11-06 14:24:13.938920',24,'user1'),(23,_binary '\0',_binary '','2024-11-06 14:24:15.090315',25,'user1'),(24,_binary '\0',_binary '','2024-11-06 14:24:16.076762',26,'user1'),(25,_binary '\0',_binary '','2024-11-14 12:58:45.528484',27,'user1'),(26,_binary '\0',_binary '','2024-11-15 13:34:54.727746',28,'user1'),(27,_binary '\0',_binary '','2024-11-15 13:34:53.107108',29,'user1'),(28,_binary '\0',_binary '','2024-11-15 13:34:47.923745',30,'user1'),(29,_binary '\0',_binary '','2024-11-15 13:34:56.238192',31,'user1'),(30,_binary '\0',_binary '','2024-11-22 13:28:40.787720',32,'user1'),(31,_binary '\0',_binary '','2024-11-22 13:28:37.655695',33,'user1'),(32,_binary '\0',_binary '','2024-11-29 10:18:57.380294',34,'HuyDien'),(33,_binary '\0',_binary '','2024-11-29 10:31:07.862401',35,'HuyDien'),(34,_binary '\0',_binary '','2024-12-04 13:28:01.718837',36,'HuyDien'),(35,_binary '\0',_binary '\0',NULL,37,'HuyDien'),(36,_binary '\0',_binary '\0',NULL,38,'HuyDien'),(37,_binary '\0',_binary '\0',NULL,39,'HuyDien'),(38,_binary '\0',_binary '\0',NULL,40,'HuyDien'),(39,_binary '\0',_binary '\0',NULL,41,'HuyDien'),(40,_binary '\0',_binary '\0',NULL,42,'HuyDien'),(41,_binary '\0',_binary '\0',NULL,43,'HuyDien'),(42,_binary '\0',_binary '\0',NULL,44,'HuyDien'),(43,_binary '\0',_binary '\0',NULL,45,'HuyDien'),(44,_binary '\0',_binary '\0',NULL,46,'HuyDien');
UNLOCK TABLES;


CREATE TABLE `booking` (
                           `id` bigint NOT NULL AUTO_INCREMENT,
                           `booking_date_time` datetime(6) DEFAULT NULL,
                           `booking_type` enum('ONEWAY','ROUNDTRIP') DEFAULT NULL,
                           `cust_first_name` varchar(255) DEFAULT NULL,
                           `cust_last_name` varchar(255) DEFAULT NULL,
                           `email` varchar(255) DEFAULT NULL,
                           `payment_date_time` datetime(6) DEFAULT NULL,
                           `payment_method` enum('CARD','CASH') DEFAULT NULL,
                           `payment_status` enum('CANCEL','COMPLETED','PAID','REFUNDED','REFUND_PENDING','UNPAID') DEFAULT NULL,
                           `phone` varchar(255) DEFAULT NULL,
                           `points_earned` decimal(38,2) DEFAULT '0.00',
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `booking` WRITE;
INSERT INTO `booking` VALUES (1,'2024-11-25 23:54:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-25 23:57:47.289787','CARD','REFUNDED','0987654321',0.00,0.00,'A13',300000.00,13,'HuyDien'),(2,'2024-11-25 23:54:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-25 23:57:47.295788','CARD','REFUNDED','0987654321',0.00,0.00,'A14',300000.00,13,'HuyDien'),(3,'2024-11-25 23:54:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-25 23:57:47.299809','CARD','REFUNDED','0987654321',0.00,0.00,'A15',300000.00,13,'HuyDien'),(4,'2024-11-25 23:54:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-25 23:57:47.306138','CARD','REFUNDED','0987654321',0.00,0.00,'B13',300000.00,13,'HuyDien'),(5,'2024-11-25 23:54:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-25 23:57:47.311140','CARD','PAID','0987654321',0.00,0.00,'B14',300000.00,13,'HuyDien'),(6,'2024-11-26 00:00:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-26 00:20:10.316229','CARD','REFUNDED','0987654321',0.00,0.00,'A13',300000.00,13,'HuyDien'),(7,'2024-11-26 00:00:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-26 00:20:10.343566','CARD','REFUNDED','0987654321',0.00,0.00,'A14',300000.00,13,'HuyDien'),(8,'2024-11-26 00:00:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-26 00:20:10.349569','CARD','PAID','0987654321',0.00,0.00,'A15',300000.00,13,'HuyDien'),(9,'2024-11-26 21:28:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-26 22:28:46.580033','CARD','PAID','0987654321',4000.00,0.00,'A1',400000.00,19,'HuyDien'),(10,'2024-11-26 21:28:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-26 22:28:46.585046','CARD','PAID','0987654321',4000.00,0.00,'A2',400000.00,19,'HuyDien'),(11,'2024-11-26 21:28:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-26 22:28:46.592044','CARD','REFUNDED','0987654321',0.00,0.00,'B1',400000.00,19,'HuyDien'),(12,'2024-11-26 21:28:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-26 22:28:46.596312','CARD','REFUNDED','0987654321',0.00,0.00,'B2',400000.00,19,'HuyDien'),(13,'2024-11-27 19:01:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-27 19:03:38.470643','CASH','UNPAID','0987654321',0.00,0.00,'A13',300000.00,13,'HuyDien'),(14,'2024-11-27 19:01:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-27 19:04:19.386636','CASH','UNPAID','0987654321',0.00,0.00,'B13',300000.00,13,'HuyDien'),(15,'2024-11-27 19:20:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-27 19:20:51.070106','CASH','CANCEL','0987654321',0.00,0.00,'B1',400000.00,19,'HuyDien'),(16,'2024-11-27 19:21:00.000000','ONEWAY','Hệ thống','DATVEXE','datvexegiare@gmail.com','2024-11-27 19:23:39.907049','CASH','PAID','0987654321',0.00,0.00,'A14',300000.00,13,NULL),(17,'2024-11-29 09:09:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 09:25:58.404187','CASH','CANCEL','0987654321',0.00,0.00,'A1',291164.00,10,'HuyDien'),(18,'2024-11-29 09:09:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 09:25:58.409930','CASH','CANCEL','0987654321',0.00,0.00,'A2',291164.00,10,'HuyDien'),(19,'2024-11-29 09:26:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 09:31:03.725305','CASH','CANCEL','0987654321',0.00,0.00,'A3',500000.00,19,'HuyDien'),(20,'2024-11-29 09:31:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 10:03:54.519970','CARD','PAID','0987654321',1000.00,0.00,'A1',100000.00,22,'HuyDien'),(21,'2024-11-29 09:31:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 10:03:54.524246','CARD','PAID','0987654321',1000.00,0.00,'A2',100000.00,22,'HuyDien'),(22,'2024-11-29 09:31:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 10:03:54.528664','CARD','PAID','0987654321',1000.00,0.00,'A3',100000.00,22,'HuyDien'),(23,'2024-11-29 09:31:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 10:03:54.535121','CARD','PAID','0987654321',1000.00,0.00,'A4',100000.00,22,'HuyDien'),(24,'2024-11-29 09:31:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 10:03:54.539114','CARD','PAID','0987654321',1000.00,0.00,'A5',100000.00,22,'HuyDien'),(25,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 14:20:34.489161','CARD','PAID','0987654321',4000.00,0.00,'B1',400000.00,19,'HuyDien'),(26,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 14:20:34.493133','CARD','PAID','0987654321',4000.00,0.00,'B2',400000.00,19,'HuyDien'),(27,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 14:22:37.014065','CARD','REFUNDED','0987654321',0.00,0.00,'A1',495724.97,16,'HuyDien'),(28,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 14:22:37.019991','CARD','REFUNDED','0987654321',0.00,0.00,'A2',495724.97,16,'HuyDien'),(29,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 14:43:55.401127','CARD','REFUNDED','0987654321',0.00,0.00,'A1',495724.97,16,'HuyDien'),(30,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 14:43:55.405648','CARD','REFUNDED','0987654321',0.00,0.00,'A2',495724.97,16,'HuyDien'),(31,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 14:43:55.411906','CARD','REFUNDED','0987654321',0.00,0.00,'A3',495724.97,16,'HuyDien'),(32,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 14:43:55.415909','CARD','REFUNDED','0987654321',0.00,0.00,'A4',495724.97,16,'HuyDien'),(33,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 14:43:55.419907','CARD','REFUNDED','0987654321',0.00,0.00,'A5',495724.97,16,'HuyDien'),(34,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 15:26:09.991727','CARD','REFUNDED','0987654321',0.00,0.00,'A1',495724.97,16,'HuyDien'),(35,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 15:26:09.997929','CARD','REFUNDED','0987654321',0.00,0.00,'A2',495724.97,16,'HuyDien'),(36,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 15:26:10.004636','CARD','REFUNDED','0987654321',0.00,0.00,'B1',495724.97,16,'HuyDien'),(37,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 15:26:10.011834','CARD','PAID','0987654321',0.00,0.00,'B2',495724.97,16,'HuyDien'),(38,'2024-11-29 14:08:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-11-29 15:26:10.017789','CARD','PAID','0987654321',0.00,0.00,'B4',495724.97,16,'HuyDien');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `booking_cargo` WRITE;
INSERT INTO `booking_cargo` VALUES (1,100000.00,1,19,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `loyalty_transaction` WRITE;
INSERT INTO `loyalty_transaction` VALUES (1,1000.00,'2024-11-29 10:18:40.196507','EARN',20,'HuyDien'),(2,1000.00,'2024-11-29 10:18:40.227368','EARN',21,'HuyDien'),(3,1000.00,'2024-11-29 10:18:40.240710','EARN',22,'HuyDien'),(4,1000.00,'2024-11-29 10:18:40.254440','EARN',23,'HuyDien'),(5,1000.00,'2024-11-29 10:18:40.268115','EARN',24,'HuyDien'),(6,4000.00,'2024-12-04 13:25:01.637910','EARN',9,'HuyDien'),(7,4000.00,'2024-12-04 13:25:01.959310','EARN',10,'HuyDien'),(8,4000.00,'2024-12-04 13:25:02.286121','EARN',25,'HuyDien'),(9,4000.00,'2024-12-04 13:25:02.656712','EARN',26,'HuyDien');
UNLOCK TABLES;



DROP TABLE IF EXISTS `payment_history`;
CREATE TABLE `payment_history` (
                                   `id` bigint NOT NULL AUTO_INCREMENT,
                                   `new_status` enum('CANCEL','COMPLETED','PAID','REFUNDED','REFUND_PENDING','UNPAID') DEFAULT NULL,
                                   `old_status` enum('CANCEL','COMPLETED','PAID','REFUNDED','REFUND_PENDING','UNPAID') DEFAULT NULL,
                                   `status_change_date_time` datetime(6) DEFAULT NULL,
                                   `booking_id` bigint DEFAULT NULL,
                                   PRIMARY KEY (`id`),
                                   KEY `FK78c8n1i1pc83oleh4xdbm46d5` (`booking_id`),
                                   CONSTRAINT `FK78c8n1i1pc83oleh4xdbm46d5` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `payment_history` WRITE;
INSERT INTO `payment_history` VALUES (1,'PAID',NULL,'2024-11-25 23:57:47.289787',1),(2,'PAID',NULL,'2024-11-25 23:57:47.295788',2),(3,'PAID',NULL,'2024-11-25 23:57:47.299809',3),(4,'PAID',NULL,'2024-11-25 23:57:47.306138',4),(5,'PAID',NULL,'2024-11-25 23:57:47.311140',5),(6,'CANCEL','PAID','2024-11-25 23:59:45.325049',1),(7,'REFUND_PENDING','CANCEL','2024-11-26 00:00:09.197276',1),(8,'REFUNDED','REFUND_PENDING','2024-11-26 00:00:53.850877',1),(10,'CANCEL','PAID','2024-11-26 00:05:46.819765',2),(11,'REFUND_PENDING','CANCEL','2024-11-26 00:06:12.402137',2),(13,'REFUNDED','REFUND_PENDING','2024-11-26 00:06:23.206262',2),(14,'CANCEL','PAID','2024-11-26 00:07:49.877053',3),(15,'REFUND_PENDING','CANCEL','2024-11-26 00:08:10.126872',3),(17,'REFUNDED','REFUND_PENDING','2024-11-26 00:17:02.797838',3),(18,'PAID',NULL,'2024-11-26 00:20:10.316229',6),(19,'PAID',NULL,'2024-11-26 00:20:10.343566',7),(20,'PAID',NULL,'2024-11-26 00:20:10.349569',8),(21,'CANCEL','PAID','2024-11-26 00:21:36.216553',6),(22,'REFUND_PENDING','CANCEL','2024-11-26 00:22:20.517152',6),(23,'REFUNDED','REFUND_PENDING','2024-11-26 00:23:01.424021',6),(25,'CANCEL','PAID','2024-11-26 10:54:21.526960',7),(26,'REFUND_PENDING','CANCEL','2024-11-26 10:54:39.576453',7),(27,'PAID',NULL,'2024-11-26 22:28:46.580033',9),(28,'PAID',NULL,'2024-11-26 22:28:46.585046',10),(29,'PAID',NULL,'2024-11-26 22:28:46.592044',11),(30,'PAID',NULL,'2024-11-26 22:28:46.596312',12),(31,'CANCEL','PAID','2024-11-27 18:56:50.889634',11),(32,'REFUND_PENDING','CANCEL','2024-11-27 18:57:08.270624',11),(33,'UNPAID',NULL,'2024-11-27 19:03:38.470643',13),(34,'CANCEL','PAID','2024-11-27 19:03:56.866170',4),(35,'UNPAID',NULL,'2024-11-27 19:04:19.386636',14),(36,'UNPAID',NULL,'2024-11-27 19:20:51.070106',15),(37,'PAID',NULL,'2024-11-27 19:23:39.907049',16),(38,'REFUNDED','REFUND_PENDING','2024-11-28 14:30:00.118663',1),(39,'REFUNDED','REFUND_PENDING','2024-11-28 14:30:15.109025',2),(40,'REFUNDED','REFUND_PENDING','2024-11-28 14:30:28.763397',3),(41,'REFUNDED','REFUND_PENDING','2024-11-28 14:30:42.181830',6),(42,'REFUNDED','REFUND_PENDING','2024-11-28 14:30:56.330821',7),(43,'REFUNDED','REFUND_PENDING','2024-11-28 19:00:00.100436',11),(44,'UNPAID',NULL,'2024-11-29 09:25:58.404187',17),(45,'UNPAID',NULL,'2024-11-29 09:25:58.409930',18),(46,'UNPAID',NULL,'2024-11-29 09:31:03.725305',19),(47,'PAID',NULL,'2024-11-29 10:03:54.519970',20),(48,'PAID',NULL,'2024-11-29 10:03:54.524246',21),(49,'PAID',NULL,'2024-11-29 10:03:54.528664',22),(50,'PAID',NULL,'2024-11-29 10:03:54.535121',23),(51,'PAID',NULL,'2024-11-29 10:03:54.539114',24),(52,'REFUND_PENDING','CANCEL','2024-11-29 13:39:14.860136',4),(53,'CANCEL','PAID','2024-11-29 13:40:34.618585',12),(54,'REFUND_PENDING','CANCEL','2024-11-29 13:40:58.517875',12),(55,'CANCEL','UNPAID','2024-11-29 13:48:00.411954',15),(56,'CANCEL','UNPAID','2024-11-29 13:48:00.914066',19),(57,'REFUNDED','REFUND_PENDING','2024-11-29 14:18:19.136584',12),(59,'REFUNDED','REFUND_PENDING','2024-11-29 14:18:42.794752',4),(60,'PAID',NULL,'2024-11-29 14:20:34.489161',25),(61,'PAID',NULL,'2024-11-29 14:20:34.493133',26),(62,'PAID',NULL,'2024-11-29 14:22:37.014065',27),(63,'PAID',NULL,'2024-11-29 14:22:37.019991',28),(64,'CANCEL','PAID','2024-11-29 14:23:14.139662',27),(65,'REFUND_PENDING','CANCEL','2024-11-29 14:23:31.467902',27),(66,'REFUNDED','REFUND_PENDING','2024-11-29 14:23:46.620954',27),(68,'CANCEL','PAID','2024-11-29 14:34:17.905756',28),(69,'REFUND_PENDING','CANCEL','2024-11-29 14:34:39.880270',28),(70,'REFUNDED','REFUND_PENDING','2024-11-29 14:34:49.148963',28),(71,'REFUNDED','REFUND_PENDING','2024-11-29 14:34:49.177650',28),(72,'PAID',NULL,'2024-11-29 14:43:55.401127',29),(73,'PAID',NULL,'2024-11-29 14:43:55.405648',30),(74,'PAID',NULL,'2024-11-29 14:43:55.411906',31),(75,'PAID',NULL,'2024-11-29 14:43:55.415909',32),(76,'PAID',NULL,'2024-11-29 14:43:55.419907',33),(77,'CANCEL','PAID','2024-11-29 14:45:36.785102',29),(78,'REFUND_PENDING','CANCEL','2024-11-29 14:46:01.524609',29),(79,'REFUNDED','REFUND_PENDING','2024-11-29 14:46:25.720349',29),(81,'CANCEL','PAID','2024-11-29 14:58:43.013727',30),(82,'REFUND_PENDING','CANCEL','2024-11-29 14:59:03.604781',30),(85,'REFUNDED','REFUND_PENDING','2024-11-29 15:08:10.481471',30),(86,'REFUNDED','REFUND_PENDING','2024-11-29 15:08:10.606309',30),(87,'CANCEL','PAID','2024-11-29 15:10:33.279557',31),(88,'REFUND_PENDING','CANCEL','2024-11-29 15:10:55.920092',31),(89,'REFUNDED','REFUND_PENDING','2024-11-29 15:11:11.301130',31),(90,'CANCEL','PAID','2024-11-29 15:13:18.383366',32),(91,'REFUND_PENDING','CANCEL','2024-11-29 15:13:46.473061',32),(92,'REFUNDED','REFUND_PENDING','2024-11-29 15:13:56.859742',32),(93,'CANCEL','PAID','2024-11-29 15:15:24.443124',33),(94,'REFUND_PENDING','CANCEL','2024-11-29 15:17:46.707407',33),(95,'REFUNDED','REFUND_PENDING','2024-11-29 15:18:02.684826',33),(96,'PAID',NULL,'2024-11-29 15:26:09.991727',34),(97,'PAID',NULL,'2024-11-29 15:26:09.997929',35),(98,'PAID',NULL,'2024-11-29 15:26:10.004636',36),(99,'PAID',NULL,'2024-11-29 15:26:10.011834',37),(100,'PAID',NULL,'2024-11-29 15:26:10.017789',38),(101,'CANCEL','PAID','2024-11-29 15:28:18.449645',34),(102,'REFUND_PENDING','CANCEL','2024-11-29 15:28:54.890637',34),(103,'REFUNDED','REFUND_PENDING','2024-11-29 15:29:16.617548',34),(104,'REFUNDED','REFUND_PENDING','2024-11-29 15:29:16.625832',34),(105,'CANCEL','PAID','2024-11-29 15:43:22.365633',35),(106,'REFUND_PENDING','CANCEL','2024-11-29 15:43:42.442221',35),(107,'REFUNDED','REFUND_PENDING','2024-11-29 15:43:51.998147',35),(109,'CANCEL','PAID','2024-11-29 16:02:36.308639',36),(110,'REFUND_PENDING','CANCEL','2024-11-29 16:02:59.947647',36),(111,'REFUNDED','REFUND_PENDING','2024-11-29 16:03:24.620138',36),(112,'REFUNDED','REFUND_PENDING','2024-11-29 16:03:24.688165',36),(113,'CANCEL','UNPAID','2024-12-04 13:25:01.006659',17),(114,'CANCEL','UNPAID','2024-12-04 13:25:01.191630',18);
UNLOCK TABLES;


SELECT * FROM booking b ;
SELECT * FROM trip ;
SELECT * FROM discount d ;
SELECT * FROM `user` u ;
SELECT * FROM user_permission up ;
SELECT * FROM `role` r ;
SELECT * FROM notification n ;
SELECT * FROM user_notification un ;
SELECT * FROM review r ;
select * from province p ;



CREATE INDEX idx_booking_trip_id ON booking(trip_id);
CREATE INDEX idx_booking_username ON booking(username);
CREATE INDEX idx_booking_payment_status ON booking(payment_status);
CREATE INDEX idx_booking_booking_date ON booking(booking_date_time);

CREATE INDEX idx_booking_cargo_booking_id ON booking_cargo(booking_id);
CREATE INDEX idx_booking_cargo_cargo_id ON booking_cargo(cargo_id);

CREATE INDEX idx_location_province_id ON location(province_id);
CREATE INDEX idx_location_is_active ON location(is_active);

CREATE INDEX idx_loyalty_trans_booking_id ON loyalty_transaction(booking_id);
CREATE INDEX idx_loyalty_trans_username ON loyalty_transaction(username);
CREATE INDEX idx_loyalty_trans_date ON loyalty_transaction(transaction_date);

CREATE INDEX idx_notification_sender ON notification(sender_username);
CREATE INDEX idx_notification_trip_id ON notification(trip_id);
CREATE INDEX idx_notification_send_date ON notification(send_date_time);

CREATE INDEX idx_payment_history_booking_id ON payment_history(booking_id);
CREATE INDEX idx_payment_history_change_date ON payment_history(status_change_date_time);

CREATE INDEX idx_review_trip_id ON review(trip_id);
CREATE INDEX idx_review_username ON review(username);
CREATE INDEX idx_review_created_at ON review(created_at);

CREATE INDEX idx_token_username ON token(username);
CREATE INDEX idx_token_expired_revoked ON token(expired, revoked);

CREATE INDEX idx_trip_coach_id ON trip(coach_id);
CREATE INDEX idx_trip_dest_id ON trip(dest_id);
CREATE INDEX idx_trip_source_id ON trip(source_id);
CREATE INDEX idx_trip_driver_id ON trip(driver_id);
CREATE INDEX idx_trip_departure_date ON trip(departure_date_time);
CREATE INDEX idx_trip_completed ON trip(completed);
CREATE INDEX idx_trip_pickup_location ON trip(pick_up_location_id);
CREATE INDEX idx_trip_dropoff_location ON trip(drop_off_location_id);

CREATE INDEX idx_trip_log_created_by ON trip_log(created_by);
CREATE INDEX idx_trip_log_trip_id ON trip_log(trip_id);
CREATE INDEX idx_trip_log_time ON trip_log(log_time);

CREATE INDEX idx_user_notification_notification_id ON user_notification(notification_id);
CREATE INDEX idx_user_notification_username ON user_notification(username);
CREATE INDEX idx_user_notification_read_status ON user_notification(is_read);

CREATE INDEX idx_user_permission_username ON user_permission(username);
CREATE INDEX idx_user_permission_role_id ON user_permission(role_id);



