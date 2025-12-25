package com.ticketbooking.service;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Driver;

import java.util.List;

public interface DriverService {

    Driver findById(Long id);

    List<Driver> findAll();

    PageResponse<Driver> findAll(Integer page, Integer limit);

    Driver save(Driver driver);

    Driver update(Driver driver);

    String delete(Long id);

    Boolean checkDuplicateDriverInfo(String mode, Object driverId, String field, String value);
}
