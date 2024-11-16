package com.ticketbooking.controller;

import com.ticketbooking.dto.*;
import com.ticketbooking.service.AuthenticationService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/auth")
@Tag(name = "Authentication Controller")
public class AuthenticationController {

    private final AuthenticationService authService;

    @PostMapping("/login")
    public ResponseEntity<AuthenticationResponse> authenticateLogin(@RequestBody AuthenticationRequest request) {
        return ResponseEntity.ok(authService.login(request));
    }

    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> register(@RequestBody RegisterRequest request) {
        return ResponseEntity.ok(authService.register(request));
    }

    @PostMapping("/forgot")
    public ResponseEntity<String> forgot(@RequestBody ForgotRequest forgotRequest) {
        return ResponseEntity.ok(authService.forgot(forgotRequest));
    }

    @PostMapping("/change-password")
    public ResponseEntity<String> changePwd(@RequestBody ChangePwdRequest pwdRequest) {
        return ResponseEntity.ok(authService.changePwd(pwdRequest));
    }

    @GetMapping("/checkActiveStatus/{username}")
    public ResponseEntity<?> checkActiveStatus(@PathVariable String username) {
        return ResponseEntity
                .status(200)
                .body(authService.checkActiveStatus(username));
    }

    @GetMapping("/checkExistUsername/{username}")
    public ResponseEntity<?> checkUsername(@PathVariable String username) {
        return ResponseEntity
                .status(200)
                .body(authService.checkExistUsername(username));
    }

    @GetMapping("/checkExistEmail/{email}")
    public ResponseEntity<?> checkEmail(@PathVariable String email) {
        return ResponseEntity
                .status(200)
                .body(authService.checkExistEmail(email));
    }

    @GetMapping("/checkExistPhone/{phone}")
    public ResponseEntity<?> checkPhone(@PathVariable String phone) {
        return ResponseEntity
                .status(200)
                .body(authService.checkExistPhone(phone));
    }
}
