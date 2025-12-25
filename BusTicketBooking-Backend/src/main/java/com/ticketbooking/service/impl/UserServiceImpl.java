package com.ticketbooking.service.impl;

import com.ticketbooking.dto.PageResponse;
import com.ticketbooking.dto.PermissionDto;
import com.ticketbooking.dto.ScreenPermissionDto;
import com.ticketbooking.exception.ExistingResourceException;
import com.ticketbooking.exception.ResourceNotFoundException;
import com.ticketbooking.model.Role;
import com.ticketbooking.model.User;
import com.ticketbooking.model.UserPermission;
import com.ticketbooking.model.enumType.RoleCode;
import com.ticketbooking.repo.RoleRepo;
import com.ticketbooking.repo.UserPermissionRepo;
import com.ticketbooking.repo.UserRepo;
import com.ticketbooking.repo.UtilRepo;
import com.ticketbooking.service.UserService;
import com.ticketbooking.validator.ObjectValidator;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final PasswordEncoder passwordEncoder;
    private final UserRepo userRepo;
    private final UtilRepo utilRepo;
    private final ObjectValidator<User> userValidator;
    private final UserPermissionRepo permissionRepo;
    private final RoleRepo roleRepo;

    @Override
    public User findByUsername(String username) {
        return userRepo.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("Not found User<%s>".formatted(username)));
    }

    @Override
    @Cacheable(cacheNames = "users_list")
    public List<User> findAll() {
        return userRepo.findAll();
    }

    @Override
    @Cacheable(cacheNames = {"users_paging"}, key = "{#page, #limit}")
    public PageResponse<User> findAll(Integer page, Integer limit) {
        Page<User> pageSlice = userRepo.findAll(PageRequest.of(page, limit));
        PageResponse<User> pageResponse = new PageResponse<>();
        pageResponse.setDataList(pageSlice.getContent());
        pageResponse.setPageCount(pageSlice.getTotalPages());
        pageResponse.setTotalElements(pageSlice.getTotalElements());
        return pageResponse;
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"users", "users_paging"}, allEntries = true)
    public User save(User user) {
        userValidator.validate(user);
        if (!checkDuplicateUserInfo("ADD", user.getUsername(), "username", user.getUsername())) {
            throw new ExistingResourceException("Username<%s> is already exist".formatted(user.getUsername()));
        }

        if (!checkDuplicateUserInfo("ADD", user.getUsername(), "email", user.getEmail())) {
            throw new ExistingResourceException("Email<%s> is already exist".formatted(user.getEmail()));
        }

        if (!checkDuplicateUserInfo("ADD", user.getUsername(), "phone", user.getPhone())) {
            throw new ExistingResourceException("Phone<%s> is already exist".formatted(user.getPhone()));
        }
        String encodedPwd = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPwd);
        User createdUser = userRepo.save(user);

        Role role;
        if (user.getPermissions() == null || user.getPermissions().isEmpty()) {
            role = roleRepo.findByRoleCode(RoleCode.ROLE_STAFF).get();
        } else
            role = roleRepo.findByRoleCode(user.getPermissions().get(0).getRole().getRoleCode()).get(); // role Customer
        UserPermission permission = UserPermission
                .builder()
                .user(createdUser)
                .role(role)
                .build();

        createdUser.setPermissions(List.of(permissionRepo.save(permission)));
        return createdUser;
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"users", "users_paging"}, allEntries = true)
    public User update(User user) {
        userValidator.validate(user);
        if (!checkDuplicateUserInfo("EDIT", user.getUsername(), "email", user.getEmail())) {
            throw new ExistingResourceException("Email<%s> is already exist".formatted(user.getEmail()));
        }
        if (!checkDuplicateUserInfo("EDIT", user.getUsername(), "phone", user.getPhone())) {
            throw new ExistingResourceException("Phone<%s> is already exist".formatted(user.getPhone()));
        }
        return userRepo.save(user);
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = {"users", "users_paging"}, allEntries = true)
    public String delete(String username) {
        User foundUser = findByUsername(username);

        if (!foundUser.getBookings().isEmpty())
            throw new ExistingResourceException("User<%s> has booked some tickets, can't be deleted".formatted(username));
        userRepo.deleteByUsername(username);
        return "Delete User<%s> successfully".formatted(username);
    }

    @Override
    public Boolean checkDuplicateUserInfo(String mode, String username, String field, String value) {
        List<User> foundUsers = utilRepo.checkDuplicateByStringField(User.class, mode, "username",
                username, field, value);
        return foundUsers.isEmpty();
    }

    @Override
    public PermissionDto getUserPermission(String username) {
        var user = userRepo.findByUsername(username).get();
        List<UserPermission> permissionsResult = permissionRepo.findAllByUser(user);
        Map<String, List<String>> permissions = transformRoles(permissionsResult);
        return PermissionDto.builder().permission(permissions).build();
    }

    @Override
    @Transactional
    @CacheEvict(cacheNames = "user_permissions", key = "#screenPermissionDto.username")
    public PermissionDto updateUserScreenPermission(ScreenPermissionDto screenPermissionDto) {
        User user = userRepo.findByUsername(screenPermissionDto.getUsername()).get();
        // delete old crud roles not in main roles
        permissionRepo.deleteOldUserCrudRoles(screenPermissionDto.getScreen(), user.getUsername());

        List<UserPermission> permissionsResult;
        if (screenPermissionDto.getRoles().isEmpty()) { // delete all CRUD roles
            permissionsResult = permissionRepo.findAllByUser(user); // get only main role [admin, staff, customer]
        } else {
            List<UserPermission> upList = new ArrayList<>();
            screenPermissionDto.getRoles().forEach(roleCode -> {
                Role role = roleRepo.findByRoleCode(roleCode).get();
                UserPermission up = UserPermission.builder()
                        .user(user)
                        .role(role)
                        .screenCode(screenPermissionDto.getScreen())
                        .build();
                upList.add(up);
            });
            permissionsResult = permissionRepo.saveAll(upList);
        }
        Map<String, List<String>> permissions = transformRoles(permissionsResult);
        return PermissionDto.builder().permission(permissions).build();
    }

    public Map<String, List<String>> transformRoles(List<UserPermission> permissionsResult) {
        // key: ROLE_, value: screen_code
        Map<String, List<String>> permissions = new HashMap<>();
        for (UserPermission role : permissionsResult) {
            String roleKey = role.getRole().getRoleCode().name();
            if (!permissions.containsKey(roleKey)) {
                List<String> screenList = new ArrayList<>();
                screenList.add(role.getScreenCode());
                permissions.put(roleKey, screenList);
            } else {
                var oldScreens = permissions.get(roleKey);
                oldScreens.add(role.getScreenCode());
                permissions.put(roleKey, oldScreens);
            }
        }
        return permissions;
    }
}