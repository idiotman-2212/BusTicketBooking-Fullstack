package com.notificationschedulerservice.notificationschedulerservice.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.notificationschedulerservice.notificationschedulerservice.model.enumType.PaymentStatus;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class PaymentHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

    @ManyToOne
    @JoinColumn(name = "booking_id")
    @JsonIgnore
     Booking booking;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
     LocalDateTime statusChangeDateTime;

    @Enumerated(EnumType.STRING)
    PaymentStatus oldStatus;

    @Enumerated(EnumType.STRING)
     PaymentStatus newStatus;
}
