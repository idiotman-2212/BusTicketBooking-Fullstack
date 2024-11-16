package com.ticketbooking.exception;

public class BookingException extends RuntimeException {
    private final String errorMessage;

    public BookingException(String errorMessage) {
        super(errorMessage);
        this.errorMessage = errorMessage;
    }

    public String getErrorMessage() {
        return errorMessage;
    }
}