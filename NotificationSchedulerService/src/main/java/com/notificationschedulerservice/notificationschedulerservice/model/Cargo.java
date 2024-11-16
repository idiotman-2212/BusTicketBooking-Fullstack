package com.notificationschedulerservice.notificationschedulerservice.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "cargo")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class Cargo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

    @Column(nullable = false)
     String name;

     String description;

    @Column(nullable = false)
     BigDecimal basePrice;

    @OneToMany(mappedBy = "cargo")
    @JsonIgnore
    List<BookingCargo> bookingCargos;
}