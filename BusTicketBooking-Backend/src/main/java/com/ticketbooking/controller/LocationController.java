package com.ticketbooking.controller;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Location;
import com.ticketbooking.service.LocationService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/locations")
@RequiredArgsConstructor
@Tag(name = "Location Controller")
public class LocationController {

    private final LocationService locationService;

    @GetMapping("/all")
    public ResponseEntity<?> getAllLocations() {
        List<Location> locations = locationService.findAll();
        return new ResponseEntity<>(locations, HttpStatus.OK);
    }

    @GetMapping("/paging")
    public PageResponse<Location> getPageOfLocations(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "5") Integer limit) {
        return locationService.findAll(page, limit);
    }

    @GetMapping("/province/{provinceId}")
    public ResponseEntity<?> getLocationsByProvince(@PathVariable Long provinceId) {
        List<Location> locations = locationService.findByProvinceId(provinceId);
        return new ResponseEntity<>(locations, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getLocationById(@PathVariable Long id) {
        Location location = locationService.findById(id);
        return new ResponseEntity<>(location, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<?> createLocation(@RequestBody Location location) {
        Location newLocation = locationService.saveLocation(location);
        return new ResponseEntity<>(newLocation, HttpStatus.CREATED);
    }

    @PutMapping
    public ResponseEntity<?> updateLocation(
            @RequestBody Location updatedLocation) {
        Location location = locationService.updateLocation(updatedLocation);
        return new ResponseEntity<>(location, HttpStatus.OK);
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteLocation(@PathVariable Long id) {
        locationService.deleteLocation(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
