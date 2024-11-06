package com.notificationschedulerservice.notificationschedulerservice.repo;

import com.notificationschedulerservice.notificationschedulerservice.model.Booking;
import com.notificationschedulerservice.notificationschedulerservice.model.Trip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface BookingRepo extends JpaRepository<Booking, Long> {
    List<Booking> findByTrip(Trip trip);

    @Query("SELECT b FROM Booking b WHERE b.paymentStatus = 'PAID' AND b.trip.departureDateTime < :threshold")
    List<Booking> findPaidBookingsBefore(@Param("threshold") LocalDateTime threshold);

    @Query("SELECT b FROM Booking b WHERE b.paymentStatus = 'UNPAID' AND b.trip.departureDateTime < :threshold")
    List<Booking> findUnpaidBookingsBefore(@Param("threshold") LocalDateTime threshold);

    List<Booking> findAllByTripId(Long tripId);
}
