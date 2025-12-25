package com.ticketbooking.controller;

import com.ticketbooking.dto.LoyaltyTransactionDTO;
import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.service.LoyaltyPointsService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/loyalty")
@RequiredArgsConstructor
@Tag(name = "Loyalty Points Controller")
public class LoyaltyPointsController {

    private final LoyaltyPointsService loyaltyPointsService;

    @GetMapping("/points")
    public ResponseEntity<?> getLoyaltyPoints(Authentication authentication) {
        String username = authentication.getName();
        BigDecimal points = loyaltyPointsService.getLoyaltyPoints(username);
        return ResponseEntity.ok(Map.of("username", username, "loyaltyPoints", points));
    }

    @GetMapping("/transactions")
    public ResponseEntity<PageResponse<LoyaltyTransactionDTO>> getLoyaltyTransactions(
            Authentication authentication,
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "5") Integer limit) {

        String username = authentication.getName();
        PageResponse<LoyaltyTransactionDTO> transactions = loyaltyPointsService.getLoyaltyTransactions(username, page, limit);
        return ResponseEntity.ok(transactions);
    }

    @PostMapping("/use")
    public ResponseEntity<?> usePoints(@RequestParam Long bookingId, @RequestParam BigDecimal points) {
        loyaltyPointsService.usePoints(bookingId, points);
        return ResponseEntity.ok("Use " + points + " points for booking " + bookingId);
    }

    @PostMapping("/earn")
    public ResponseEntity<?> earnPoints(@RequestParam Long bookingId) {
        loyaltyPointsService.earnPoints(bookingId);
        return ResponseEntity.ok("Earn points from booking " + bookingId);
    }
}
