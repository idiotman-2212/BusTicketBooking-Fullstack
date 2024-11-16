package com.ticketbooking.dto;

import com.ticketbooking.model.enumType.CoachType;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@Data
@NoArgsConstructor
@AllArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE,makeFinal = false)
public class CoachUsageDto {

    CoachType coachType;
    Long usage;
}
