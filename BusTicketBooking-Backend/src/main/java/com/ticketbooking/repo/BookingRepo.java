package com.ticketbooking.repo;

import com.ticketbooking.model.Booking;
import com.ticketbooking.model.Trip;
import com.ticketbooking.model.User;
import com.ticketbooking.model.enumType.PaymentStatus;
import jakarta.persistence.LockModeType;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface BookingRepo extends JpaRepository<Booking, Long> {

    @Query("""
        select b from Booking b
        where b.trip.id=:tripId 
        and b.paymentStatus <> 'CANCEL'
        and b.paymentStatus <> 'REFUNDED'
        and b.paymentStatus <> 'REFUND_PENDING'
        """)
    List<Booking> getAllBookingFromTripAndDate(@Param("tripId") Long tripId);


    @Query(value = """
            select * from booking b where b.phone=:phone /*and b.username is null*/
            """, nativeQuery = true)
    List<Booking> findAllByPhone(@Param("phone") String phone);

    List<Booking> findAllByUser(User user);
    List<Booking> findByPhone(String phone);

    List<Booking> findByTrip(Trip trip);

    @Query("SELECT b FROM Booking b WHERE b.paymentStatus = 'PAID' AND b.trip.departureDateTime < :threshold")
    List<Booking> findPaidBookingsBefore(@Param("threshold") LocalDateTime threshold);

    @Query("SELECT b FROM Booking b WHERE b.paymentStatus = 'UNPAID' AND b.trip.departureDateTime < :threshold")
    List<Booking> findUnpaidBookingsBefore(@Param("threshold") LocalDateTime threshold);

    List<Booking> findAllByTripId(Long tripId);

    @Query("SELECT b FROM Booking b " +
            "LEFT JOIN FETCH b.bookingCargos bc " +
            "WHERE b.id = :bookingId " +
            "AND bc.quantity > 0")
    Optional<Booking> findByIdWithCargos(@Param("bookingId") Long bookingId);

    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("SELECT b FROM Booking b WHERE b.trip.id = :tripId AND b.seatNumber = :seatNumber AND b.paymentStatus NOT IN (:excludedStatuses)")
    Optional<Booking> findBookingByTripIdAndSeatNumberWithLock(
            @Param("tripId") Long tripId,
            @Param("seatNumber") String seatNumber,
            @Param("excludedStatuses") List<PaymentStatus> excludedStatuses);

    List<Booking> findByUserUsernameOrderByBookingDateTimeDesc(String username);
}
