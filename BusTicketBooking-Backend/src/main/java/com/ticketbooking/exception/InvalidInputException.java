package com.ticketbooking.exception;

import lombok.Data;

@Data
public class InvalidInputException extends RuntimeException {
    private final String errorMessage;
}
