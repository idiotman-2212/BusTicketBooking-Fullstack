package com.ticketbooking.exception;

import lombok.Data;

@Data
public class ExistingResourceException extends RuntimeException {
    private final String errorMessage;
}
