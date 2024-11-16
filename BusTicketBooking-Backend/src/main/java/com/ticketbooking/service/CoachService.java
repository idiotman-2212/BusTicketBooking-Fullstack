package com.ticketbooking.service;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Coach;

import java.util.List;

public interface CoachService {

    Coach findById(Long id);

    List<Coach> findAll();

    PageResponse<Coach> findAll(Integer page, Integer limit);

    Coach save(Coach coach);

    Coach update(Coach coach);

    String delete(Long id);

    Boolean checkDuplicateCoachInfo(String mode, Long coachId, String field, String value);
}
