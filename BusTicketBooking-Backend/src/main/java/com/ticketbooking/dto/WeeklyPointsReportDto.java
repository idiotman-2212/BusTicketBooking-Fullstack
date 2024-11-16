package com.ticketbooking.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WeeklyPointsReportDto {
    private Integer year;
    private Integer week;
    private BigDecimal pointsEarned;
    private BigDecimal pointsUsed;
}