package com.ticketbooking.model;

import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

import java.io.Serializable;

@Entity
@Table(name = "location")
@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE, makeFinal = false)
public class Location implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
     Long id;

    @Column(nullable = false)
     String address;

     String ward;
     String district;

    @Column(name = "is_active", nullable = false, columnDefinition = "boolean default false")
    Boolean isActive = true;

    @ManyToOne
    @JoinColumn(name = "province_id")
     Province province;

    @Transient
    public String getName() {
        return this.address + (ward != null ? ", " + this.ward : "") +
                (district != null ? ", " + this.district : "") +
                (province != null ? ", " + this.province.getName() : "");
    }
}
