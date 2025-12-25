package com.ticketbooking.exception;

import lombok.Data;

import java.util.Set;

@Data
public class ObjectNotValidException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    private final Set<String> errorsMessages;
}
