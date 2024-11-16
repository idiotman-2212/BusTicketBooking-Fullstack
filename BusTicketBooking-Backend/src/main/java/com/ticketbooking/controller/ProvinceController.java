package com.ticketbooking.controller;

import com.ticketbooking.model.Province;
import com.ticketbooking.service.ProvinceService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/provinces")
@Tag(name = "Province Controller")
public class ProvinceController {

    private final ProvinceService provinceService;

    @GetMapping("/all")
    public List<Province> getAllProvinces() {
        return provinceService.findAll();
    }

}
