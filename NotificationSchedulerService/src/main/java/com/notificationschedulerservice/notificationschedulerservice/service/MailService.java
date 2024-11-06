package com.notificationschedulerservice.notificationschedulerservice.service;

import com.notificationschedulerservice.notificationschedulerservice.model.EmailMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
@RequiredArgsConstructor
public class MailService {

    private final JavaMailSender mailSender;

    public void send(EmailMessage email) {

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(email.getFrom());
        message.setTo(email.getTo());
        message.setSubject(email.getSubject());
        message.setText(email.getText());
        message.setSentDate(new Date(System.currentTimeMillis()));

        mailSender.send(message);
    }
}
