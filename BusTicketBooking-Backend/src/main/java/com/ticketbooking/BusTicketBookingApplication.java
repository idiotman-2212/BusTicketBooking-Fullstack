package com.ticketbooking;

import com.ticketbooking.model.*;
import com.ticketbooking.model.enumType.BookingType;
import com.ticketbooking.model.enumType.CoachType;
import com.ticketbooking.model.enumType.PaymentMethod;
import com.ticketbooking.model.enumType.PaymentStatus;
import com.ticketbooking.repo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;

@SpringBootApplication
//@EnableCaching
@EnableScheduling
public class BusTicketBookingApplication implements CommandLineRunner {

    @Autowired
    UserRepo userRepo;

    @Autowired
    CoachRepo coachRepo;

    @Autowired
    DiscountRepo discountRepo;

    @Autowired
    DriverRepo driverRepo;

    @Autowired
    TripRepo tripRepo;

    @Autowired
    ProvinceRepo provinceRepo;

    @Autowired
    BookingRepo bookingRepo;

    public static void main(String[] args) {
        SpringApplication.run(BusTicketBookingApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
//        createUsers();
//        createBuses();
//        createDiscounts();
//        createDriver();
//        createTrips();
//        createBookings();
    }

    private void createUsers() {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        var users = new ArrayList<User>();
        for (int i = 1; i <= 20; i++) {
            users.add(
                    User.builder().username("user" + i).password(passwordEncoder.encode("123456")).firstName("Mr").lastName("User " + i)
                            .email("user" + i + "@gmail.com").dob(LocalDate.of(2002, 1, 1))
                            .gender(false).address("blabla").active(true).loyaltyPoints(BigDecimal.valueOf(0)).build()
            );
        }
        users.add(User.builder().username("admin").password(passwordEncoder.encode("123456")).firstName("Admin").lastName("Admin")
                .email("dienchau45@gmail.com").phone("0326917158").dob(LocalDate.of(2002, 2, 22))
                .gender(true).address("blabla").active(true).loyaltyPoints(BigDecimal.valueOf(0)).build());
        userRepo.saveAll(users);
    }

    private void createBuses() {
        int[] seats = {22, 29, 34, 40};
        var coaches = new ArrayList<Coach>();
        for (int i = 1; i <= 5; i++) {
            coaches.add(Coach.builder()
                    .name("Bus no." + i)
                    .capacity(seats[(int) (Math.round(Math.random() * 3))])
                    .licensePlate("77-C1 %d".formatted((int) ((Math.random() * (54321 - 12345) + 12345))))
                    .coachType(CoachType.BED)
                    .build());
        }
        for (int i = 6; i <= 10; i++) {
            coaches.add(Coach.builder()
                    .name("Bus no." + i)
                    .capacity(seats[(int) (Math.round(Math.random() * 3))])
                    .licensePlate("77-C1 %d".formatted((int) ((Math.random() * (54321 - 12345) + 12345))))
                    .coachType(CoachType.CHAIR)
                    .build());
        }
        for (int i = 11; i <= 20; i++) {
            coaches.add(Coach.builder()
                    .name("Bus no." + i)
                    .capacity(seats[(int) (Math.round(Math.random() * 3))])
                    .licensePlate("77-C1 %d".formatted((int) ((Math.random() * (54321 - 12345) + 12345))))
                    .coachType(CoachType.LIMOUSINE)
                    .build());
        }
        coachRepo.saveAll(coaches);
    }

    private void createDiscounts() {
        var discounts = new ArrayList<Discount>();
        for (int i = 1; i <= 20; i++) {
            discounts.add(Discount.builder()
                    .code("DISCOUNT-CODE-%d".formatted(i))
                    .amount(BigDecimal.valueOf(Math.random() * 10_000))
                    .startDateTime(LocalDateTime.now(ZoneId.of("Asia/Ho_Chi_Minh")))
                    .endDateTime(LocalDateTime.now(ZoneId.of("Asia/Ho_Chi_Minh")).plusDays(i))
                    .description("blabla")
                    .build());
        }
        discountRepo.saveAll(discounts);
    }

    private void createDriver() {
        var drivers = new ArrayList<Driver>();
        for (int i = 1; i <= 20; i++) {
            drivers.add(
                    Driver.builder()
                            .firstName("Driver")
                            .lastName("No.%d".formatted(i))
                            .email("driver%d@gmail.com".formatted(i))
                            .dob(LocalDate.of(2002, 1, 1))
                            .gender(false)
                            .address("Bình Định")
                            .licenseNumber("LICENSE NO.%d".formatted(i))
                            .quit(false)
                            .build()
            );
        }
        driverRepo.saveAll(drivers);
    }

    private void createTrips() {
        var trips = new ArrayList<Trip>();
        for (int i=1; i <= 3; i++) {
            trips.add(
                    Trip.builder()
                            .driver(driverRepo.findById(1L).get())
                            .coach(coachRepo.findById(1L).get())
                            .source(provinceRepo.findById(50L).get()) // hcm
                            .destination(provinceRepo.findById(38L).get()) // ninh thuan
                            .departureDateTime(LocalDateTime.of(2023, 8, 15, 5 + i, 0))
                            .build()
            );
        }
//        for (int i=1; i <= 3; i++) {
//            trips.add(
//                    Trip.builder()
//                            .driver(driverRepo.findById(3L).get())
//                            .coach(coachRepo.findById(10L).get())
//                            .source(provinceRepo.findById(146L).get()) // hcm
//                            .destination(provinceRepo.findById(97L).get()) // ha noi
//                            .departureTime(LocalTime.of(18 + i, 0))
//                            .build()
//            );
//        }

        tripRepo.saveAll(trips);
    }

    private void createBookings() {
        var bookings = new ArrayList<Booking>();
        bookings.add(Booking.builder()
                .user(userRepo.findByUsername("hoangphu").get())
                .trip(tripRepo.findById(1L).get())
                .bookingDateTime(LocalDateTime.now(ZoneId.of("Asia/Ho_Chi_Minh")))
                .seatNumber("2A")
                .bookingType(BookingType.ONEWAY)
                //.pickUpAddress("Nhà xe ngã tư TĐ")
                .phone("0914683078")
                .totalPayment(BigDecimal.valueOf(150000))
                .paymentDateTime(LocalDateTime.now(ZoneId.of("Asia/Ho_Chi_Minh")))
                .paymentMethod(PaymentMethod.CASH)
                .paymentStatus(PaymentStatus.UNPAID)
                .build());
        bookingRepo.saveAll(bookings);
    }
}