package com.ticketbooking.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MonthlyPointsReportDto {
     private Integer year;
     private Integer month;
     private BigDecimal pointsEarned;
     private BigDecimal pointsUsed;
}
