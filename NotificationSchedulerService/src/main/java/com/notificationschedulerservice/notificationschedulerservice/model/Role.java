package com.notificationschedulerservice.notificationschedulerservice.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.notificationschedulerservice.notificationschedulerservice.model.enumType.RoleCode;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

    @Enumerated(EnumType.STRING)
    RoleCode roleCode;

     String roleName;

     String description;

    @OneToMany(mappedBy = "role")
    @JsonIgnore
     List<UserPermission> permissions;

}
