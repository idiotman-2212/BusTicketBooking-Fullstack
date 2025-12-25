package com.ticketbooking.dto;

import com.ticketbooking.model.Booking;
import com.ticketbooking.model.User;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class LoyaltyTransactionDTO {
     Long transactionId;             // ID của giao dịch
     BigDecimal amount;              // Số tiền giao dịch
     LocalDateTime transactionDate;  // Ngày giao dịch
     String transactionType;         // Loại giao dịch (EARN, USE, etc.)

     // Thông tin người dùng
     String username;
     String firstName;
     String lastName;
     String email;

     // Thông tin đặt chỗ (booking)
     Long bookingId;
     String seatNumber;
     BigDecimal totalPayment;
     LocalDateTime bookingDateTime;

     // Thông tin chuyến đi (trip)
     Long tripId;
     String source;
     String destination;
     LocalDateTime departureDateTime;
     BigDecimal price;
}
