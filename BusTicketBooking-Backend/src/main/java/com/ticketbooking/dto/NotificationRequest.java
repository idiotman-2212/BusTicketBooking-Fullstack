package com.ticketbooking.dto;

import com.ticketbooking.model.enumType.RecipientType;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class NotificationRequest {
      String title;
      String message;
      RecipientType recipientType;
      String senderUsername;
      List<String> recipientIdentifiers;
}
