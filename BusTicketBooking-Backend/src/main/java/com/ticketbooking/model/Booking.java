package com.ticketbooking.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.ticketbooking.model.enumType.BookingType;
import com.ticketbooking.model.enumType.PaymentMethod;
import com.ticketbooking.model.enumType.PaymentStatus;
import com.ticketbooking.utils.AppConstants;
import jakarta.persistence.*;
import jakarta.validation.constraints.Pattern;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class Booking implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "username")
    User user;

    @ManyToOne
    @JoinColumn(name = "trip_id")
    Trip trip;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    LocalDateTime bookingDateTime;

    String seatNumber;

    @Enumerated(EnumType.STRING)
    BookingType bookingType;

    String custFirstName;

    String custLastName;

    @Pattern(regexp = AppConstants.PHONE_REGEX_PATTERN, message = "Invalid phone")
    String phone;

    @Pattern(regexp = AppConstants.EMAIL_REGEX_PATTERN, message = "Invalid email")
    String email;

    BigDecimal totalPayment;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime paymentDateTime;

    @Enumerated(EnumType.STRING)
    PaymentMethod paymentMethod;

    @Enumerated(EnumType.STRING)
    PaymentStatus paymentStatus;

    @OneToMany(mappedBy = "booking")
    List<PaymentHistory> paymentHistories;


    @Column(name = "points_earned", columnDefinition = "decimal(38,2) default 0")
    BigDecimal pointsEarned = BigDecimal.ZERO;

    @Column(name = "points_used", columnDefinition = "decimal(38,2) default 0")
    BigDecimal pointsUsed;

    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL)
    List<LoyaltyTransaction> loyaltyTransactions;

    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonManagedReference
    List<BookingCargo> bookingCargos;

}