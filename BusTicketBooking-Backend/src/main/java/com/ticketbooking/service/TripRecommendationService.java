package com.ticketbooking.service;

import com.ticketbooking.dto.TripRecommendationDTO;

import java.util.List;

public interface TripRecommendationService {
    List<TripRecommendationDTO> getRecommendedTrips(String username);
    List<TripRecommendationDTO> getAvailableTrips();
}
