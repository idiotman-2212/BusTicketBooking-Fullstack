package com.ticketbooking.service;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.model.Discount;

import java.util.List;

public interface DiscountService {

    Discount findById(Long id);

    Discount findByCode(String code);

    List<Discount> findAll();

    List<Discount> findAllAvailable();

    PageResponse<Discount> findAll(Integer page, Integer limit);

    Discount save(Discount discount);

    Discount update(Discount discount);

    String delete(Long id);

    Boolean checkDuplicateDiscountInfo(String mode, Long discountId, String field, String value);
}
