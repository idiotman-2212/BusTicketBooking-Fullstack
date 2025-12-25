package com.ticketbooking.service.impl;

import com.ticketbooking.dto.CargoRequest;
import com.ticketbooking.exception.ResourceNotFoundException;
import com.ticketbooking.model.Booking;
import com.ticketbooking.model.BookingCargo;
import com.ticketbooking.model.Cargo;
import com.ticketbooking.repo.BookingCargoRepo;
import com.ticketbooking.repo.CargoRepo;
import com.ticketbooking.service.BookingCargoService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BookingCargoServiceImpl implements BookingCargoService {
    private final CargoRepo cargoRepo;
    private final BookingCargoRepo bookingCargoRepo;

    @Override
    @Transactional
    public BookingCargo addCargoToBooking(Booking booking, CargoRequest cargoRequest) {
        Cargo cargo = cargoRepo.findById(cargoRequest.getCargoId())
                .orElseThrow(() -> new ResourceNotFoundException("Cargo not found"));

        BigDecimal totalCargoPrice = cargo.getBasePrice().multiply(new BigDecimal(cargoRequest.getQuantity()));

        BookingCargo bookingCargo = BookingCargo.builder()
                .booking(booking)
                .cargo(cargo)
                .quantity(cargoRequest.getQuantity())
                .price(totalCargoPrice)
                .build();

        return bookingCargoRepo.save(bookingCargo);
    }

    @Override
    public BigDecimal calculateTotalCargoPrice(List<BookingCargo> bookingCargos) {
        return bookingCargos.stream()
                .map(BookingCargo::getPrice)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }
}
