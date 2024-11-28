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
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class TripRecommendationServiceImpl implements TripRecommendationService {
    private final BookingRepo bookingRepo;
    private final TripRepo tripRepo;

    public List<TripRecommendationDTO> getRecommendedTrips(String username) {
        // Lấy lịch sử đặt vé của người dùng
        List<Booking> userBookings = bookingRepo.findByUserUsernameOrderByBookingDateTimeDesc(username);

        if (userBookings.isEmpty()) {
            // Trường hợp chưa có lịch sử: Lấy các chuyến đi hiện có
            return getAvailableTrips();
        } else {
            // Trường hợp đã có lịch sử: Đề xuất dựa trên lịch sử
            return getRecommendedTripsBasedOnHistory(userBookings);
        }
    }

    public List<TripRecommendationDTO> getAvailableTrips() {
        LocalDateTime now = LocalDateTime.now();

        // Lấy các chuyến đi đang hiện có
        List<Trip> availableTrips = tripRepo.findByDepartureDateTimeAfterAndCompletedFalseOrderByDepartureDateTimeAsc(
                now, PageRequest.of(0, 2) // Giới hạn 10 chuyến đi
        );

        // Chuyển đổi thành DTO
        return availableTrips.stream()
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

    private List<TripRecommendationDTO> getRecommendedTripsBasedOnHistory(List<Booking> userBookings) {
        // Phân tích các tuyến đi thường xuyên nhất
        Map<String, Long> routeFrequency = new HashMap<>();
        for (Booking booking : userBookings) {
            Trip trip = booking.getTrip();
            String route = trip.getSource().getId() + "-" + trip.getDestination().getId();
            routeFrequency.merge(route, 1L, Long::sum);
        }

        // Tìm tuyến đi phổ biến nhất
        String mostFrequentRoute = routeFrequency.entrySet().stream()
                .max(Map.Entry.comparingByValue())
                .map(Map.Entry::getKey)
                .orElse(null);

        if (mostFrequentRoute == null) {
            return Collections.emptyList();
        }

        // Lấy source và destination từ tuyến phổ biến
        String[] routeParts = mostFrequentRoute.split("-");
        Long sourceId = Long.parseLong(routeParts[0]);
        Long destId = Long.parseLong(routeParts[1]);

        // Lấy các chuyến đi sắp tới của tuyến này
        LocalDateTime now = LocalDateTime.now();
        List<Trip> suggestedTrips = tripRepo.findBySourceIdAndDestinationIdAndDepartureDateTimeAfterAndCompletedFalseOrderByDepartureDateTimeAsc(
                sourceId, destId, now, PageRequest.of(0, 2) // Giới hạn 5 chuyến đi
        );

        // Chuyển đổi thành DTO
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
