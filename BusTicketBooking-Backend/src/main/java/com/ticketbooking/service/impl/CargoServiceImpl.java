package com.ticketbooking.service.impl;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.exception.ExistingResourceException;
import com.ticketbooking.exception.ResourceNotFoundException;
import com.ticketbooking.model.Cargo;
import com.ticketbooking.repo.CargoRepo;
import com.ticketbooking.repo.UtilRepo;
import com.ticketbooking.service.CargoService;
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
public class CargoServiceImpl implements CargoService {
    private final CargoRepo cargoRepo;
    private final ObjectValidator<Cargo> objectValidator;
    private final UtilRepo utilRepo;

    @Override
    @Transactional
    public List<Cargo> findAll() {
        return cargoRepo.findAll();
    }

    @Override
    @Transactional
    @Cacheable(cacheNames = {"cargos_paging"}, key = "{#page, #limit}")
    public PageResponse<Cargo> findAll(Integer page, Integer limit) {
        Page<Cargo> pageSlice = cargoRepo.findAll(PageRequest.of(page, limit));
        PageResponse<Cargo> pageResponse = new PageResponse<>();
        pageResponse.setDataList(pageSlice.getContent());
        pageResponse.setPageCount(pageSlice.getTotalPages());
        pageResponse.setTotalElements(pageSlice.getTotalElements());
        return pageResponse;
    }

    @Override
    @Transactional
    public Cargo findById(Long id) {
        return cargoRepo.findById(id).orElseThrow(()-> new ResourceNotFoundException("Not found Cargo"));
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"cargos", "cargos_paging"}, allEntries = true)
    public Cargo save(Cargo cargo) {
        objectValidator.validate(cargo);
        if(!checkDuplicateDiscountInfo("ADD", cargo.getId(), "name", cargo.getName())){
            throw new ResourceNotFoundException("Cargo Name <%s> is already exist".formatted(cargo.getName()));
        }
        return cargoRepo.save(cargo);
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"cargos", "cargos_paging"}, allEntries = true)
    public Cargo update(Cargo cargo) {
        objectValidator.validate(cargo);
        if(!checkDuplicateDiscountInfo("EDIT", cargo.getId(), "name", cargo.getName())){
            throw new ResourceNotFoundException("Cargo Name <%s> is already exist".formatted(cargo.getName()));
        }
        return cargoRepo.save(cargo);
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"cargos", "cargos_paging"}, allEntries = true)
    public String deleteById(Long id) {
        Cargo foundCargo = findById(id);

        if (!foundCargo.getBookingCargos().isEmpty()) {
            throw new ExistingResourceException("Cargo <%d> has been using some bookings, can't be deleted".formatted(id));
        }
        cargoRepo.deleteById(id);
        return "Delete Cargo <%d> successfully".formatted(id);
    }

    @Override
    public Boolean checkDuplicateDiscountInfo(String mode, Long cargoId, String field, String value) {
        List<Cargo> foundCargos = utilRepo.checkDuplicateByStringField(Cargo.class, mode, "id",
                cargoId, field, value);
        return foundCargos.isEmpty();
    }
}
