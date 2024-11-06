package com.notificationschedulerservice.notificationschedulerservice.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.time.LocalDate;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class Driver {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

     String firstName;

     String lastName;

    @Column(unique = true)
     String email;

    @Column(unique = true)
     String phone;

    @JsonFormat(pattern = "yyyy-MM-dd")
     LocalDate dob;

     Boolean gender;

     String address;

    @Column(unique = true)
     String licenseNumber;

     Boolean quit;

    @OneToMany(mappedBy = "driver")
    @JsonIgnore
     List<Trip> trips;

    public String getFullName() {
        return this.getFirstName().concat(" ").concat(this.getLastName());
    }
}
