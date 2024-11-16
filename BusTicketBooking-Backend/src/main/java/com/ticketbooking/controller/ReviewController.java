package com.ticketbooking.controller;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.dto.ReviewRequest;
import com.ticketbooking.model.Review;
import com.ticketbooking.repo.ReviewRepo;
import com.ticketbooking.service.ReviewService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/reviews")
@RequiredArgsConstructor
@Tag(name = "Review Controller")
public class ReviewController {

    private final ReviewService reviewService;
    private final ReviewRepo reviewRepo;

    @PostMapping
    public ResponseEntity<?> createReview(@RequestBody ReviewRequest reviewRequest, Authentication authentication) {
        String username = authentication.getName();
        reviewRequest.setUsername(username);
        Review review = reviewService.createReview(reviewRequest);
        return ResponseEntity.ok(review);
    }

    @GetMapping("/trip/{tripId}")
    public ResponseEntity<?> getReviewByTripId(@PathVariable Long tripId) {
        Review review = reviewService.getReviewByTripId(tripId);
        if (review != null) {
            return ResponseEntity.ok(review);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    // Admin xem tất cả các đánh giá
    @GetMapping("/all")
    public ResponseEntity<?> getAllReviews() {
        List<Review> reviews = reviewService.findAll();
        return ResponseEntity.ok(reviews);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> findById(@PathVariable Long id){
        return ResponseEntity.ok(reviewService.findById(id));
    }

    @GetMapping("/paging")
    public PageResponse<Review> findAll(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "5") Integer limit) {
        return reviewService.findAll(page, limit);
    }

    @GetMapping("/check")
    public ResponseEntity<Boolean> checkReviewStatus(@RequestParam Long tripId, @RequestParam String username) {
        boolean exists = reviewRepo.existsByTrip_IdAndUser_Username(tripId, username);
        return ResponseEntity.ok(exists);
    }

}
