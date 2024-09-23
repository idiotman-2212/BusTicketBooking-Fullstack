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
  PRIMARY KEY (`username`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
  UNIQUE KEY `UK_589idila9li6a4arw1t8ht1gx` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES ('admin',_binary '','Lương Bình, Phước Thắng, Tuy Phước, Bình Định','2002-02-22','dienchau45@gmail.com','Diễn',_binary '\0','Châu','$2a$10$dki8BBLw8Z2DKKFUM4mlzutBuhPmZ75rlQ/2j1Y40YnO1k1ROrIwG','0326917158'),('HuyDien',_binary '','23 Lý Thường Kiệt, Quy Nhơn, Bình Định','2002-12-22','abclsdjf23@gmail.com','Châu ',_binary '\0','Diễn','$2a$10$twnkqal5hZFqA9yFo0J6/OqWOYbnWXNmD02zN44b1J1AIox1vW2Aq','0987654321'),('johndoe',_binary '',NULL,NULL,'johndoe@example.com','John',_binary '\0','Doe','$2a$10$bdykQQ7qHDCs4Z1btywaL.qDc8MFfeysPKu/bpd6qn/C3GKzi5Ruu','0123456789'),('LeHaThanh',_binary '',NULL,NULL,'lehathanh@ptithcm.edu.vn','Lê',_binary '\0','Thanh','$2a$10$zagRsm5vU.4wuITFziq3euNNg/vuLINW1T1fI80uPhOFG0WY4jcGC','0937142075'),('nguyenvana',_binary '','127A Trần Phú, Quy Nhơn, Bình Định','2002-07-07','nguyenvana@gmail.com','Nguyễn ',_binary '','Văn A','$2a$10$qoVRUAPQXAQhaw1eOcvoJ.UqHlZlKKxfDlC0uiSG6sn3ovrlmLwOO','0935841720'),('nguyenvanb',_binary '','53A Hàm Nghi, Quy Nhơn, Bình Định','2001-07-07','nguyenvanb@gmail.com','Nguyễn ',_binary '\0','Văn B','$2a$10$Og5Py3or23yle/YnDSFG5OBFyUUmN337/K6TAepm7Hr.D.DwIMPnS','0772419780'),('user1',_binary '','Số 10 Lê Duẩn, TP Quy Nhơn, Bình Định','2002-01-01','user1@gmail.com','Nguyễn',_binary '\0','Hải','$2a$10$Ea.f5pdM7vKPuuL4sz4zju8Yu7y4tMMG4QvLGYKAqmhn1bOeO1dhS','0901234567'),('user10',_binary '','Số 100 Nguyễn Tất Thành, TP Quy Nhơn, Bình Định','2002-01-01','user10@gmail.com','Trần',_binary '\0','Dũng','$2a$10$gEuuqReE4fgIt19sqQedhO7Jl9dp/dSOh812evH9Ta3cHaB5m9NNi','0901234568'),('user11',_binary '','321 Hùng Vương, Hoài Nhơn, Bình Định','2002-01-01','user11@gmail.com','Lê',_binary '','Trang','$2a$10$Eyj77RCrpQ8BIRHjgZLDUOfpUESo8hL/70cSCVc4G3XRzBGeWK.KS','0934567890'),('user12',_binary '','654 Lê Lợi, Phù Mỹ, Bình Định','2002-01-01','user12@gmail.com','Lê',_binary '','Anh','$2a$10$8WHNmWqsHbEmzWz69BdxMOhClzwWgKRtvNXCqxa1zpLXxQevXOF6y','0901234569'),('user13',_binary '','Số 130 Phan Thanh, TP Quy Nhơn, Bình Định','2002-01-01','user13@gmail.com','Phạm',_binary '','Trang','$2a$10$rYbs/TgA.DkZBXvJzetdS.vTRsHW8ZkIXtsHUqG68p7k02HA2.1aO','0956789012'),('user14',_binary '','Số 140 Lê Hồng Phong, TP Quy Nhơn, Bình Định','2002-01-01','user14@gmail.com','Nguyễn',_binary '\0','Vũ','$2a$10$MU1AA8cd4n/IzOWB7evW3eyDoubngvDlIMPrXbFZu88ADylZTr1D.','0967890123'),('user15',_binary '','Số 150 Nguyễn Văn Linh, TP Quy Nhơn, Bình Định','2002-01-01','user15@gmail.com','Nguyễn',_binary '\0','Hoàng','$2a$10$o7uP7ZsiavyN6NyAqoEdIeWFBcn3.0zJhRy8Fb/SiP3FJw4CraAXq','0902112233'),('user16',_binary '','Số 160 Trần Phú, TP Quy Nhơn, Bình Định','2002-01-01','user16@gmail.com','Lê',_binary '\0','Dũng','$2a$10$dxCKeDDxSo1Mb2lX8A8RxeN0HbL34PaktLxiBXZcYqDKhDfyGIV/2','0989012345'),('user17',_binary '','Số 170 Hoàng Văn Thụ, TP Quy Nhơn, Bình Định','2002-01-01','user17@gmail.com','Võ',_binary '\0','Quân','$2a$10$7OKlpFDnHhR1SdlwBlz9mOeeGnKzfM5gqiamYGKpSL3cK/vK/I5nW','0990123456'),('user18',_binary '','Số 180 Trần Quang Diệu, TP Quy Nhơn, Bình Định','2002-01-01','user18@gmail.com','Trương',_binary '\0','Thắng','$2a$10$Z0ejcC4NZYL6nI1VcP4ryuaE.SFtm.Dpwp6FnLgv.GVJq55cvfD/C','0901122334'),('user19',_binary '','Số 190 Phan Đình Phùng, TP Quy Nhơn, Bình Định','2002-01-01','user19@gmail.com','Nguyễn',_binary '\0','Tân','$2a$10$c.mpxAJNXQchhxoOCD8G6OEW5XRWEEO5gQ/fy/CgT0kPED7KGqG7e','0912233445'),('user2',_binary '','Số 20 Trần Phú, TP Quy Nhơn, Bình Định','2002-01-01','user2@gmail.com','Nguyễn',_binary '','Anh','$2a$10$Gc1PBxW.s7egx7sEiUN63u0YFXVl/89h.Tf2s9c4vKnIRtB3nxq1m','0923344556'),('user20',_binary '','Số 200 Lý Thái Tổ, TP Quy Nhơn, Bình Định','2002-01-01','user20@gmail.com','Phạm',_binary '','Thảo','$2a$10$3LJSGlfZZWKa2Ws/d2Dr8eiiN01laTJUg4t5yAshAizMVN0fqhjdy','0934455667'),('user3',_binary '','Số 30 Nguyễn Huệ, TP Quy Nhơn, Bình Định','2002-01-01','user3@gmail.com','Nguyễn',_binary '\0','Đức','$2a$10$16ljwGzL8N0RNs0GVaUK3.ZHAv6ZqOhT.s6qeSQ4UgRZR9rLpT2u6','0945566778'),('user4',_binary '','Số 40 Ngô Mây, TP Quy Nhơn, Bình Định','2002-01-01','user4@gmail.com','Châu',_binary '\0','Điền','$2a$10$6bDY.lLQBSvycUVkKSYueuhYINmafqF7eiigNi2R9q5xyXrt2jU16','0956677889'),('user5',_binary '','Số 50 Hải Thượng Lãn Ông, TP Quy Nhơn, Bình Định','2002-01-01','user5@gmail.com','Hoàng',_binary '','Thảo','$2a$10$ePBRfddr.NGeW/tUmL.UNuS4ugXZBRP8XEF.mtL.IUfRyO0ty0F1u','0967788990'),('user6',_binary '','Số 60 Phan Chu Trinh, TP Quy Nhơn, Bình Định','2002-01-01','user6@gmail.com','Trần',_binary '\0','Anh','$2a$10$CxqHqBtNGYUv7NH72tJ6eeTwhBGAWJS1YfgT1ycA5r4D2ZKXHuX1e','0978899001'),('user7',_binary '','Số 70 Hùng Vương, TP Quy Nhơn, Bình Định','2002-01-01','user7@gmail.com','Phạm',_binary '','Trang','$2a$10$t5EvoayabxZ6iuLw5U5MqOudIrnQCgaB6XAoCzqoKcpuh9AHYc2lm','0989900112'),('user8',_binary '','Số 80 Lê Lợi, TP Quy Nhơn, Bình Định','2002-01-01','user8@gmail.com','Võ',_binary '','Thảo','$2a$10$95CzhnFMCnu9eWQb6ne5mOe61WlUIrW/aj2nhaWlau.i3QJ5G0bNa','0991001223'),('user9',_binary '','Số 90 Trần Hưng Đạo, TP Quy Nhơn, Bình Định','2002-01-01','user9@gmail.com','Trần',_binary '\0','Hải','$2a$10$0p/5Aq.jJEHTy.KOnjrLFuwwY1qY0Glxktq22RPRy8k0nGyt8wkLS','0913223344');
UNLOCK TABLES;

select * from trip t ;

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `role_code` enum('ROLE_ADMIN','ROLE_CREATE','ROLE_CUSTOMER','ROLE_DELETE','ROLE_READ','ROLE_STAFF','ROLE_UPDATE') DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `token` WRITE;
INSERT INTO `token` VALUES (1,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzE5NzU0NTkwLCJleHAiOjE3MTk4NDA5OTB9.N7UPajOgIoFnoCN0mAmyVB1Hx_kUM2bPyNKGZymzwyw','BEARER','HuyDien'),(2,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzE5NzU0NjEwLCJleHAiOjE3MTk4NDEwMTB9.Jba16iMcwY-75_cPKBmbr4F-NDuOGccFslhh9TnbUj0','BEARER','HuyDien'),(3,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcxOTc1NDgwNiwiZXhwIjoxNzE5ODQxMjA2fQ.wCnGL5HwX1ip2D3-SEjPpnPg-hO6s9ydEiV--vPfzoI','BEARER','admin'),(4,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcxOTc1NDkyNywiZXhwIjoxNzE5ODQxMzI3fQ.nwmPCUwLlOJHHp8lyDCuhX93E_cCQHZvTnP2obaChxw','BEARER','admin'),(5,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzE5NzU1MTYxLCJleHAiOjE3MTk4NDE1NjF9.wVgCVATmW_7ieZswfICcx_vUgDFq9QYDvO15--D35sg','BEARER','HuyDien'),(6,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzE5NzYyNjA3LCJleHAiOjE3MTk4NDkwMDd9.YFTJphqMM4Rj7Tx2TvK9Cvo0e_ato8fGBbSgdvbNJV8','BEARER','HuyDien'),(7,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzE5NzYyNjA3LCJleHAiOjE3MTk4NDkwMDd9.YFTJphqMM4Rj7Tx2TvK9Cvo0e_ato8fGBbSgdvbNJV8','BEARER','HuyDien'),(8,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzE5NzYyODI3LCJleHAiOjE3MTk4NDkyMjd9.7Se8CGTdGlOYwRbASA6VKXo-0pMoRCoX6lYpTncLpBg','BEARER','HuyDien'),(9,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcxOTc2NjMxNiwiZXhwIjoxNzE5ODUyNzE2fQ.NTxAf866h19YCFZYOc0LB6mK_pAPZ8xVncpfCHpVoSo','BEARER','admin'),(10,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzE5NzY2MzQ5LCJleHAiOjE3MTk4NTI3NDl9.zTG-OlRPHLE0Y1085XGaN4OrGqGZPZh9p3vWO6I_Cug','BEARER','HuyDien'),(11,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcxOTc2NjY5MSwiZXhwIjoxNzE5ODUzMDkxfQ.rEZqVFPcneofLpLDz6kVEFUfhS5NxMSc-fXHOJ_oxkI','BEARER','admin'),(12,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzE5ODEyNDM5LCJleHAiOjE3MTk4OTg4Mzl9.T1eCiGNMF7Le0qt_F8sMHl6ZWVio-a4DZkgjHMLRiU4','BEARER','HuyDien'),(13,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcxOTgxMjUwNSwiZXhwIjoxNzE5ODk4OTA1fQ.p6Om7UCBNphwe67rQLoiR2u-t_vXdDi9XvzwBtveSgk','BEARER','admin'),(14,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcxOTg0OTk2MCwiZXhwIjoxNzE5OTM2MzYwfQ.8b4f3L9uGXIHkBp_GaTSns1jTMCoVojyc4UMJaaagUI','BEARER','admin'),(15,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcxOTg1MDI5OCwiZXhwIjoxNzE5OTM2Njk4fQ.EEjJrejNF5QcRTYj0jbb-OBOqZ6mb1UrSiPTBHnTuT0','BEARER','admin'),(16,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcxOTg1MDM5OSwiZXhwIjoxNzE5OTM2Nzk5fQ.wDdYL4k2vzK6v9xvaUlHm8fKSAAZS0-JDI59qXiUB6o','BEARER','admin'),(17,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDAyMjA3NCwiZXhwIjoxNzIwMTA4NDc0fQ.WKIBOxaXDXHWUmgzELCzzMA2YZeourMGTd6Pyjv4M14','BEARER','admin'),(18,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDAyMjE0OSwiZXhwIjoxNzIwMTA4NTQ5fQ.YTSR5y3gW8ktLZUtl9oiI0LPTR-dOHQGQY6Mdmu53Hk','BEARER','admin'),(19,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDAyMjIyNCwiZXhwIjoxNzIwMTA4NjI0fQ.snAiUVVyk--jWv1SD03MG0K6fjMuxi-SUxQkQeMONfo','BEARER','admin'),(20,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzIwMDIyNjQ5LCJleHAiOjE3MjAxMDkwNDl9.qvO5rV87vdlghWtrmMUqD-1J3nyqTcbbhPmfQnSzWS0','BEARER','HuyDien'),(21,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDAyNDAyMSwiZXhwIjoxNzIwMTEwNDIxfQ.96C3r8eYT_P7NK98s_uRZy3vJspXGlNFm8Dx6gE0-Mc','BEARER','admin'),(22,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDA1NzA1NywiZXhwIjoxNzIwMTQzNDU3fQ.XN1x5M4l8SZs7h6-9JgluHF6RfZq4XtPwx_HogS6vQQ','BEARER','admin'),(23,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDA1NzEzNCwiZXhwIjoxNzIwMTQzNTM0fQ.KxX9iUlocF0seI7zd3JoDTRCGLtxRYSXE-lbDK_-bXQ','BEARER','admin'),(24,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDA1NzY4MiwiZXhwIjoxNzIwMTQ0MDgyfQ.sFuHHB7vtlLGttIqHxL-BMb6_Yx-O7LPoVUISgrBrQI','BEARER','admin'),(25,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDA1OTUyNCwiZXhwIjoxNzIwMTQ1OTI0fQ.PQFaHhLiotFH2_C8QmvJrhFccUOP9tT3wTBk0Zdt994','BEARER','admin'),(26,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDA2MDkzMCwiZXhwIjoxNzIwMTQ3MzMwfQ.SvTl3R0U53F0ZmRKRc_LMAIheLlrPs0OOOOpBox4pwI','BEARER','admin'),(27,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDA3NTMzNCwiZXhwIjoxNzIwMTYxNzM0fQ.ERV3j67XYeRVrN41xb-HPk4CZmHlaxmK_lN9bGMdlok','BEARER','admin'),(28,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDEwMTkxMSwiZXhwIjoxNzIwMTg4MzExfQ.RJHfdKX-cOwSjDTWPIwHLEPZnb-bqmBgJd__tm_Msfo','BEARER','admin'),(29,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDEwMjE2NiwiZXhwIjoxNzIwMTg4NTY2fQ.TTByfBXL6HeH0UY2pwItzLMU5NaOIBJXCT9Z3NKA5So','BEARER','admin'),(30,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzIwMzMxMTE3LCJleHAiOjE3MjA0MTc1MTd9.pCV49j2KXfTp6CoB70QIB1Dp4-4TnnfHGuvIYGBFxAo','BEARER','HuyDien'),(31,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzIwMzMxNTQwLCJleHAiOjE3MjA0MTc5NDB9.2gS-Znm7XM-zDxO52O4tLorrRrZGZ4IYaxI38k0wqZA','BEARER','HuyDien'),(32,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDMzNzUwMSwiZXhwIjoxNzIwNDIzOTAxfQ.fZDZoZT57DqbPgXlO0RYt_Qf7Ygn3yZaEyaavG05AxQ','BEARER','admin'),(33,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTcyMDMzODM5MywiZXhwIjoxNzIwNDI0NzkzfQ.W2HR8TrNtiyYU3zhkwgxSqBvUVbCS7hQ_4llyu8ZJ_o','BEARER','user1'),(34,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMiIsImlhdCI6MTcyMDMzODQyMiwiZXhwIjoxNzIwNDI0ODIyfQ.ZZ1PgltYuFdHGWGbS7c2m4G5VpFAEcXWJ_apDcetNFM','BEARER','user2'),(35,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuZ3V5ZW52YW5hIiwiaWF0IjoxNzIwMzM5MjY1LCJleHAiOjE3MjA0MjU2NjV9.Uj6e7v20t8gmbJ66YGYgjrZA6o87QvsCL4gI3Ui-Dv8','BEARER','nguyenvana'),(36,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDMzOTI3OSwiZXhwIjoxNzIwNDI1Njc5fQ.1rUfH_jOBPaF_D5p9VX5shQx8Tg5PE3B4BdAIsfRV_c','BEARER','admin'),(37,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuZ3V5ZW52YW5hIiwiaWF0IjoxNzIwMzM5MzAyLCJleHAiOjE3MjA0MjU3MDJ9.qGXRQQlUGyrdQ1dUjOsW8QA6F1fcI3NypUAi3IlI6Lo','BEARER','nguyenvana'),(38,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuZ3V5ZW52YW5hIiwiaWF0IjoxNzIwMzM5MzQwLCJleHAiOjE3MjA0MjU3NDB9.I0271Prq0lnueQIAyo_MjjSWwvLc_OSvyW5DtSEK-Zk','BEARER','nguyenvana'),(39,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDMzOTU0NiwiZXhwIjoxNzIwNDI1OTQ2fQ.A8hIn1adX7xyQh2hYuMM2vUGl6A6ZXdANvRnEIMVQ1M','BEARER','admin'),(40,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuZ3V5ZW52YW5hIiwiaWF0IjoxNzIwMzM5NjQwLCJleHAiOjE3MjA0MjYwNDB9.Gtyash21HPup681hEE13jNdmDN5z6RPtw7IHpJIaCSk','BEARER','nguyenvana'),(41,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDMzOTg3OCwiZXhwIjoxNzIwNDI2Mjc4fQ.uNX3m61ELBfhuR9A4gvJUiyW5T2bRQFYxvV3FE8aypQ','BEARER','admin'),(42,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMiIsImlhdCI6MTcyMDM1MDQ2MiwiZXhwIjoxNzIwNDM2ODYyfQ.dDf61wQBNycZbcc0comfYFbWjZZSo0GFgXDmVlnxNac','BEARER','user2'),(43,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMiIsImlhdCI6MTcyMDM1MTEzOCwiZXhwIjoxNzIwNDM3NTM4fQ.KlO0PuQ3VYNV-xWxgokObjzijT-nLc26CsxTiMLPVKk','BEARER','user2'),(44,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMiIsImlhdCI6MTcyMDM1NzE0OCwiZXhwIjoxNzIwNDQzNTQ4fQ.10U_DKzj3OExhbI-YmW4iL6qHUNVRRETxfT_0nF7fog','BEARER','user2'),(45,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMiIsImlhdCI6MTcyMDM1NzE1MSwiZXhwIjoxNzIwNDQzNTUxfQ.Z0E0jfVgR_WS0uYl0dFxVBz-OrVg5E6ZQyvGXAPLF0E','BEARER','user2'),(46,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMiIsImlhdCI6MTcyMDM1ODM1NCwiZXhwIjoxNzIwNDQ0NzU0fQ.xL1xFDXWZlKcFGL5Q1DVpY0wmpZe0LQnSyV8rgzprHc','BEARER','user2'),(47,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTcyMDM1ODQxMywiZXhwIjoxNzIwNDQ0ODEzfQ.ukEoUQ8Bkx0MWnR12zZDJo6sykpqG19JHg3odJirDVg','BEARER','user1'),(48,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzIwMzU4NzU2LCJleHAiOjE3MjA0NDUxNTZ9.O91Hjl-zXuJw3PAGb_JkAQDNH71vTMyvDtcMongIQ9E','BEARER','HuyDien'),(49,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzIwMzU5MTE3LCJleHAiOjE3MjA0NDU1MTd9.XZuXrCbCpbRWaMqElBkfmVSmodMi5Qh2hvMk9ULc8t0','BEARER','HuyDien'),(50,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzIwMzU5MzY0LCJleHAiOjE3MjA0NDU3NjR9.sAtgtANHtXAb_njvBCun-V0xVg3GJS6mnN74l0LL4cM','BEARER','HuyDien'),(51,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMiIsImlhdCI6MTcyMDM2MTkxNCwiZXhwIjoxNzIwNDQ4MzE0fQ.bSxA1AHQzksGOgFfqn2xWMzdQ2Y5_G3dM_lrNmRiCbc','BEARER','user2'),(52,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMiIsImlhdCI6MTcyMDM2MTkxNSwiZXhwIjoxNzIwNDQ4MzE1fQ.dKZQP9LXSsi7SGP9TO9ZG2FsjA4_Lmv1d0gUV0Tl6to','BEARER','user2'),(53,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMiIsImlhdCI6MTcyMDM2MjE3MiwiZXhwIjoxNzIwNDQ4NTcyfQ.90fqGAxAClIbMYUjLVL_rF9AiqbhGPAGX2apI5OV1Aw','BEARER','user2'),(54,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMiIsImlhdCI6MTcyMDM2MjM0NywiZXhwIjoxNzIwNDQ4NzQ3fQ.PGdzXuai3aNognQYds9cAfQ8R_AXC7oW0VxV2_cEnh8','BEARER','user2'),(55,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMiIsImlhdCI6MTcyMDQ1MjY4OSwiZXhwIjoxNzIwNTM5MDg5fQ.94jRtcn3KwL4CJ_K_QFfjLNGAS69svU7feMULVylW1c','BEARER','user2'),(56,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDQ1Mjc1OSwiZXhwIjoxNzIwNTM5MTU5fQ.S9Zna7iWZIkw73im0s6hqWxTWaLec06YAVz7uk4HTos','BEARER','admin'),(57,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDQ1MzAxMCwiZXhwIjoxNzIwNTM5NDEwfQ.CqAHQ8-n7FTCEQQPcG1O7KNqaVGFUNGV1KIYegkkSXo','BEARER','admin'),(58,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDQ1MzE2OSwiZXhwIjoxNzIwNTM5NTY5fQ.UdgLJ4hbkrHjjHl18d8NA81znBm4Jv35Bmi6gxe9W_M','BEARER','admin'),(59,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDQ1MzMwNywiZXhwIjoxNzIwNTM5NzA3fQ.WsLjaUBDe3lSlXsCfEAR9Wij9pQZD8Ka-AwzzYgkcSs','BEARER','admin'),(60,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDQ1MzMzNCwiZXhwIjoxNzIwNTM5NzM0fQ.bUwbO856LpFmKF8dySeBcXOpfLudiirrToE3YLTm6nE','BEARER','admin'),(61,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDYwMjg3NiwiZXhwIjoxNzIwNjg5Mjc2fQ.vxg_kSMnr5mHGfEnJ2ixDN6g4Qf38A-awQLnLrFvdIg','BEARER','admin'),(62,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDg5MDQwMCwiZXhwIjoxNzIwOTc2ODAwfQ.seo5_d0tEk8z2gkwWhqzj7JipRVq9_DVyrvkhqrCyzE','BEARER','admin'),(63,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyNSIsImlhdCI6MTcyMDk2OTU1OCwiZXhwIjoxNzIxMDU1OTU4fQ.21tTS6LjQ4nBWzAJOuuc4Ij5zOjylr0GmLwN3QOo6xQ','BEARER','user5'),(64,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzIwOTY5ODY0LCJleHAiOjE3MjEwNTYyNjR9.RFfFja8jlnOeos7TIqFrrSnWXdwlWeQCbIhzQXtHrLA','BEARER','HuyDien'),(65,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzIwOTcwNTc1LCJleHAiOjE3MjEwNTY5NzV9.9wspKhD-84UF6lW9PSk4A6oc3AuQkRWvYjTnH8iHixE','BEARER','HuyDien'),(66,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMDk3MDU4NiwiZXhwIjoxNzIxMDU2OTg2fQ.7rDzO7iSA8mgzYtMvFKV6B48BoI3bvn-td_8xF5V4uY','BEARER','admin'),(67,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzIwOTcyMTU0LCJleHAiOjE3MjEwNTg1NTR9.nUj2xvO3_DCz8tCZoddwd5XHMHriH0swUhQ6wGxloIM','BEARER','HuyDien'),(68,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTcyMDk3MjI3MiwiZXhwIjoxNzIxMDU4NjcyfQ.BkmYvksqsVfZV-JFERb9gzZFnB5OHRSE7NnNU5II41U','BEARER','user1'),(69,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMTIyNTE0NiwiZXhwIjoxNzIxMzExNTQ2fQ.bHWbDmVo2F-twFe0yV4CJI1KKUWrZG1bOw15u7GKWN0','BEARER','admin'),(70,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMTIyNTE2OCwiZXhwIjoxNzIxMzExNTY4fQ.Pp09FOOQmXb42xxEBQQmMSe14pOmNhR2oRb0G8Mqkkc','BEARER','admin'),(71,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMTIyNTgwNiwiZXhwIjoxNzIxMzEyMjA2fQ.jF0CPec1X96dBymhwUlz5vmVqzjjA5vP-IH54b_HhQE','BEARER','admin'),(72,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMTIyNjEyMSwiZXhwIjoxNzIxMzEyNTIxfQ.ewElLA-Qk7KXaa95-tcINRhtpzoA5Ovfmpk29GdTYxw','BEARER','admin'),(73,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJqb2huZG9lIiwiaWF0IjoxNzIxMjI2Mjg5LCJleHAiOjE3MjEzMTI2ODl9.zsjdXuw2PArxsa1SIW_N4fcMw1dpF1XdBMM3Y9J8qC4','BEARER','johndoe'),(74,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMTQ4OTgzNiwiZXhwIjoxNzIxNTc2MjM2fQ.jvsmqsShzEnBLxUsHmkII7BdJ951RZ17aAbGHEIeazQ','BEARER','admin'),(75,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMTQ5MDE3MSwiZXhwIjoxNzIxNTc2NTcxfQ.h8y3OlsDF1-KXmzfyejBHFIiNvHOmM9bnFsHBGC_MTc','BEARER','admin'),(76,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMTgxNzc1MSwiZXhwIjoxNzIxOTA0MTUxfQ.hIioP7iwSwZFzjuKoe0-B4v8a55roalRcVItfweSBQo','BEARER','admin'),(77,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTcyMjA0MjM1MCwiZXhwIjoxNzIyMTI4NzUwfQ.zhj6a9BSz53HR7hv7h9Nzu7Ho2O2fALHNyu3SLBIInc','BEARER','admin'),(78,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzIyMDg4MjM1LCJleHAiOjE3MjIxNzQ2MzV9.fk69-smPvpir_fMrQTzqiGWHe2xW2ah0eQDIuop37nA','BEARER','HuyDien'),(79,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIdXlEaWVuIiwiaWF0IjoxNzIyMDg4NTUxLCJleHAiOjE3MjIxNzQ5NTF9.kBN9yZ5gZV60xVx8gVB8kvm3aIO-kdgZv8843LIqcwc','BEARER','HuyDien'),(80,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJMZUhhVGhhbmgiLCJpYXQiOjE3MjIwODg4MzAsImV4cCI6MTcyMjE3NTIzMH0.Fj6iO3fwItEzZfA4YrE8YGPEYGYZslO-NoklzVIel1o','BEARER','LeHaThanh'),(81,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJMZUhhVGhhbmgiLCJpYXQiOjE3MjIwODg4NDcsImV4cCI6MTcyMjE3NTI0N30.oQ-J56lf3dJqvj6YaZufnL8n2lIWHwGjuAeD5_TggEE','BEARER','LeHaThanh'),(82,_binary '',_binary '','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJMZUhhVGhhbmgiLCJpYXQiOjE3MjIwODkwMjQsImV4cCI6MTcyMjE3NTQyNH0.IrhQAaxkghSr9iyjQlbUieWdVJ8om-32vCuAoTjP8Fs','BEARER','LeHaThanh'),(83,_binary '\0',_binary '\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJMZUhhVGhhbmgiLCJpYXQiOjE3MjIwODkwODIsImV4cCI6MTcyMjE3NTQ4Mn0.q--w7mR1Tg2siR99eK7HDejDDVOlLU1y6OpeP1HEQb4','BEARER','LeHaThanh');
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `user_permission` WRITE;
INSERT INTO `user_permission` VALUES (2,NULL,1,'admin'),(1,NULL,3,'HuyDien'),(59,NULL,3,'johndoe'),(60,NULL,3,'LeHaThanh'),(25,NULL,2,'nguyenvana'),(34,'COACHES',4,'nguyenvana'),(50,'DASHBOARD',4,'nguyenvana'),(30,'DRIVERS',4,'nguyenvana'),(46,'REPORT',4,'nguyenvana'),(42,'TICKETS',4,'nguyenvana'),(38,'TRIPS',4,'nguyenvana'),(54,'USERS',4,'nguyenvana'),(35,'COACHES',5,'nguyenvana'),(51,'DASHBOARD',5,'nguyenvana'),(31,'DRIVERS',5,'nguyenvana'),(47,'REPORT',5,'nguyenvana'),(43,'TICKETS',5,'nguyenvana'),(39,'TRIPS',5,'nguyenvana'),(55,'USERS',5,'nguyenvana'),(36,'COACHES',6,'nguyenvana'),(52,'DASHBOARD',6,'nguyenvana'),(32,'DRIVERS',6,'nguyenvana'),(48,'REPORT',6,'nguyenvana'),(44,'TICKETS',6,'nguyenvana'),(40,'TRIPS',6,'nguyenvana'),(56,'USERS',6,'nguyenvana'),(37,'COACHES',7,'nguyenvana'),(53,'DASHBOARD',7,'nguyenvana'),(33,'DRIVERS',7,'nguyenvana'),(49,'REPORT',7,'nguyenvana'),(45,'TICKETS',7,'nguyenvana'),(41,'TRIPS',7,'nguyenvana'),(57,'USERS',7,'nguyenvana'),(58,NULL,2,'nguyenvanb'),(3,NULL,3,'user1'),(13,NULL,3,'user10'),(14,NULL,3,'user11'),(15,NULL,3,'user12'),(16,NULL,3,'user13'),(17,NULL,3,'user14'),(18,NULL,3,'user15'),(19,NULL,3,'user16'),(20,NULL,3,'user17'),(21,NULL,3,'user18'),(22,NULL,3,'user19'),(5,NULL,3,'user2'),(23,NULL,3,'user20'),(6,NULL,3,'user3'),(7,NULL,3,'user4'),(8,NULL,3,'user5'),(9,NULL,3,'user6'),(10,NULL,3,'user7'),(11,NULL,3,'user8'),(12,NULL,3,'user9');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `discount` WRITE;
INSERT INTO `discount` VALUES (1,8652.70,'DISCOUNT-CODE-1','SUMMER20','2024-07-01 20:27:08.816047','2024-06-30 20:27:08.816047'),(2,8836.50,'DISCOUNT-CODE-2','WINTER10','2024-07-02 20:27:08.816047','2024-06-30 20:27:08.816047'),(3,3216.89,'DISCOUNT-CODE-3','FALL15','2024-07-03 20:27:08.816047','2024-06-30 20:27:08.816047'),(4,4275.03,'DISCOUNT-CODE-4','SPRING25','2024-07-04 20:27:08.816047','2024-06-30 20:27:08.816047'),(5,9853.81,'DISCOUNT-CODE-5','NEWUSER50','2024-07-05 20:27:08.816047','2024-06-30 20:27:08.816047'),(6,1615.32,'DISCOUNT-CODE-6','WEEKEND20','2024-07-06 20:27:08.816047','2024-06-30 20:27:08.816047'),(7,4764.90,'DISCOUNT-CODE-7','HOLIDAY30','2024-07-07 20:27:08.817047','2024-06-30 20:27:08.817047'),(8,1185.44,'DISCOUNT-CODE-8','STUDENT15','2024-07-08 20:27:08.817047','2024-06-30 20:27:08.817047'),(9,8973.08,'DISCOUNT-CODE-9','SENIOR20','2024-07-09 20:27:08.817047','2024-06-30 20:27:08.817047'),(10,5584.05,'DISCOUNT-CODE-10','FAMILY25','2024-07-10 20:27:08.818051','2024-06-30 20:27:08.818051'),(11,8168.04,'DISCOUNT-CODE-11','GROUP10','2024-07-11 20:27:08.818051','2024-06-30 20:27:08.818051'),(12,9250.42,'DISCOUNT-CODE-12','LOYALTY20','2024-07-12 20:27:08.818051','2024-06-30 20:27:08.818051'),(13,9807.27,'DISCOUNT-CODE-13','REFERRAL30','2024-07-13 20:27:08.818051','2024-06-30 20:27:08.818051'),(14,653.27,'DISCOUNT-CODE-14','BIRTHDAY50','2024-07-14 20:27:08.819047','2024-06-30 20:27:08.819047'),(15,2942.39,'DISCOUNT-CODE-15','ANNIVERSARY40','2024-07-15 20:27:08.819047','2024-06-30 20:27:08.819047'),(16,8153.62,'DISCOUNT-CODE-16','FLASHSALE50','2024-07-16 20:27:08.819047','2024-06-30 20:27:08.819047'),(17,7383.28,'DISCOUNT-CODE-17','EARLYBIRD20','2024-07-17 20:27:08.819047','2024-06-30 20:27:08.819047'),(18,7295.30,'DISCOUNT-CODE-18','LASTMINUTE25','2024-07-18 20:27:08.819047','2024-06-30 20:27:08.819047'),(19,1519.21,'DISCOUNT-CODE-19','NEWYEAR30','2024-07-19 20:27:08.819047','2024-06-30 20:27:08.819047'),(20,9665.49,'DISCOUNT-CODE-20','BLACKFRIDAY50','2024-07-20 20:27:08.819047','2024-06-30 20:27:08.819047'),(24,10.00,'DISCOUNT2024','Year-end discount','2024-12-31 23:59:59.000000','2024-12-01 00:00:00.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `province` WRITE;
INSERT INTO `province` VALUES (1,'an_giang','An Giang'),(2,'ba_ria_vung_tau','Bà Rịa - Vũng Tàu'),(3,'bac_giang','Bắc Giang'),(4,'bac_kan','Bắc Kạn'),(5,'bac_lieu','Bạc Liêu'),(6,'bac_ninh','Bắc Ninh'),(7,'ben_tre','Bến Tre'),(8,'binh_dinh','Bình Định'),(9,'binh_duong','Bình Dương'),(10,'binh_phuoc','Bình Phước'),(11,'binh_thuan','Bình Thuận'),(12,'ca_mau','Cà Mau'),(13,'can_tho','Cần Thơ'),(14,'cao_bang','Cao Bằng'),(15,'da_nang','Đà Nẵng'),(16,'dak_lak','Đắk Lắk'),(17,'dak_nong','Đắk Nông'),(18,'dien_bien','Điện Biên'),(19,'dong_nai','Đồng Nai'),(20,'dong_thap','Đồng Tháp'),(21,'gia_lai','Gia Lai'),(22,'ha_giang','Hà Giang'),(23,'ha_nam','Hà Nam'),(24,'ha_noi','Hà Nội'),(25,'ha_tinh','Hà Tĩnh'),(26,'hai_duong','Hải Dương'),(27,'hai_phong','Hải Phòng'),(28,'hau_giang','Hậu Giang'),(29,'hoa_binh','Hòa Bình'),(30,'hung_yen','Hưng Yên'),(31,'khanh_hoa','Khánh Hòa'),(32,'kien_giang','Kiên Giang'),(33,'kon_tum','Kon Tum'),(34,'lai_chau','Lai Châu'),(35,'lam_dong','Lâm Đồng'),(36,'lang_son','Lạng Sơn'),(37,'lao_cai','Lào Cai'),(38,'long_an','Long An'),(39,'nam_dinh','Nam Định'),(40,'nghe_an','Nghệ An'),(41,'ninh_binh','Ninh Bình'),(42,'ninh_thuan','Ninh Thuận'),(43,'phu_tho','Phú Thọ'),(44,'phu_yen','Phú Yên'),(45,'quang_binh','Quảng Bình'),(46,'quang_nam','Quảng Nam'),(47,'quang_ngai','Quảng Ngãi'),(48,'quang_ninh','Quảng Ninh'),(49,'quang_tri','Quảng Trị'),(50,'soc_trang','Sóc Trăng'),(51,'son_la','Sơn La'),(52,'tay_ninh','Tây Ninh'),(53,'thai_binh','Thái Bình'),(54,'thai_nguyen','Thái Nguyên'),(55,'thanh_hoa','Thanh Hóa'),(56,'thua_thien_hue','Thừa Thiên Huế'),(57,'tien_giang','Tiền Giang'),(58,'tra_vinh','Trà Vinh'),(59,'tuyen_quang','Tuyên Quang'),(60,'vinh_long','Vĩnh Long'),(61,'vinh_phuc','Vĩnh Phúc'),(62,'yen_bai','Yên Bái'),(63,'thanh_pho_ho_chi_minh','Thành Phố Hồ Chí Minh');
UNLOCK TABLES;




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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `trip` WRITE;
INSERT INTO `trip` VALUES (1,'2024-07-10 09:00:00.000000',10,550000.00,2,63,8,1,8),(2,'2024-07-02 09:00:00.000000',3,400000.00,2,3,1,2,2),(3,'2024-07-03 10:00:00.000000',5,600000.00,3,4,NULL,3,3),(4,'2024-07-04 07:30:00.000000',3.5,450000.00,4,5,2,4,4),(5,'2024-07-05 06:45:00.000000',4,550000.00,5,6,NULL,5,5),(6,'2024-07-05 16:30:00.000000',10,250000.00,6,63,NULL,6,8),(12,'2024-07-01 09:00:00.000000',4.5,500000.00,1,2,NULL,1,1),(13,'2024-10-02 09:00:00.000000',3,400000.00,2,3,1,2,2),(14,'2024-09-03 10:00:00.000000',5,600000.00,3,4,NULL,3,3),(15,'2024-10-10 07:30:00.000000',3.5,450000.00,4,5,2,4,4),(16,'2024-11-05 06:45:00.000000',4,550000.00,5,6,NULL,5,5),(22,'2024-09-01 09:00:00.000000',4.5,500000.00,1,2,NULL,1,1),(23,'2024-07-01 08:00:00.000000',6.5,500000.00,1,49,1,1,8),(24,'2024-09-02 09:30:00.000000',4,450000.00,2,3,2,2,8),(25,'2024-10-03 11:15:00.000000',5,600000.00,3,7,3,3,8),(26,'2024-11-04 13:45:00.000000',7,550000.00,4,12,4,4,8),(27,'2024-09-05 15:00:00.000000',6,700000.00,5,17,5,5,8),(28,'2024-08-31 16:20:00.000000',5.5,800000.00,6,22,6,6,8),(29,'2024-09-20 18:10:00.000000',4.5,650000.00,7,27,7,7,8),(30,'2024-10-15 20:00:00.000000',6,720000.00,8,32,8,8,8),(31,'2024-10-20 22:30:00.000000',7.5,580000.00,9,37,9,9,8),(32,'2024-09-26 23:45:00.000000',4,670000.00,10,42,10,10,8),(33,'2024-06-29 11:00:00.000000',4.5,500000.00,1,2,NULL,1,1),(35,'2024-07-11 08:00:00.000000',11,600000.00,13,63,NULL,2,8),(37,'2024-07-10 14:55:00.000000',5.1,550000.00,20,35,24,5,8),(43,'2024-07-01 08:00:00.000000',4.5,550000.00,1,35,1,1,8),(44,'2024-07-08 08:00:00.000000',5,450000.00,2,35,NULL,2,8),(45,'2024-07-15 08:00:00.000000',5,500000.00,3,35,17,3,8),(46,'2024-07-22 08:00:00.000000',6,650000.00,4,35,24,4,8),(47,'2024-07-29 08:00:00.000000',4.5,500000.00,5,35,NULL,5,8),(48,'2024-08-01 08:00:00.000000',4.5,450000.00,6,35,10,6,8),(49,'2024-08-08 08:00:00.000000',4.5,900000.00,3,35,NULL,7,8),(50,'2024-08-15 08:00:00.000000',5.5,500000.00,4,35,NULL,8,8),(51,'2024-08-22 08:00:00.000000',5,500000.00,5,35,15,9,8),(52,'2024-08-29 08:00:00.000000',6.5,500000.00,2,35,NULL,10,8),(53,'2024-09-01 08:00:00.000000',4.5,500000.00,11,35,9,11,8),(54,'2024-09-08 08:00:00.000000',4.5,500000.00,13,35,NULL,12,8),(55,'2024-09-15 08:00:00.000000',4.4,1000000.00,18,35,5,13,8),(56,'2024-09-22 08:00:00.000000',5,750000.00,14,35,NULL,14,8),(57,'2024-09-29 08:00:00.000000',5.1,500000.00,5,35,2,15,8),(58,'2024-07-01 08:00:00.000000',6.5,600000.00,1,63,24,5,8),(59,'2024-07-08 08:00:00.000000',6.7,550000.00,2,63,NULL,2,8),(60,'2024-07-15 08:00:00.000000',6.5,650000.00,3,63,17,3,8),(61,'2024-07-22 08:00:00.000000',6.8,700000.00,4,63,24,4,8),(62,'2024-07-29 08:00:00.000000',6.6,600000.00,5,63,NULL,5,8),(63,'2024-08-01 08:00:00.000000',6.5,650000.00,6,63,10,6,8),(64,'2024-08-08 08:00:00.000000',6.5,900000.00,3,63,NULL,7,8),(65,'2024-08-15 08:00:00.000000',6.8,700000.00,4,63,NULL,8,8),(66,'2024-08-22 08:00:00.000000',6.7,600000.00,5,63,15,9,8),(67,'2024-08-29 08:00:00.000000',6.5,750000.00,2,63,NULL,10,8),(68,'2024-09-01 08:00:00.000000',6.5,600000.00,11,63,9,11,8),(69,'2024-09-08 08:00:00.000000',6.7,550000.00,13,63,NULL,12,8),(70,'2024-09-15 08:00:00.000000',6.8,700000.00,18,63,5,13,8),(71,'2024-09-22 08:00:00.000000',6.5,800000.00,14,63,NULL,14,8),(72,'2024-09-29 08:00:00.000000',6.6,650000.00,5,63,2,15,8),(73,'2024-10-01 08:00:00.000000',6.5,600000.00,1,63,1,1,8),(74,'2024-10-08 08:00:00.000000',6.7,550000.00,2,63,NULL,2,8),(75,'2024-10-15 08:00:00.000000',6.5,650000.00,3,63,17,3,8),(76,'2024-10-22 08:00:00.000000',6.8,700000.00,4,63,24,4,8),(77,'2024-10-29 08:00:00.000000',6.6,600000.00,5,63,NULL,5,8),(78,'2024-07-01 08:00:00.000000',5.5,550000.00,1,9,1,1,8),(79,'2024-07-08 08:00:00.000000',5.7,500000.00,2,9,NULL,2,8),(80,'2024-07-15 08:00:00.000000',5.5,600000.00,3,9,17,3,8),(81,'2024-07-22 08:00:00.000000',5.8,650000.00,4,9,24,4,8),(82,'2024-07-29 08:00:00.000000',5.6,550000.00,5,9,NULL,5,8),(83,'2024-08-01 08:00:00.000000',5.5,600000.00,6,9,10,6,8),(84,'2024-08-08 08:00:00.000000',5.5,850000.00,3,9,NULL,7,8),(85,'2024-08-15 08:00:00.000000',5.8,650000.00,4,9,NULL,8,8),(86,'2024-08-22 08:00:00.000000',5.7,600000.00,5,9,15,9,8),(87,'2024-08-29 08:00:00.000000',5.5,700000.00,2,9,NULL,10,8),(88,'2024-09-01 08:00:00.000000',5.5,550000.00,11,9,9,11,8),(89,'2024-09-08 08:00:00.000000',5.7,500000.00,13,9,NULL,12,8),(90,'2024-09-15 08:00:00.000000',5.8,650000.00,18,9,5,13,8),(91,'2024-09-22 08:00:00.000000',5.5,750000.00,14,9,NULL,14,8),(92,'2024-09-29 08:00:00.000000',5.6,600000.00,5,9,2,15,8),(93,'2024-10-01 08:00:00.000000',5.5,550000.00,1,9,1,1,8),(94,'2024-10-08 08:00:00.000000',5.7,500000.00,2,9,NULL,2,8),(95,'2024-10-15 08:00:00.000000',5.5,600000.00,3,9,17,3,8),(96,'2024-10-22 08:00:00.000000',5.8,650000.00,4,9,24,4,8),(97,'2024-10-29 08:00:00.000000',5.6,550000.00,5,9,NULL,5,8),(99,'2024-07-15 22:22:00.000000',12,25000.00,5,8,24,1,63);
UNLOCK TABLES;



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
  PRIMARY KEY (`id`),
  KEY `FKkp5ujmgvd2pmsehwpu2vyjkwb` (`trip_id`),
  KEY `FKrjob56yal18kk1mvwj2d2elki` (`username`),
  CONSTRAINT `FKkp5ujmgvd2pmsehwpu2vyjkwb` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`id`),
  CONSTRAINT `FKrjob56yal18kk1mvwj2d2elki` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `booking` WRITE;
INSERT INTO `booking` VALUES (1,'2024-06-30 22:32:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-06-30 22:33:20.674914','CASH','UNPAID','0987654321','97 Man Thiện','A1',500000.00,1,'HuyDien'),(2,'2024-06-30 22:53:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-06-30 22:57:29.577407','CARD','PAID','0987654321','Gò Bồi','A7',250000.00,6,'HuyDien'),(3,'2024-07-01 12:33:00.000000','ONEWAY','Diễn','Châu','chauhuydien43@gmail.com','2024-07-01 12:39:47.590579','CASH','PAID','0875120502','Trụ sở thôn Lương Bình','A6',250000.00,6,'user1'),(4,'2024-07-01 12:33:00.000000','ONEWAY','Nguyễn ','Hải','chauhuydien43@gmail.com','2024-07-04 08:59:26.550840','CASH','CANCEL','0875120502','Trụ sở thôn Lương Bình','A1',125000.00,6,'user1'),(5,'2024-07-01 12:33:00.000000','ONEWAY','Nguyễn','Hải','chauhuydien43@gmail.com','2024-07-04 08:59:26.550840','CASH','PAID','0875120502','Trụ sở thôn Lương Bình','A2',125000.00,6,'user1'),(6,'2024-07-07 14:23:00.000000','ONEWAY','Nguyễn','Anh','user2@gmail.com','2024-07-07 14:48:27.000000','CASH','PAID','0923344556','Số 20 Trần Phú, TP Quy Nhơn, Bình Định','A3',549990.00,37,'user2'),(7,'2024-07-07 14:23:00.000000','ONEWAY','Nguyễn','Anh','user2@gmail.com','2024-07-07 14:48:27.000000','CASH','PAID','0923344556','Số 20 Trần Phú, TP Quy Nhơn, Bình Định','A4',549990.00,37,'user2'),(8,'2024-07-07 21:28:00.000000','ONEWAY','Nguyễn','Anh','user2@gmail.com','2024-07-07 21:31:46.047677','CASH','UNPAID','0923344556','Số 20 Trần Phú, TP Quy Nhơn, Bình Định','A6',600000.00,35,'user2'),(9,'2024-07-14 22:49:00.000000','ONEWAY','Châu ','Diễn','abclsdjf23@gmail.com','2024-07-14 22:50:56.968812','CASH','UNPAID','0987654321','23 Lý Thường Kiệt, Quy Nhơn, Bình Định','A8',642616.00,60,'HuyDien'),(10,'2024-07-14 23:07:00.000000','ONEWAY','Nguyễn','Hải','user1@gmail.com','2024-07-14 23:07:58.452876','CARD','PAID','0901234567','Số 10 Lê Duẩn, TP Quy Nhơn, Bình Định','B6',642616.00,60,'user1'),(11,'2024-07-27 07:07:00.000000','ONEWAY','Việt ','Anh','user1@gmail.com','2024-07-27 07:07:58.452876','CASH','CANCEL','0901234567','Số 10 Lê Duẩn, TP Quy Nhơn, Bình Định','B7',642616.00,60,'user1');
UNLOCK TABLES;


DROP TABLE IF EXISTS `payment_history`;
CREATE TABLE `payment_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `new_status` enum('CANCEL','PAID','UNPAID') DEFAULT NULL,
  `old_status` enum('CANCEL','PAID','UNPAID') DEFAULT NULL,
  `status_change_date_time` datetime(6) DEFAULT NULL,
  `booking_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK78c8n1i1pc83oleh4xdbm46d5` (`booking_id`),
  CONSTRAINT `FK78c8n1i1pc83oleh4xdbm46d5` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `payment_history` WRITE;
INSERT INTO `payment_history` VALUES (1,'UNPAID',NULL,'2024-06-30 22:33:20.674914',1),(2,'PAID',NULL,'2024-06-30 22:57:29.577407',2),(3,'UNPAID',NULL,'2024-07-01 12:39:47.590579',3),(4,'PAID',NULL,'2024-07-04 08:59:26.550840',4),(5,'PAID',NULL,'2024-07-04 08:59:26.550840',5),(6,'CANCEL','PAID','2024-07-04 09:18:03.267878',4),(7,'UNPAID',NULL,'2024-07-07 14:48:27.114880',6),(8,'UNPAID',NULL,'2024-07-07 14:48:27.114880',7),(9,'PAID','UNPAID','2024-07-07 14:48:44.423394',6),(10,'PAID','UNPAID','2024-07-07 14:48:50.213639',7),(11,'UNPAID',NULL,'2024-07-07 21:31:46.047677',8),(12,'UNPAID',NULL,'2024-07-14 22:50:56.968812',9),(13,'PAID',NULL,'2024-07-14 23:07:58.452876',10);
UNLOCK TABLES;

SELECT * FROM province p ;


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





