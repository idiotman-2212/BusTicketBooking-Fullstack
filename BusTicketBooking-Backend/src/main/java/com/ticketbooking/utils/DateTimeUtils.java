package com.ticketbooking.utils;

import org.springframework.cglib.core.Local;

import java.time.LocalDate;
import java.time.YearMonth;
import java.time.temporal.ChronoUnit;
import java.time.temporal.WeekFields;
import java.util.List;
import java.util.Locale;
import java.util.stream.IntStream;

public class DateTimeUtils {

    public static long getTotalMonthBetween(LocalDate startDate, LocalDate endDate) {
        long monthCount = ChronoUnit.MONTHS.between(YearMonth.from(startDate), YearMonth.from(endDate.plusMonths(1)));
        return monthCount;
    }

    public static int getTotalDaysInMonthOfYear(LocalDate date) {
        YearMonth yearMonth = YearMonth.of(date.getYear(), date.getMonthValue());
        return yearMonth.lengthOfMonth();
    }

    public static LocalDate getFirstDayOfWeek(LocalDate date) {
        LocalDate firstDayOfWeek = date.with(WeekFields.of(new Locale("vi", "VN")).getFirstDayOfWeek());

        return firstDayOfWeek;
    }

    public static LocalDate getLastDayOfWeek(LocalDate date) {
        LocalDate lastDayOfWeek = getFirstDayOfWeek(date).plusDays(6);
        return lastDayOfWeek;
    }

    public static List<LocalDate> getAllDaysOfTheWeek(LocalDate firstDayOfWeek) {
        return IntStream
                .rangeClosed(0, 6)
                .mapToObj(i -> firstDayOfWeek.plusDays(i))
                .toList();
    }
}
