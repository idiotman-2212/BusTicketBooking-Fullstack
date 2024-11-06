package com.notificationschedulerservice.notificationschedulerservice.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;
import lombok.experimental.FieldDefaults;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class User implements UserDetails {
    @Id
    String username;

    @NotEmpty(message = "Password should not be empty")
    String password;

    @NotEmpty(message = "First name should not be empty")
    String firstName;

    @NotEmpty(message = "Last name should not be empty")
    String lastName;

    @Column(unique = true)
    String email;

    @Column(unique = true)
    String phone;

    @JsonFormat(pattern = "yyyy-MM-dd")
    LocalDate dob;

    Boolean gender;

    String address;

    Boolean active;

    //Tích xu
    @Column(name = "loyalty_points", nullable = false, columnDefinition = "decimal(38,2) default 0")
    BigDecimal loyaltyPoints = BigDecimal.ZERO;

    @OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
    @JsonIgnore
    List<LoyaltyTransaction> loyaltyTransactions;

    @OneToMany(mappedBy = "user", cascade = {CascadeType.ALL}, orphanRemoval = true)
    @JsonIgnore
    List<Review> reviews = new ArrayList<>();

    public void addLoyaltyPoints(BigDecimal points) {
        this.loyaltyPoints = this.loyaltyPoints.add(points);
    }

    public void deductLoyaltyPoints(BigDecimal points) {
        if (this.loyaltyPoints.compareTo(points) < 0) {
            throw new IllegalArgumentException("Not enough loyalty points");
        }
        this.loyaltyPoints = this.loyaltyPoints.subtract(points);
    }

    public boolean hasEnoughPoints(BigDecimal points) {
        if (this.loyaltyPoints == null) {
            return false; // Hoặc xử lý khác tùy yêu cầu của hệ thống
        }
        return this.loyaltyPoints.compareTo(points) >= 0;
    }


    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    @JsonIgnore
    List<UserNotification> userNotifications = new ArrayList<>();

    @OneToMany(mappedBy = "sender", cascade = CascadeType.ALL)
    @JsonIgnore
    List<Notification> sentNotifications = new ArrayList<>();


    @OneToMany(mappedBy = "createdBy", cascade = CascadeType.ALL)
    @JsonIgnore
    List<TripLog> tripLogs = new ArrayList<>();

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
    List<UserPermission> permissions;

    @JsonIgnore
    @OneToMany(mappedBy = "user")
    List<Booking> bookings;

    @OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
    @JsonIgnore
    List<Token> tokens;

    @Override
    @JsonIgnore
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this
                .getPermissions()
                .stream()
                .map(role -> new SimpleGrantedAuthority(role.getRole().getRoleCode().name()))
                .collect(Collectors.toList());
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}
