package com.ticketbooking.service.impl;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.dto.ReviewRequest;
import com.ticketbooking.exception.ResourceNotFoundException;
import com.ticketbooking.model.Review;
import com.ticketbooking.model.Trip;
import com.ticketbooking.model.User;
import com.ticketbooking.repo.ReviewRepo;
import com.ticketbooking.repo.TripRepo;
import com.ticketbooking.repo.UserRepo;
import com.ticketbooking.service.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
    private final ReviewRepo reviewRepo;
    private final TripRepo tripRepo;
    private final UserRepo userRepo;

    @Override
    @CacheEvict(cacheNames = {"reviews", "reviews_paging"}, allEntries = true)
    public Review createReview(ReviewRequest reviewRequest) {
        String username = reviewRequest.getUsername();
        User user = userRepo.findByUsername(username).orElseThrow(()-> new ResourceNotFoundException("Not found user"));
        // Kiểm tra xem người dùng đã đánh giá chuyến đi này chưa
        if (reviewRepo.existsByTrip_IdAndUser_Username(reviewRequest.getTripId(), username)) {
            throw new IllegalArgumentException("You have already reviewed this trip.");
        }

        Review review = Review.builder()
                .trip(tripRepo.findById(reviewRequest.getTripId()).orElseThrow())
                .user(user)
                .driverRating(reviewRequest.getDriverRating())
                .coachRating(reviewRequest.getCoachRating())
                .tripRating(reviewRequest.getTripRating())
                .comment(reviewRequest.getComment())
                .createdAt(LocalDateTime.now())
                .build();
        reviewRepo.save(review);
        return review;
    }


    @Override
    public Review getReviewByTripId(Long tripId) {
        return reviewRepo.findByTripId(tripId);
    }

    @Override
    public List<Review> findAll() {
        return reviewRepo.findAll();
    }

    @Override
    public Review findById(Long id) {
        return reviewRepo.findById(id).orElseThrow(()-> new ResourceNotFoundException("Not found review"));
    }

    @Override
    @Cacheable(cacheNames = {"reviews_paging"}, key = "{#page, #limit}")
    public PageResponse<Review> findAll(Integer page, Integer limit) {
        Page<Review> pageSlice = reviewRepo.findAll(PageRequest.of(page, limit));
        PageResponse<Review> pageResponse = new PageResponse<>();
        pageResponse.setDataList(pageSlice.getContent());
        pageResponse.setPageCount(pageSlice.getTotalPages());
        pageResponse.setTotalElements(pageSlice.getTotalElements());
        return pageResponse;
    }
}