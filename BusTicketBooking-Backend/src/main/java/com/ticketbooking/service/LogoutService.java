package com.ticketbooking.service;

import com.ticketbooking.model.Token;
import com.ticketbooking.repo.TokenRepo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LogoutService implements LogoutHandler {

    private final TokenRepo tokenRepo;


    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
        final String authHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        final String jwt;

        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            return; // Không thực hiện các phần sau của chuỗi filter nữa.
        }

        jwt = authHeader.substring(7);
        Token storedToken = tokenRepo.findByToken(jwt).orElse(null);

        if (storedToken != null) {
            storedToken.setExpired(true);
            storedToken.setRevoked(true);
            tokenRepo.save(storedToken);
        }
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
