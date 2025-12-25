package com.ticketbooking.repo;

import com.ticketbooking.model.Coach;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CoachRepo extends JpaRepository<Coach, Long> {
}
