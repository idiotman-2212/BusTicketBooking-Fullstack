package com.ticketbooking.repo;

import com.ticketbooking.model.TripLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TripLogRepo extends JpaRepository<TripLog, Long> {
    List<TripLog> findByTripIdOrderByLogTimeDesc(Long tripId);
}
