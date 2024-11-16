package com.notificationschedulerservice.notificationschedulerservice.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class Province {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    String name; // eg: 'Ninh Thuận'

    String codeName; // eg: 'ninh_thuan'
}