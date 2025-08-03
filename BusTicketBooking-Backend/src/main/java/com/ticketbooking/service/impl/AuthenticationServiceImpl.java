package com.ticketbooking.service.impl;

import com.ticketbooking.dto.*;
import com.ticketbooking.exception.ResourceNotFoundException;
import com.ticketbooking.jwt.JwtService;
import com.ticketbooking.model.Role;
import com.ticketbooking.model.Token;
import com.ticketbooking.model.User;
import com.ticketbooking.model.UserPermission;
import com.ticketbooking.model.enumType.TokenType;
import com.ticketbooking.repo.RoleRepo;
import com.ticketbooking.repo.TokenRepo;
import com.ticketbooking.repo.UserPermissionRepo;
import com.ticketbooking.repo.UserRepo;
import com.ticketbooking.service.AuthenticationService;
import com.ticketbooking.service.MailService;
import com.ticketbooking.service.UserService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.core.env.Environment;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class AuthenticationServiceImpl implements AuthenticationService {

    private final AuthenticationManager authenticationManager;

    private final UserService userService;

    private final JwtService jwtService;

    private final MailService mailService;

    private final TokenRepo tokenRepo;

    private final UserRepo userRepo;

    private final RoleRepo roleRepo;

    private final Environment env;

    private final PasswordEncoder encoder;

    @Override
    @Transactional
    public  AuthenticationResponse login(AuthenticationRequest authRequest) {
        Authentication authentication = authenticationManager.authenticate(//xác thực người dùng bằng authentication manager
                new UsernamePasswordAuthenticationToken(authRequest.getUsername(), authRequest.getPassword())
        );
        //nếu xác thực thành công thì tạo token mới và xoá token cũ
        if (authentication.isAuthenticated()) {
            User user = userService.findByUsername(authRequest.getUsername());
            String jwtToken = jwtService.generateToken(user);

            revokeAllUserToken(user);
            saveUserToken(user, jwtToken);

            return AuthenticationResponse
                    .builder()
                    .token(jwtToken)
                    .build();
        } else throw new ResourceNotFoundException("Invalid Request");
    }

    @Override
    @Transactional
    public AuthenticationResponse register(RegisterRequest registerRequest) {
        User user = User.builder()
                .firstName(registerRequest.getFirstName())
                .lastName(registerRequest.getLastName())
                .username(registerRequest.getUsername())
                .password(registerRequest.getPassword())
                .email(registerRequest.getEmail())
                .phone(registerRequest.getPhone())
                .gender(false)
                .active(true)
                .loyaltyPoints(BigDecimal.ZERO)
                .build();

        Role role = roleRepo.findByRoleCode(registerRequest.getRole()).get(); // role_customer
        UserPermission permission = UserPermission
                .builder()
                .user(user)
                .role(role)
                .build();
        user.setPermissions(List.of(permission));

        User createdUser = userService.save(user);

        String jwtToken = jwtService.generateToken(createdUser);

        revokeAllUserToken(createdUser);
        saveUserToken(createdUser, jwtToken);

        return AuthenticationResponse
                .builder()
                .token(jwtToken)
                .build();
    }

    @Override
    @Transactional
    public String forgot(ForgotRequest forgotRequest) {
        String email = forgotRequest.getEmail();
        String from = env.getProperty("spring.mail.username");
        User foundUser = userRepo.findByEmail(email).get();

        int pwdLength = 7;
        String newPwd = generateRandomPassword(pwdLength);
        foundUser.setPassword(encoder.encode(newPwd));

        EmailMessage emailMessage = EmailMessage
                .builder()
                .from(from)
                .to(email)
                .subject("RESET PASSWORD - BUS TICKET BOOKING")
                .text("NEW PASSWORD: %s, please change after login!".formatted(newPwd))
                .build();

        mailService.send(emailMessage);
        return String.format("Kiểm tra email <%s> để lấy mật khẩu mới", email);
    }

    @Override
    @Transactional
    public String changePwd(ChangePwdRequest pwdRequest) {
        User user = userService.findByUsername(pwdRequest.getUsername());
        user.setPassword(encoder.encode(pwdRequest.getNewPassword()));
        return "Đổi mật khẩu thành công!";
    }

    @Override
    public Boolean checkExistUsername(String username) {
        return userRepo.findByUsername(username).isPresent();
    }

    @Override
    public Boolean checkExistEmail(String email) {
        return userRepo.findByEmail(email).isPresent();
    }

    @Override
    public Boolean checkExistPhone(String phone) {
        return userRepo.findByPhone(phone).isPresent();
    }

    @Override
    public Boolean checkActiveStatus(String username) {
        Optional<User> optionalUser = userRepo.findByUsername(username);
        return optionalUser.isPresent() && optionalUser.get().getActive();
    }

    private void revokeAllUserToken(User user) {
        var validTokens = tokenRepo.findAllValidTokenByUsername(user.getUsername());

        if (validTokens.isEmpty()) return;

        validTokens.forEach(t -> {
            t.setExpired(true);
            t.setRevoked(true);
        });

        tokenRepo.saveAll(validTokens);
    }

    private void saveUserToken(User user, String jwtToken) {
        Token token = Token.builder()
                .user(user)
                .token(jwtToken)
                .tokenType(TokenType.BEARER)
                .expired(false)
                .revoked(false)
                .build();

        tokenRepo.save(token);
    }

    private String generateRandomPassword(int pwdLength) {
        String uppercaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowercaseLetters = "abcdefghijklmnopqrstuvwxyz";
        String numbers = "0123456789";
        String allowedChars = uppercaseLetters + lowercaseLetters + numbers;

        Random random = new Random();
        StringBuilder password = new StringBuilder(pwdLength);

        for (int i = 0; i < pwdLength; i++) {
            int randomIndex = random.nextInt(allowedChars.length());
            char randomChar = allowedChars.charAt(randomIndex);
            password.append(randomChar);
        }

        return password.toString();
    }
}