package com.ticketbooking.controller;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Discount;
import com.ticketbooking.model.Discount;
import com.ticketbooking.service.DiscountService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/discounts")
@Tag(name = "Discount Controller")
public class DiscountController {

    private final DiscountService discountService;

    @GetMapping("/all")
    public List<Discount> getAllDiscounts() {
        return discountService.findAll();
    }

    @GetMapping("/all/available")
    public List<Discount> getAllAvailableDiscounts() {
        return discountService.findAllAvailable();
    }

    @GetMapping("/paging")
    public PageResponse<Discount> getPageOfDiscounts(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "5") Integer limit) {
        return discountService.findAll(page, limit);
    }

    @GetMapping("/{discountId}")
    public ResponseEntity<Discount> getDiscount(@PathVariable Long discountId) {
        return ResponseEntity
                .status(200)
                .body(discountService.findById(discountId));
    }

    @PostMapping
    public ResponseEntity<Discount> createDiscount(@RequestBody Discount discount) {
        return ResponseEntity
                .status(201)
                .body(discountService.save(discount));
    }

    @PutMapping
    public ResponseEntity<Discount> updateDiscount(@RequestBody Discount discount) {
        return ResponseEntity
                .status(200)
                .body(discountService.update(discount));
    }

    @DeleteMapping("/{discountId}")
    public ResponseEntity<?> deleteDiscount(@PathVariable Long discountId) {
        return ResponseEntity
                .status(200)
                .body(discountService.delete(discountId));
    }

    @GetMapping("/checkDuplicate/{mode}/{discountId}/{field}/{value}")
    public ResponseEntity<?> checkDuplicateDiscountInfo(
            @PathVariable String mode,
            @PathVariable Long discountId,
            @PathVariable String field,
            @PathVariable String value
    ) {
        return ResponseEntity.ok(discountService.checkDuplicateDiscountInfo(mode, discountId, field, value));
    }
}
