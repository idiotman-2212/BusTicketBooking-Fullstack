package com.ticketbooking.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.ticketbooking.model.enumType.RecipientType;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class  Notification implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

    String title;

    @Column(columnDefinition = "TEXT")
    String message;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    LocalDateTime sendDateTime;

    @ManyToOne
    @JoinColumn(name = "sender_username")
     User sender;

    @Enumerated(EnumType.STRING)
     RecipientType recipientType;

     String recipientIdentifiers;

    @ManyToOne
    @JoinColumn(name = "trip_id")
     Trip trip;

    @OneToMany(mappedBy = "notification", cascade = CascadeType.ALL)
    @JsonIgnore
    private List<UserNotification> userNotifications = new ArrayList<>();

}

