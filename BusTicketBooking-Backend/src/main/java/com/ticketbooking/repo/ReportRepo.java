package com.ticketbooking.repo;

import com.ticketbooking.dto.*;
import com.ticketbooking.model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ReportRepo extends JpaRepository<Booking, Long> {

    @Query(value = """
                select new com.ticketbooking.dto.YearRevenueDto(year(b.paymentDateTime), sum(b.totalPayment))
                from Booking b
                where year(b.paymentDateTime) between :startYear and :endYear and b.paymentStatus='PAID'
                group by year(b.paymentDateTime)
            """)
    List<YearRevenueDto> getYearTotalRevenue(@Param("startYear") Integer startYear, @Param("endYear") Integer endYear);

    @Query(value = """
            select new com.ticketbooking.dto.MonthRevenueDto(year(b.paymentDateTime), month(b.paymentDateTime), sum(b.totalPayment))
            from Booking b
            where date(b.paymentDateTime) between :startDate and :endDate and b.paymentStatus='PAID'
            group by year(b.paymentDateTime), month(b.paymentDateTime)
            """)
    List<MonthRevenueDto> getMonthTotalRevenue(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    @Query(value = """
            select new com.ticketbooking.dto.WeekRevenueDto(year(b.paymentDateTime), month(b.paymentDateTime),
             day(b.paymentDateTime), sum(b.totalPayment))
            from Booking b
            where date(b.paymentDateTime) between :startDate and :endDate and b.paymentStatus='PAID'
            group by year(b.paymentDateTime), month(b.paymentDateTime), day(b.paymentDateTime)
            """)
    List<WeekRevenueDto> getWeekTotalRevenue(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    @Query(value = """
            select new com.ticketbooking.dto.CoachUsageDto(b.trip.coach.coachType, count(b.trip.coach.coachType))
            from Booking b
            where date(b.bookingDateTime) between :startDate and :endDate and b.paymentStatus='PAID'
            group by b.trip.coach.coachType
            """)
    List<CoachUsageDto> getCoachUsage(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);


    @Query(value = """
    select new com.ticketbooking.dto.TopRouteDto(concat(b.trip.source.name, ' - ', b.trip.destination.name), count(b.trip.id))
    from Booking b
    where date(b.bookingDateTime) between :startDate and :endDate and b.paymentStatus='PAID'
    group by concat(b.trip.source.name, ' - ', b.trip.destination.name)
    order by count(b.trip.id) desc
    limit 5
""")
    List<TopRouteDto> getTopRoute(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);


    // Truy vấn báo cáo theo tuần
    @Query("""
    select new com.ticketbooking.dto.WeeklyPointsReportDto(year(t.transactionDate), week(t.transactionDate),
        sum(case when t.transactionType = 'EARN' then t.amount else 0 end),
        sum(case when t.transactionType = 'USE' then t.amount else 0 end))
    from LoyaltyTransaction t
    where t.user.username = :username and t.transactionDate between :startDate and :endDate
    group by year(t.transactionDate), week(t.transactionDate)
""")
    List<WeeklyPointsReportDto> getWeeklyPointsReport(@Param("username") String username,
                                                      @Param("startDate") LocalDateTime startDate,
                                                      @Param("endDate") LocalDateTime endDate);

    // Truy vấn báo cáo theo tháng
    @Query("""
        select new com.ticketbooking.dto.MonthlyPointsReportDto(year(t.transactionDate), month(t.transactionDate),
            sum(case when t.transactionType = 'EARN' then t.amount else 0 end),
            sum(case when t.transactionType = 'USE' then t.amount else 0 end))
        from LoyaltyTransaction t
        where t.user.username = :username and t.transactionDate between :startDate and :endDate
        group by year(t.transactionDate), month(t.transactionDate)
    """)
    List<MonthlyPointsReportDto> getMonthlyPointsReport(@Param("username") String username,
                                                        @Param("startDate") LocalDateTime startDate,
                                                        @Param("endDate") LocalDateTime endDate);

    // Truy vấn báo cáo theo năm
    @Query("""
        select new com.ticketbooking.dto.YearlyPointsReportDto(year(t.transactionDate),
            sum(case when t.transactionType = 'EARN' then t.amount else 0 end),
            sum(case when t.transactionType = 'USE' then t.amount else 0 end))
        from LoyaltyTransaction t
        where t.user.username = :username and t.transactionDate between :startDate and :endDate
        group by year(t.transactionDate)
    """)
    List<YearlyPointsReportDto> getYearlyPointsReport(@Param("username") String username,
                                                      @Param("startDate") LocalDateTime startDate,
                                                      @Param("endDate") LocalDateTime endDate);

}