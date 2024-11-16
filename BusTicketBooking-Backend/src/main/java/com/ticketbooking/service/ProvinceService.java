package com.ticketbooking.service;

import com.ticketbooking.model.Province;

import java.util.List;

public interface ProvinceService {

    Province findById(Long id);

    Province findByCodeName(String codeName);

    List<Province> findAll();
}
