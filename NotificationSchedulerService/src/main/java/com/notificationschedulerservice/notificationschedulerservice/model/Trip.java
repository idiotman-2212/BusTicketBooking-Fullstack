package com.notificationschedulerservice.notificationschedulerservice.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(uniqueConstraints = {
        @UniqueConstraint(name = "UK_trip_fields", columnNames = {
                "driver_id", "coach_id", "source_id", "dest_id", "departureDateTime"
        })
})
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class Trip {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    @ManyToOne
    @JoinColumn(name = "driver_id")
    Driver driver;

    @ManyToOne
    @JoinColumn(name = "coach_id")
    Coach coach;

    @ManyToOne
    @JoinColumn(name = "source_id")
    Province source;

    @ManyToOne
    @JoinColumn(name = "dest_id")
    Province destination;

    @ManyToOne
    @JoinColumn(name = "pick_up_location_id")
    Location pickUpLocation;

    @ManyToOne
    @JoinColumn(name = "drop_off_location_id")
    Location dropOffLocation;

    @ManyToOne
    @JoinColumn(name = "discount_id")
    Discount discount;

    @Min(value = 0, message = "Price should be positive")
    BigDecimal price;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm")
    LocalDateTime departureDateTime;

    Double duration;

    @OneToMany(mappedBy = "trip")
    @JsonIgnore
    List<Booking> bookings;

    Boolean completed = false;

    @OneToMany(mappedBy = "trip", cascade = CascadeType.ALL)
    @JsonIgnore
    List<Notification> notifications = new ArrayList<>();

    @OneToMany(mappedBy = "trip", cascade = CascadeType.ALL)
    @JsonIgnore
    List<Review> reviews = new ArrayList<>();

    @OneToMany(mappedBy = "trip", cascade = CascadeType.ALL)
    @JsonIgnore
    List<TripLog> tripLogs;
}
