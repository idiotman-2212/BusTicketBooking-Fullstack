package com.ticketbooking.repo;

import com.ticketbooking.model.Discount;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface DiscountRepo extends JpaRepository<Discount, Long> {

    Optional<Discount> findByCode(String code);

    @Query("""
                    select d from Discount d where d.endDateTime > current_timestamp 
            """)
    List<Discount> findAllAvailable();
}
