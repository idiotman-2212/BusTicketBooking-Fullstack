package com.ticketbooking.controller;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Coach;
import com.ticketbooking.service.CoachService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/coaches")
@Tag(name = "Coach Controller")
public class CoachController {

    private final CoachService coachService;

    @GetMapping("/all")
    public List<Coach> getAllCoaches() {
        return coachService.findAll();
    }

    @GetMapping("/paging")
    public PageResponse<Coach> getPageOfCoaches(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "5") Integer limit) {
        return coachService.findAll(page, limit);
    }

    @GetMapping("/{coachId}")
    public ResponseEntity<Coach> getCoach(@PathVariable Long coachId) {
        return ResponseEntity
                .status(200)
                .body(coachService.findById(coachId));
    }

    @PostMapping
    public ResponseEntity<Coach> createCoach(@RequestBody Coach coach) {
        return ResponseEntity
                .status(201)
                .body(coachService.save(coach));
    }

    @PutMapping
    public ResponseEntity<Coach> updateCoach(@RequestBody Coach coach) {
        return ResponseEntity
                .status(200)
                .body(coachService.update(coach));
    }

    @DeleteMapping("/{coachId}")
    public ResponseEntity<?> deleteCoach(@PathVariable Long coachId) {
        return ResponseEntity
                .status(200)
                .body(coachService.delete(coachId));
    }

    @GetMapping("/checkDuplicate/{mode}/{coachId}/{field}/{value}")
    public ResponseEntity<?> checkDuplicateCoachInfo(
            @PathVariable String mode,
            @PathVariable Long coachId,
            @PathVariable String field,
            @PathVariable String value
    ) {
        return ResponseEntity.ok(coachService.checkDuplicateCoachInfo(mode, coachId, field, value));
    }
}
