package com.ticketbooking.service;

import com.ticketbooking.dto.BookingRequest;
import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Booking;
import com.ticketbooking.model.Trip;
import com.ticketbooking.model.enumType.PaymentStatus;

import java.time.LocalDateTime;
import java.util.List;

public interface BookingService {

    List<Booking> findAllByPhone(String phone);

    List<Booking> findAllByUsername(String username);

    Booking findById(Long id);

    List<Booking> findAll();

    PageResponse<Booking> findAll(Integer page, Integer limit);

    List<Booking> saveForRegisteredUser(BookingRequest bookingRequest);

    List<Booking> saveForWalkInCustomer(BookingRequest bookingRequest);

    Booking update(Booking booking);

    String delete(Long id);
    Booking confirmRefund(Long bookingId);

    List<Booking> getAllBookingFromTripAndDate(Long tripId);

    List<Booking> findBookingsByPhone(String phone);

    List<String> getAvailableSeats(Long tripId);
    Booking getBookingWithCargos(Long bookingId);
}
