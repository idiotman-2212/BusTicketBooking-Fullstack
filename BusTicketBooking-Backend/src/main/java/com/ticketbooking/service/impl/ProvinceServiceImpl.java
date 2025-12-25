package com.ticketbooking.service.impl;

import com.ticketbooking.exception.ResourceNotFoundException;
import com.ticketbooking.model.Province;
import com.ticketbooking.repo.ProvinceRepo;
import com.ticketbooking.service.ProvinceService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProvinceServiceImpl implements ProvinceService {
    private final ProvinceRepo provinceRepo;
    @Override
    public Province findById(Long id) {
        return provinceRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Not found Province<%d>".formatted(id)));
    }

    @Override
    public Province findByCodeName(String codeName) {
        return null;
    }

    @Override
    @Cacheable(cacheNames = {"provinces"})
    public List<Province> findAll() {
        return provinceRepo.findAll();
    }
}