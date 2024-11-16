package com.ticketbooking.repo;

import com.ticketbooking.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewRepo extends JpaRepository<Review, Long> {
    Review findByTripId(Long tripId);
    boolean existsByTrip_IdAndUser_Username(Long tripId, String username);
}
