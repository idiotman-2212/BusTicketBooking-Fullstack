package com.ticketbooking.controller;

import com.ticketbooking.dto.BookingRequest;
import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Booking;
import com.ticketbooking.service.BookingService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/bookings")
@Tag(name = "Booking Controller")
public class BookingController {

    private final BookingService bookingService;

    @GetMapping("/all")
    public List<Booking> getAllBookings() {
        return bookingService.findAll();
    }

    @GetMapping("/all/{phone}")
    public List<Booking> getAllBookingsByPhone(@PathVariable String phone) {
        return bookingService.findAllByPhone(phone);
    }

    @GetMapping("/all/user/{username}")
    public List<Booking> getAllBookingsByUsername(@PathVariable String username) {
        return bookingService.findAllByUsername(username);
    }

    @GetMapping("/paging")
    public PageResponse<Booking> getPageOfBookings(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "5") Integer limit) {
        return bookingService.findAll(page, limit);
    }

    @GetMapping("/{bookingId}")
    public ResponseEntity<Booking> getBooking(@PathVariable Long bookingId) {
        return ResponseEntity
                .status(200)
                .body(bookingService.findById(bookingId));
    }

    @GetMapping("/cargos/{bookingId}")
    public ResponseEntity<?> getBookingWithCargos(@PathVariable Long bookingId) {
        return ResponseEntity
                .status(200)
                .body(bookingService.getBookingWithCargos(bookingId));
    }

    @GetMapping("/emptySeats")
    public List<Booking> getAllBookingFromTripAndDate(@RequestParam Long tripId) {
        return bookingService.getAllBookingFromTripAndDate(tripId);
    }

    @GetMapping("/available-seats/{tripId}")
    public ResponseEntity<List<String>> getAvailableSeats(@PathVariable Long tripId) {
        List<String> availableSeats = bookingService.getAvailableSeats(tripId);
        return ResponseEntity.ok(availableSeats);  // Trả về danh sách ghế trống
    }

    @PostMapping("/site1")
    public ResponseEntity<List<Booking>> createBookingsForRegisteredUser(@RequestBody BookingRequest bookingRequest) {
        return ResponseEntity
                .status(201)
                .body(bookingService.saveForRegisteredUser(bookingRequest));
    }

    @PostMapping("/site2")
    public ResponseEntity<List<Booking>> createBookingsForWalkInCustomer(@RequestBody BookingRequest bookingRequest) {
        // Gọi service để xử lý
        List<Booking> savedBookings = bookingService.saveForWalkInCustomer(bookingRequest);
        return ResponseEntity.status(201).body(savedBookings);
    }

    @PutMapping
    public ResponseEntity<Booking> updateTrip(@RequestBody Booking booking) {
        return ResponseEntity
                .status(200)
                .body(bookingService.update(booking));
    }

    @DeleteMapping("/{bookingId}")
    public ResponseEntity<?> deleteBooking(@PathVariable Long bookingId) {
        return ResponseEntity
                .status(200)
                .body(bookingService.delete(bookingId));
    }
    @GetMapping("/search")
    public ResponseEntity<List<Booking>> searchBookingsByPhone(@RequestParam String phone) {
        List<Booking> bookings = bookingService.findBookingsByPhone(phone);
        return ResponseEntity.ok(bookings);
    }

    @PostMapping("/refund/confirm/{bookingId}")
    public ResponseEntity<?> confirmRefund(@PathVariable Long bookingId) {
        try {
            Booking updatedBooking = bookingService.confirmRefund(bookingId);
            return ResponseEntity.ok("Refund confirmed successfully.");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
