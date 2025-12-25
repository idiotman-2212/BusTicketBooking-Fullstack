package com.ticketbooking.dto;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;
import java.time.LocalDateTime;


@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class TripRecommendationDTO {
     private Long tripId;
     private String sourceProvince;
     private String destProvince;
     private LocalDateTime departureDateTime;
     private BigDecimal price;
     private String coachType;
     private String pickUpLocation;
     private String dropOffLocation;
}
