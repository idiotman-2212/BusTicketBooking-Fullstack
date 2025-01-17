# 🚌 Bus Ticket Booking System

Hệ thống quản lý đặt vé xe khách online - Bus Ticket Booking System được xây dựng bằng công nghệ Fullstack (SpringBoot và ReactJs).

## 📋 Mục lục | Table of Contents
- [Yêu cầu hệ thống | System Requirements](#yêu-cầu-hệ-thống--system-requirements)
- [Cài đặt | Installation](#cài-đặt--installation)
- [Cấu hình | Configuration](#cấu-hình--configuration)
- [Chạy ứng dụng | Running the Application](#chạy-ứng-dụng--running-the-application)
- [Tính năng | Features](#tính-năng--features)

## 🔧 Yêu cầu hệ thống | System Requirements

- Node.js (version 14.x hoặc cao hơn | or higher)
- Java JDK (version 11 hoặc cao hơn | or higher)
- MySQL (version 8.x hoặc cao hơn | or higher)
- Maven (latest version)
- Git

## 💻 Cài đặt | Installation

1. Clone repository:
```bash
git clone https://github.com/idiotman-2212/BusTicketBooking-Fullstack.git
cd BusTicketBooking-Fullstack
```

2. Cài đặt Backend dependencies cho BusTicketBooking-Backend:
```bash
cd BusTicketBooking-Backend
mvn clean install
```

3. Cài đặt Frontend Admin dependencies:
```bash
cd ../BusTicketBooking-Frontend-Admin
npm install
```

4. Cài đặt Frontend Customer dependencies:
```bash
cd ../BusTicketBooking-Frontend-Customer
npm install
```

5. Cài đặt Backend dependencies cho NotificationSchedulerService:
```bash
cd NotificationSchedulerService
mvn clean install
```

## ⚙️ Cấu hình | Configuration

### 1. Database Configuration

1. Tạo database MySQL | Create MySQL database:
```sql
CREATE DATABASE BusTicketBooking;
```

2. Import database schema:
- Mở MySQL Workbench | Open MySQL Workbench
- Vào menu File > Open SQL Script
- Chọn file `/Database/BusTicketBooking.sql`
- Thực thi script | Execute the script

### 2. Backend Configuration

Cập nhật file `application.properties` trong thư mục `Backend/src/main/resources`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/BusTicketBooking
spring.datasource.username=your_username
spring.datasource.password=your_password
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=update
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
```

### 3. Frontend Configuration

Cập nhật file `http.js` trong cả hai thư mục `utlis` ở mỗi phần Frontend:
```env
baseURL=http://localhost:8080/api/v1/
```

## 🚀 Chạy ứng dụng | Running the Application

1. Khởi động Backend | Start Backend:
```bash
cd BusTicketBooking-Backend
mvn spring-boot:run
```

2. Khởi động Frontend Admin | Start Frontend Admin:
```bash
cd BusTicketBooking-Frontend-Admin
npm start
```

3. Khởi động Frontend Customer | Start Frontend Customer:
```bash
cd BusTicketBooking-Frontend-Customer
npm start
```

4. Khởi động NotificationSchedulerService | Start NotificationSchedulerService:
```bash
cd NotificationSchedulerService
mvn spring-boot:run
```

Truy cập ứng dụng | Access the application:
- Frontend Customer: http://localhost:3000
- Frontend Admin: http://localhost:3001
- Backend API: http://localhost:8080
- Swagger: http://localhost:8080/swagger-ui/index.html#

## ✨ Tính năng | Features

### 👤 Người dùng | Customer
- Tìm kiếm tuyến xe | Search coach routes
- Đặt vé xe | Book tickets
- Quản lý thông tin cá nhân | Manage personal information
- Xem lịch sử đặt vé | View booking history
- Xem lịch sử giao dịch điểm thưởng | View reward point transaction history
- Xem thông báo | View notifications
- Đánh giá chuyến đi | Trip review

### 👨‍💼 Admin
- Quản lý tuyến xe | Manage bus routes
- Quản lý lịch trình | Manage schedules
- Quản lý đặt vé | Manage bookings
- Quản lý người dùng | Manage users
- Quản lý mã giảm giá | Manage discounts
- Quản lý tài xế | Manage drivers
- Quản lý thông báo | Manage notification
- Báo cáo thống kê | Generate reports
...

## 📝 Lưu ý | Notes

- Đảm bảo các ports 8080, 3000, và 3001 không bị sử dụng bởi ứng dụng khác
- Kiểm tra kết nối database trước khi chạy ứng dụng
- Cập nhật các thông số bảo mật trong môi trường production

## 🚀 Triển khai hệ thống | Deploy

- https://bus-ticket-booking-customer-six.vercel.app/
- https://bus-ticket-booking-admin-zx3p.vercel.app/dashboard
---
© 2024 Bus Ticket Booking System
