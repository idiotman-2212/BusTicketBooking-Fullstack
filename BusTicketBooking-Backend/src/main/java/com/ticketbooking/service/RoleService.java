package com.ticketbooking.service;

import com.ticketbooking.model.Role;

import java.util.List;

public interface RoleService {
    Role findById(Long id);

    List<Role> findAll();

    Role update(Role role);
}
