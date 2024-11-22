package com.ticketbooking.service.impl;

import com.ticketbooking.dto.TripRecommendationDTO;
import com.ticketbooking.model.Booking;
import com.ticketbooking.model.Trip;
import com.ticketbooking.repo.BookingRepo;
import com.ticketbooking.repo.TripRepo;
import com.ticketbooking.service.TripRecommendationService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TripRecommendationServiceImpl implements TripRecommendationService {
    private final BookingRepo bookingRepo;
    private final TripRepo tripRepo;

    public List<TripRecommendationDTO> getRecommendedTrips(String username) {
        // Get user's booking history
        List<Booking> userBookings = bookingRepo.findByUserUsernameOrderByBookingDateTimeDesc(username);

        if (userBookings.isEmpty()) {
            return Collections.emptyList();
        }

        // Analyze most frequent routes
        Map<String, Long> routeFrequency = new HashMap<>();
        for (Booking booking : userBookings) {
            Trip trip = booking.getTrip();
            String route = trip.getSource().getId() + "-" + trip.getDestination().getId();
            routeFrequency.merge(route, 1L, Long::sum);
        }

        // Get most frequent route
        String mostFrequentRoute = routeFrequency.entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse(null);

        if (mostFrequentRoute == null) {
            return Collections.emptyList();
        }

        // Get source and destination IDs from the route
        String[] routeParts = mostFrequentRoute.split("-");
        Long sourceId = Long.parseLong(routeParts[0]);
        Long destId = Long.parseLong(routeParts[1]);

        // Find upcoming trips for the most frequent route
        LocalDateTime now = LocalDateTime.now();
        List<Trip> suggestedTrips = tripRepo.findBySourceIdAndDestinationIdAndDepartureDateTimeAfterAndCompletedFalseOrderByDepartureDateTimeAsc(
                sourceId, destId, now, PageRequest.of(0, 2));

        // Convert to DTOs
        return suggestedTrips.stream()
                .map(trip -> new TripRecommendationDTO(
                        trip.getId(),
                        trip.getSource().getName(),
                        trip.getDestination().getName(),
                        trip.getDepartureDateTime(),
                        trip.getPrice(),
                        trip.getCoach().getCoachType().toString(),
                        trip.getPickUpLocation().getAddress(),
                        trip.getDropOffLocation().getAddress()
                ))
                .collect(Collectors.toList());
    }

}
