package com.notificationschedulerservice.notificationschedulerservice.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;

@Entity
@Table(name = "booking_cargo")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class BookingCargo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

    @ManyToOne
    @JoinColumn(name = "booking_id", nullable = false)
    @JsonBackReference
    Booking booking;

    @ManyToOne
    @JoinColumn(name = "cargo_id", nullable = false)
    @JsonIgnoreProperties("bookingCargos")
    Cargo cargo;

    @Column(nullable = false)
     int quantity;

    @Column(nullable = false)
    BigDecimal price;

}
