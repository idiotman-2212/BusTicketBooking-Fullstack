package com.ticketbooking.service;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Coach;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface CoachService {

    Coach findById(Long id);

    List<Coach> findAll();

    PageResponse<Coach> findAll(Integer page, Integer limit);

    Coach save(Coach coach, MultipartFile image) throws IOException;

    Coach update(Coach coach, MultipartFile image) throws IOException;

    String delete(Long id);

    Boolean checkDuplicateCoachInfo(String mode, Long coachId, String field, String value);
}
