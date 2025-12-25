package com.ticketbooking.repo;

import com.ticketbooking.model.Cargo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CargoRepo extends JpaRepository<Cargo, Long> {
}
