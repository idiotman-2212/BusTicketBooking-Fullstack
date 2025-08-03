package com.ticketbooking.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class PageResponse<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    private List<T> dataList;
    private Integer pageCount;
    private Long totalElements;
}
