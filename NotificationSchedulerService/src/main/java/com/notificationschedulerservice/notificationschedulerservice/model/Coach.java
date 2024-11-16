package com.notificationschedulerservice.notificationschedulerservice.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.notificationschedulerservice.notificationschedulerservice.model.enumType.CoachType;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class Coach {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

    @Column(unique = true)
     String name; // Số hiệu xe, eg: 'Tài 1', 'Tài 2'

     Integer capacity;

    @Column(unique = true)
     String licensePlate;

    @Enumerated(EnumType.STRING)
    CoachType coachType;

    @OneToMany(mappedBy = "coach")
    @JsonIgnore
     List<Trip> trips;
}
