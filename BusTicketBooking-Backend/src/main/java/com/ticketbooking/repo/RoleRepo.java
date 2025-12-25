package com.ticketbooking.repo;

import com.ticketbooking.model.Role;
import com.ticketbooking.model.enumType.RoleCode;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RoleRepo extends JpaRepository<Role, Long> {

    Optional<Role> findByRoleCode(RoleCode roleCode);
}
