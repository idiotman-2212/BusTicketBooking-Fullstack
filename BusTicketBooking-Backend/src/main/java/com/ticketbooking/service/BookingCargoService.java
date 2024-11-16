package com.ticketbooking.service;

import com.ticketbooking.dto.CargoRequest;
import com.ticketbooking.model.Booking;
import com.ticketbooking.model.BookingCargo;

import java.math.BigDecimal;
import java.util.List;

public interface BookingCargoService {
    BookingCargo addCargoToBooking(Booking booking, CargoRequest cargoRequest);
    BigDecimal calculateTotalCargoPrice(List<BookingCargo> bookingCargos);
}
