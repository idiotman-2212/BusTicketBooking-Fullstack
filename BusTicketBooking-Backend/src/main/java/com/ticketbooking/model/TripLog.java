package com.ticketbooking.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ticketbooking.model.Trip;
import com.ticketbooking.model.User;
import com.ticketbooking.model.enumType.LogType;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "trip_log")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class TripLog implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

    @ManyToOne
    @JoinColumn(name = "trip_id")
     Trip trip;

    @ManyToOne
    @JoinColumn(name = "created_by")
    User createdBy;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
     LocalDateTime logTime;

    @Enumerated(EnumType.STRING)
    @Column(name = "log_type", nullable = false)
    LogType logType;

    @Column(name = "description")
     String description;

    @Column(name = "location")
     String location;
}
