package com.ticketbooking.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ticketbooking.model.Cargo;
import com.ticketbooking.model.Trip;
import com.ticketbooking.model.User;
import com.ticketbooking.model.enumType.BookingType;
import com.ticketbooking.model.enumType.PaymentMethod;
import com.ticketbooking.model.enumType.PaymentStatus;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class BookingRequest {

    Long id;

    User user;

    Trip trip;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    LocalDateTime bookingDateTime;

    String[] seatNumber;

    BookingType bookingType;

    String firstName;

    String lastName;

    String phone;

    String email;

    BigDecimal totalPayment;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime paymentDateTime;

    PaymentMethod paymentMethod;

    PaymentStatus paymentStatus;

    BigDecimal pointsUsed;

    List<CargoRequest> cargoRequests = new ArrayList<>();

    @Override
    public String toString() {
        return "BookingRequest{" +
                "id=" + id +
                ", user=" + user +
                ", trip=" + trip +
                ", bookingDateTime=" + bookingDateTime +
                ", seatNumber=" + Arrays.toString(seatNumber) +
                ", bookingType=" + bookingType +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", totalPayment=" + totalPayment +
                ", paymentDateTime=" + paymentDateTime +
                ", paymentMethod=" + paymentMethod +
                ", paymentStatus=" + paymentStatus +
                ", pointsUsed=" + pointsUsed +
                ", cargoRequests=" + cargoRequests +
                '}';
    }
}