package com.ticketbooking.service;

import com.ticketbooking.dto.*;

public interface AuthenticationService {

    AuthenticationResponse login(AuthenticationRequest authRequest);

    AuthenticationResponse register(RegisterRequest registerRequest);

    String forgot(ForgotRequest forgotRequest);

    String changePwd(ChangePwdRequest pwdRequest);

    Boolean checkExistUsername(String username);

    Boolean checkExistEmail(String email);

    Boolean checkExistPhone(String phone);

    Boolean checkActiveStatus(String username);
}
