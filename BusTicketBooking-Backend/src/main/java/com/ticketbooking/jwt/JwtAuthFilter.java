package com.ticketbooking.jwt;

import com.ticketbooking.repo.TokenRepo;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Lazy;
import org.springframework.http.HttpHeaders;
import org.springframework.lang.NonNull;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
public class JwtAuthFilter extends OncePerRequestFilter {

    private  JwtService jwtService;

    private  UserDetailsService userDetailsService;

    private  TokenRepo tokenRepo;

    public JwtAuthFilter(@Lazy JwtService jwtService,
                         @Lazy UserDetailsService userDetailsService,
                         @Lazy TokenRepo tokenRepo) {
        this.jwtService = jwtService;
        this.userDetailsService = userDetailsService;
        this.tokenRepo = tokenRepo;
    }

    // Xử lý JWT
    @Override
    protected void doFilterInternal(
            @NonNull HttpServletRequest request,
            @NonNull HttpServletResponse response,
            @NonNull FilterChain filterChain) throws ServletException, IOException {
        final String authHeader = request.getHeader(HttpHeaders.AUTHORIZATION);
        final String jwt;
        final String username;

        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            filterChain.doFilter(request, response);
            return; // Không thực hiện các phần sau của chuỗi filter nữa.
        }

        jwt = authHeader.substring(7);
        try {
            username = jwtService.extractUsername(jwt);
        } catch (Exception ex) {
            // Malformed/expired token: treat as unauthenticated.
            filterChain.doFilter(request, response);
            return;
        }

        // Nếu trong security context chưa có thông tin xác thực của User đó thì set vào security context
        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {
            try {
                UserDetails userDetails = userDetailsService.loadUserByUsername(username);
                boolean isValidToken = tokenRepo.findByToken(jwt)
                        .map(t -> !t.isExpired() && !t.isRevoked())
                        .orElse(false);
                if (isValidToken && jwtService.isTokenValid(jwt, userDetails)) {
                    UsernamePasswordAuthenticationToken authToken =
                            new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                    authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(authToken);
                }
            } catch (UsernameNotFoundException ex) {
                // JWT contains a username that no longer exists => treat as unauthenticated.
            } catch (Exception ex) {
                // Any auth parsing/lookup error => don't authenticate.
            }
        }

        filterChain.doFilter(request, response);
    }
}
