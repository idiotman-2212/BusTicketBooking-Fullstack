package com.ticketbooking.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ticketbooking.model.enumType.PaymentStatus;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class PaymentHistory implements Serializable {
    private static final long serialVersionUID = 1L;

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
