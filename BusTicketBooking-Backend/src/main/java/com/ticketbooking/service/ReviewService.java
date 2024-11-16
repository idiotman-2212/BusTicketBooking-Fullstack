package com.ticketbooking.service;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.dto.ReviewRequest;
import com.ticketbooking.model.Review;

import java.util.List;

public interface ReviewService {
    Review createReview(ReviewRequest reviewRequest);
    Review getReviewByTripId(Long tripId);
    List<Review> findAll();
    Review findById(Long id);
    PageResponse<Review> findAll(Integer page, Integer limit);


}
