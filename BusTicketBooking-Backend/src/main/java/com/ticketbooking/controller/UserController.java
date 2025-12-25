package com.ticketbooking.controller;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.dto.PermissionDto;
import com.ticketbooking.dto.ScreenPermissionDto;
import com.ticketbooking.model.User;
import com.ticketbooking.service.UserService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/v1/users")
@Tag(name = "User Controller")
public class UserController {

    private final UserService userService;

    @GetMapping("/all")
    public List<User> getAllUsers() {
        return userService.findAll();
    }

    @GetMapping("/paging")
    public PageResponse<User> getPageOfUsers(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "5") Integer limit) {
        return userService.findAll(page, limit);
    }

    @GetMapping("/{username}")
    public ResponseEntity<User> getUser(@PathVariable String username) {
        return ResponseEntity
                .status(200)
                .body(userService.findByUsername(username));
    }

    @GetMapping("/permission/{username}")
    public PermissionDto getUserPermission(@PathVariable String username) {
        return userService.getUserPermission(username);
    }

    @PostMapping("/permission")
    public PermissionDto updateUserScreenPermission(@RequestBody ScreenPermissionDto screenPermissionDto) {
        return userService.updateUserScreenPermission(screenPermissionDto);
    }

    @PostMapping
    public ResponseEntity<User> createUser(@RequestBody User user) {
        return ResponseEntity
                .status(201)
                .body(userService.save(user));
    }

    @PutMapping
    public ResponseEntity<User> updateUser(@RequestBody User user) {
        return ResponseEntity
                .status(200)
                .body(userService.update(user));
    }

    @DeleteMapping("/{username}")
    public ResponseEntity<?> deleteUser(@PathVariable String username) {
        return ResponseEntity
                .status(200)
                .body(userService.delete(username));
    }

    @GetMapping("/checkDuplicate/{mode}/{username}/{field}/{value}")
    public ResponseEntity<?> checkDuplicateUserInfo(
            @PathVariable String mode,
            @PathVariable String username,
            @PathVariable String field,
            @PathVariable String value
    ) {
        return ResponseEntity.ok(userService.checkDuplicateUserInfo(mode, username, field, value));
    }
}
