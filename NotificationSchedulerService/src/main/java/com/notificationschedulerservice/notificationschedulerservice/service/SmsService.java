//package com.notificationschedulerservice.notificationschedulerservice.service;
//
//import com.twilio.Twilio;
//import com.twilio.rest.api.v2010.account.Message;
//import com.twilio.type.PhoneNumber;
//import jakarta.annotation.PostConstruct;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.stereotype.Service;
//
//
//@Service
//public class SmsService {
//
//    @Value("${twilio.account_sid}")
//    private String accountSid;
//
//    @Value("${twilio.auth_token}")
//    private String authToken;
//
//    @Value("${twilio.phone_number}")
//    private String fromPhoneNumber;
//
//    // Phương thức này sẽ được gọi sau khi bean đã được khởi tạo và các giá trị @Value đã được nạp
//    @PostConstruct
//    public void init() {
//        // Khởi tạo Twilio với các thông tin tài khoản
//        Twilio.init(accountSid, authToken);
//    }
//
//    // Hàm gửi SMS với thông tin người nhận và nội dung tin nhắn
//    public void sendSms(String toPhoneNumber, String message) {
//        Message.creator(
//                new PhoneNumber(toPhoneNumber),
//                new PhoneNumber(fromPhoneNumber),
//                message
//        ).create();
//    }
//}
