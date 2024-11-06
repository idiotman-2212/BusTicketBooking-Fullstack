package com.notificationschedulerservice.notificationschedulerservice.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(uniqueConstraints = {
        @UniqueConstraint(name = "UK_user_role_screen", columnNames = {"username", "role_id", "screenCode"})
})
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class UserPermission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

     String screenCode; // mã màn hình trên giao diện, tự quy ước sau

    @ManyToOne
    @JoinColumn(name = "username")
    @JsonIgnore
     User user; // username

    @ManyToOne
    @JoinColumn(name = "role_id")
     Role role;
}
