package com.ticketbooking.repo;

import com.ticketbooking.model.BookingCargo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingCargoRepo extends JpaRepository<BookingCargo, Long> {
}
