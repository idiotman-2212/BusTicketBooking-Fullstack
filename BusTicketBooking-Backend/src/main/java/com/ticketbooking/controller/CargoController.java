package com.ticketbooking.controller;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Cargo;
import com.ticketbooking.service.CargoService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/cargos")
@RequiredArgsConstructor
@Tag(name = "Cargo Controller")
public class CargoController {

    private final CargoService cargoService;

    @GetMapping("/all")
    public ResponseEntity<?> getAllByIsDeletedFalse(){
        return ResponseEntity.ok(cargoService.findAll());
    }

    @GetMapping("/paging")
    public PageResponse<Cargo> getPageOfDrivers(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "5") Integer limit) {
        return cargoService.findAll(page, limit);
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getById(@PathVariable Long id){
        return ResponseEntity.ok(cargoService.findById(id));
    }

    @PostMapping
    public ResponseEntity<?> save(@RequestBody Cargo cargo){
        return ResponseEntity.ok(cargoService.save(cargo));
    }

    @PutMapping
    public ResponseEntity<?> update(@RequestBody Cargo cargo){
        return ResponseEntity.ok(cargoService.save(cargo));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delelte(@PathVariable Long id){
        return ResponseEntity.ok(cargoService.deleteById(id));
    }

    @GetMapping("/checkDuplicate/{mode}/{cargoId}/{field}/{value}")
    public ResponseEntity<?> checkDuplicateDiscountInfo(
            @PathVariable String mode,
            @PathVariable Long cargoId,
            @PathVariable String field,
            @PathVariable String value
    ) {
        return ResponseEntity.ok(cargoService.checkDuplicateDiscountInfo(mode, cargoId, field, value));
    }
}

