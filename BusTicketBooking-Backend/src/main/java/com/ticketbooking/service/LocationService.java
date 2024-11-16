package com.ticketbooking.service;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Location;

import java.util.List;

public interface LocationService {
    Location findById(Long id);

    List<Location> findAll();

    PageResponse<Location> findAll(Integer page, Integer limit);

    List<Location> findByProvinceId(Long provinceId);

    Location saveLocation(Location location);

    Location updateLocation(Location location);

    String deleteLocation(Long id);

    Boolean checkDuplicateLocationInfo(String mode, Long loactionId, String field, String value);
}
