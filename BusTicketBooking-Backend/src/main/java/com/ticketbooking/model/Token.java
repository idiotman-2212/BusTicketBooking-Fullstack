package com.ticketbooking.model;

import com.ticketbooking.model.enumType.TokenType;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class Token implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

     String token;

    @Enumerated(EnumType.STRING)
     TokenType tokenType;

     boolean expired;

     boolean revoked;

    @ManyToOne
    @JoinColumn(name = "username")
     User user;
}
