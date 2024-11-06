package com.notificationschedulerservice.notificationschedulerservice.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EmailMessage {

    private String from;
    private String to;
    private String subject;
    private String text;
}
