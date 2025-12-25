package com.ticketbooking.service;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.TripLog;

import java.util.List;

public interface TripLogService {
    List<TripLog> findAll();
    TripLog findById(Long id);
    List<TripLog> getTripLogsByTripId(Long tripId);
    PageResponse<TripLog> findAll(Integer page, Integer limit);
    TripLog save(TripLog tripLog);
    TripLog update(TripLog tripLog);
    String delete (Long id);
}
