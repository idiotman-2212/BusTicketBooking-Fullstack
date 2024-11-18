package com.ticketbooking.service;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Trip;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public interface TripService {

    Trip findById(Long id);
    List<Trip> findAll();
    PageResponse<Trip> findAll(Integer page, Integer limit);
    Trip save(Trip trip);
    Trip update(Trip trip);
    List<Trip> getIncompleteTrips();
    void completeTrip(Long tripId);
    String delete(Long id);
    List<Trip> findAllBySourceAndDest(Long sourceId, Long destId, String chosenFromDate, String chosenToDate);
    List<Trip> findRecentTripsByDriverId(Long driverId, String fromDateTime, String toDateTime);


}