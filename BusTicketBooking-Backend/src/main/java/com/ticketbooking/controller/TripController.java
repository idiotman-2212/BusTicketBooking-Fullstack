package com.ticketbooking.controller;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.dto.TripRecommendationDTO;
import com.ticketbooking.model.Trip;
import com.ticketbooking.service.TripRecommendationService;
import com.ticketbooking.service.TripService;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/trips")
@Tag(name = "Trip Controller")
public class TripController {

    private final TripService tripService;
    private final TripRecommendationService tripRecommendationService;

    @GetMapping("/all")
    public List<Trip> getAllTrips() {
        return tripService.findAll();
    }

    @GetMapping("/paging")
    public PageResponse<Trip> getPageOfTrips(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "5") Integer limit) {
        return tripService.findAll(page, limit);
    }

    @GetMapping("/{tripId}")
    public ResponseEntity<Trip> getTrip(@PathVariable Long tripId) {
        return ResponseEntity
                .status(200)
                .body(tripService.findById(tripId));
    }

    @GetMapping("/{sourceId}/{destId}/{chosenFromDate}/{chosenToDate}")
    public List<Trip> findAllTripsBySourceAndDest(@PathVariable Long sourceId,
                                                  @PathVariable Long destId,
                                                  @PathVariable String chosenFromDate,
                                                  @PathVariable String chosenToDate) {
        return tripService.findAllBySourceAndDest(sourceId, destId, chosenFromDate, chosenToDate);
    }


    @PutMapping("/{tripId}/complete")
    public ResponseEntity<?> completeTrip(@PathVariable Long tripId) {
        tripService.completeTrip(tripId);
        return ResponseEntity.ok("Trip id= " + tripId + " completed and points have been credited to users.");
    }

    @PostMapping
    public ResponseEntity<Trip> createTrip(@RequestBody Trip trip) {
        return ResponseEntity
                .status(201)
                .body(tripService.save(trip));
    }

    @PutMapping
    public ResponseEntity<Trip> updateTrip(@RequestBody Trip trip) {
        return ResponseEntity
                .status(200)
                .body(tripService.update(trip));
    }

    @DeleteMapping("/{tripId}")
    public ResponseEntity<?> deleteTrip(@PathVariable Long tripId) {
        return ResponseEntity
                .status(200)
                .body(tripService.delete(tripId));
    }

    @GetMapping("/driver/{driverId}/recent")
    public List<Trip> getRecentTripsByDriver(
            @PathVariable Long driverId,
            @RequestParam String departureDateTime) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime departureDateTimeParsed = LocalDateTime.parse(departureDateTime, formatter);
        return tripService.findRecentTripsByDriverId(driverId,
                departureDateTimeParsed.minusDays(2).format(formatter),
                departureDateTimeParsed.format(formatter));
    }

    @GetMapping("/recommend")
    public ResponseEntity<List<TripRecommendationDTO>> getRecommendedTrips(HttpServletRequest request) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if (authentication == null || !(authentication instanceof UsernamePasswordAuthenticationToken)) {
            List<TripRecommendationDTO> recommendations = tripRecommendationService.getAvailableTrips();
            return ResponseEntity.ok(recommendations);
        }

        String username = authentication.getName();
        List<TripRecommendationDTO> recommendations = tripRecommendationService.getRecommendedTrips(username);

        return ResponseEntity.ok(recommendations);
    }

}
