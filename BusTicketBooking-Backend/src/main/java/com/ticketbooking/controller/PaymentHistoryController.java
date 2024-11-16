package com.ticketbooking.controller;

import com.ticketbooking.model.PaymentHistory;
import com.ticketbooking.service.PaymentHistoryService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/paymentHistories")
@Tag(name = "PaymentHistory Controller")
public class PaymentHistoryController {

    private final PaymentHistoryService paymentHistoryService;

    @GetMapping("/all/{id}")
    public List<PaymentHistory>  getHistoriesPaymentOfBooking(@PathVariable Long id) {
        return paymentHistoryService.findHistoriesByBookingId(id);
    }
}
