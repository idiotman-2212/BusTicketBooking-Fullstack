package com.ticketbooking.service.impl;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.exception.ExistingResourceException;
import com.ticketbooking.exception.ResourceNotFoundException;
import com.ticketbooking.model.Driver;
import com.ticketbooking.repo.DriverRepo;
import com.ticketbooking.repo.UtilRepo;
import com.ticketbooking.service.DriverService;
import com.ticketbooking.validator.ObjectValidator;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DriverServiceImpl implements DriverService {
    private final DriverRepo driverRepo;
    private final ObjectValidator<Driver> objectValidator;
    private final UtilRepo utilRepo;

    @Override
    public Driver findById(Long id) {
        return driverRepo.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Not found Driver<%d>".formatted(id)));
    }

    @Override
    @Cacheable(cacheNames = {"drivers"})
    public List<Driver> findAll() {
        return driverRepo.findAll();
    }

    @Override
    @Cacheable(cacheNames = {"drivers_paging"}, key = "{#page, #limit}")
    public PageResponse<Driver> findAll(Integer page, Integer limit) {
        Page<Driver> pageSlice = driverRepo.findAll(PageRequest.of(page, limit));
        PageResponse<Driver> pageResponse = new PageResponse<>();
        pageResponse.setDataList(pageSlice.getContent());
        pageResponse.setPageCount(pageSlice.getTotalPages());
        pageResponse.setTotalElements(pageSlice.getTotalElements());
        return pageResponse;
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"drivers", "drivers_paging"}, allEntries = true)
    public Driver save(Driver driver) {
        objectValidator.validate(driver);
        if (!checkDuplicateDriverInfo("ADD", driver.getId(), "email", driver.getEmail())) {
            throw new ExistingResourceException("Email<%s> is already exist".formatted(driver.getEmail()));
        }

        if (!checkDuplicateDriverInfo("ADD", driver.getId(), "phone", driver.getPhone())) {
            throw new ExistingResourceException("Phone<%s> is already exist".formatted(driver.getPhone()));
        }

        if (!checkDuplicateDriverInfo("ADD", driver.getId(), "licenseNumber", driver.getLicenseNumber())) {
            throw new ExistingResourceException("License Number<%s> is already exist".formatted(driver.getLicenseNumber()));
        }
        return driverRepo.save(driver);
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"drivers", "drivers_paging"}, allEntries = true)
    public Driver update(Driver driver) {
        objectValidator.validate(driver);

        if (!checkDuplicateDriverInfo("EDIT", driver.getId(), "email", driver.getEmail())) {
            throw new ExistingResourceException("Email<%s> is already exist".formatted(driver.getEmail()));
        }

        if (!checkDuplicateDriverInfo("EDIT", driver.getId(), "phone", driver.getPhone())) {
            throw new ExistingResourceException("Phone<%s> is already exist".formatted(driver.getPhone()));
        }

        if (!checkDuplicateDriverInfo("EDIT", driver.getId(), "licenseNumber", driver.getLicenseNumber())) {
            throw new ExistingResourceException("License Number<%s> is already exist".formatted(driver.getLicenseNumber()));
        }
        return driverRepo.save(driver);
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"drivers", "drivers_paging"}, allEntries = true)
    public String delete(Long id) {

        Driver foundDriver = findById(id);

        if (!foundDriver.getTrips().isEmpty()) {
            throw new ExistingResourceException("Driver<%d> has run some trips, can't be deleted".formatted(id));
        }
        driverRepo.deleteById(id);
        return "Delete Driver<%d> successfully".formatted(id);
    }

    @Override
    public Boolean checkDuplicateDriverInfo(String mode, Object driverId, String field, String value) {
        List<Driver> foundDrivers = utilRepo.checkDuplicateByStringField(Driver.class, mode, "id",
                driverId, field, value);
        return foundDrivers.isEmpty();
    }
}