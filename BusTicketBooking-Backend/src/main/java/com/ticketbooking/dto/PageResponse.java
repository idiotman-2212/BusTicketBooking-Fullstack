package com.ticketbooking.dto;

import lombok.Data;

import java.util.List;

@Data
public class PageResponse<T> {
    private List<T> dataList;
    private Integer pageCount;
    private Long totalElements;
}
