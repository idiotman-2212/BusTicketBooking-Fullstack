package com.ticketbooking.dto;

import com.ticketbooking.model.Role;
import com.ticketbooking.model.enumType.RoleCode;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class RegisterRequest {

    private String firstName;

    private String lastName;

    private String username;

    private String password;

    private String email;

    private String phone;

    private RoleCode role;
}
