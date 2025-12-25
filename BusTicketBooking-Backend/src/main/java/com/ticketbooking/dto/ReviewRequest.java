package com.ticketbooking.dto;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
@Builder
public class ReviewRequest {
     Long tripId;
     String username;
     Integer driverRating;
     Integer coachRating;
     Integer tripRating;
     String comment;
}