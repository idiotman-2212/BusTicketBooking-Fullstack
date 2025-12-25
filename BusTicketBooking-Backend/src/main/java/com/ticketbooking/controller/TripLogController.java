package com.ticketbooking.controller;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.TripLog;
import com.ticketbooking.service.TripLogService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/tripLogs")
@RequiredArgsConstructor
@Tag(name = "Trip Log Controller")
public class TripLogController {
    private final TripLogService tripLogService;

    @GetMapping("/all")
    public ResponseEntity<?> findAll(){
        return ResponseEntity.ok(tripLogService.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> findById(@PathVariable Long id){
        return ResponseEntity.ok(tripLogService.findById(id));
    }

    @GetMapping("/paging")
    public PageResponse<TripLog> getPageOfTripLogs(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "5") Integer limit) {
        return tripLogService.findAll(page, limit);
    }

    @GetMapping("/trip/{tripId}")
    public ResponseEntity<?> getTripLogsByTripId(@PathVariable Long tripId) {
        return ResponseEntity.ok(tripLogService.getTripLogsByTripId(tripId));
    }

    @PostMapping
    public ResponseEntity<?> create(@RequestBody TripLog tripLog) {
        return ResponseEntity.ok(tripLogService.save(tripLog));
    }

    @PutMapping
    public ResponseEntity<?> update(@RequestBody TripLog tripLog) {
        return ResponseEntity.ok(tripLogService.update(tripLog));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id){
        return ResponseEntity.ok(tripLogService.delete(id));
    }
}
