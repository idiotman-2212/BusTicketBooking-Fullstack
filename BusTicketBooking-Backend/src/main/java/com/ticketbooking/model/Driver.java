package com.ticketbooking.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.ticketbooking.utils.AppConstants;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Pattern;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class Driver implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

     String firstName;

     String lastName;

    @Column(unique = true)
    @Email(regexp = AppConstants.EMAIL_REGEX_PATTERN, message = "Invalid email")
     String email;

    @Column(unique = true)
    @Pattern(regexp = AppConstants.PHONE_REGEX_PATTERN, message = "Invalid phone")
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
