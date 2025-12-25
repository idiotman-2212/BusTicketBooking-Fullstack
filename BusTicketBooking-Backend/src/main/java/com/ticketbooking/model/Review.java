package com.ticketbooking.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "review")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class Review implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

    @ManyToOne
    @JoinColumn(name = "trip_id")
     Trip trip;

    @ManyToOne
    @JoinColumn(name = "username")
     User user;

    @Column(name = "driver_rating")
     Integer driverRating;

    @Column(name = "coach_rating")
     Integer coachRating;

    @Column(name = "trip_rating")
     Integer tripRating;

    @Column(name = "comment")
     String comment;

    @Column(name = "created_at")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
     LocalDateTime createdAt;

}