package com.notificationschedulerservice.notificationschedulerservice.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.notificationschedulerservice.notificationschedulerservice.model.enumType.TransactionType;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class LoyaltyTransaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

    @JsonManagedReference
    @ManyToOne
    @JoinColumn(name = "username")
    @JsonIgnore
     User user;

    @ManyToOne
    @JoinColumn(name = "booking_id")
    @JsonIgnore
     Booking booking;

     BigDecimal amount;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
     LocalDateTime transactionDate;

    @Enumerated(EnumType.STRING)
    TransactionType transactionType;

}