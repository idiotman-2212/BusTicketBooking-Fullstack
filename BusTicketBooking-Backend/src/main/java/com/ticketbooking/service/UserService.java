package com.ticketbooking.service;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.dto.PermissionDto;
import com.ticketbooking.dto.ScreenPermissionDto;
import com.ticketbooking.model.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    User findByUsername(String username);

    List<User> findAll();

    PageResponse<User> findAll(Integer page, Integer limit);

    User save(User user);

    User update(User user);

    String delete(String username);

    Boolean checkDuplicateUserInfo(String mode, String username, String field, String value);

    PermissionDto getUserPermission(String username);

    PermissionDto updateUserScreenPermission(ScreenPermissionDto screenPermissionDto);
}
