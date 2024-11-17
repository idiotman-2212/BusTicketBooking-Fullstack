package com.ticketbooking.service.impl;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.exception.ExistingResourceException;
import com.ticketbooking.model.User;
import com.ticketbooking.model.TripLog;
import com.ticketbooking.repo.TripLogRepo;
import com.ticketbooking.service.TripLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TripLogServiceImpl implements TripLogService {
    private final TripLogRepo tripLogRepo;

    @Override
    public List<TripLog> findAll() {
        return tripLogRepo.findAll();
    }

    @Override
    public TripLog findById(Long id) {
        return tripLogRepo.findById(id).orElse(null);
    }

    @Override
    @Cacheable(cacheNames = {"tripLogs_paging"}, key = "{#page, #limit}")
    public PageResponse<TripLog> findAll(Integer page, Integer limit) {
        Page<TripLog> pageSlice = tripLogRepo.findAll(PageRequest.of(page, limit));
        PageResponse<TripLog> pageResponse = new PageResponse<>();
        pageResponse.setDataList(pageSlice.getContent());
        pageResponse.setPageCount(pageSlice.getTotalPages());
        pageResponse.setTotalElements(pageSlice.getTotalElements());
        return pageResponse;
    }

    @Override
    @CacheEvict(cacheNames = "tripLogs_paging", allEntries = true)
    public TripLog save(TripLog tripLog) {
        String currentUsername = getCurrentUsername();
        if (tripLog.getCreatedBy() == null) {
            User createdByUser = new User();
            createdByUser.setUsername(currentUsername);
            tripLog.setCreatedBy(createdByUser);
        } else {
            tripLog.getCreatedBy().setUsername(currentUsername);
        }
        tripLog.setLogTime(LocalDateTime.now());
        return tripLogRepo.save(tripLog);
    }

    @Override
    @CacheEvict(cacheNames = "tripLogs_paging", allEntries = true)
    public TripLog update(TripLog tripLog) {
        String currentUsername = getCurrentUsername();
        if (tripLog.getCreatedBy() == null) {
            User createdByUser = new User();
            createdByUser.setUsername(currentUsername);
            tripLog.setCreatedBy(createdByUser);
        } else {
            tripLog.getCreatedBy().setUsername(currentUsername);
        }
        return tripLogRepo.save(tripLog);
    }

    @Override
    @CacheEvict(cacheNames = "tripLogs_paging", allEntries = true)
    public String delete(Long id) {
        TripLog foundTripLogs = findById(id);
        if (!foundTripLogs.getTrip().getBookings().isEmpty()) {
            throw new ExistingResourceException("Trip<%d> is in used, can't be deleted".formatted(id));
        }
        tripLogRepo.deleteById(id);
        return "Delete Trip Log <%d> successfully".formatted(id);

//        if (tripLogRepo.existsById(id)) {
//            tripLogRepo.deleteById(id);
//            return "Trip Log with ID: " + id + " has been deleted.";
//        }
//        return "Not found Trip Log with ID: " + id;
    }

    @Override
    public List<TripLog> getTripLogsByTripId(Long tripId) {
        return tripLogRepo.findByTripIdOrderByLogTimeDesc(tripId);
    }

    private String getCurrentUsername() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            return authentication.getName();
        }
        return "admin";
    }
}
