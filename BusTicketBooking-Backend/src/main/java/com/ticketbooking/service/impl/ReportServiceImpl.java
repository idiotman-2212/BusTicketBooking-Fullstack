package com.ticketbooking.service.impl;

import com.ticketbooking.dto.*;
import com.ticketbooking.repo.ReportRepo;
import com.ticketbooking.service.ReportService;
import com.ticketbooking.utils.AppConstants;
import com.ticketbooking.utils.DateTimeUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.WeekFields;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ReportServiceImpl implements ReportService {
    private final ReportRepo reportRepo;

    @Override
    public ReportResponse getTotalRevenue(String startDate, String endDate, String timeOption) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startLocalDate, endLocalDate;

        if (startDate == null || startDate.isEmpty())
            startLocalDate = LocalDate.now();
        else startLocalDate = LocalDate.parse(startDate, formatter);

        if (endDate == null || endDate.isEmpty())
            endLocalDate = LocalDate.now();
        else endLocalDate = LocalDate.parse(endDate, formatter);

        return createRevenueReport(startLocalDate, endLocalDate, timeOption);
    }

    @Override
    public ReportResponse getWeekTotalRevenueOfCurrentDate(String currentDate) {
        LocalDate currDate;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        if (currentDate == null || currentDate.isEmpty()) {
            currDate = LocalDate.now();
        } else currDate = LocalDate.parse(currentDate, formatter);

        LocalDate firstDateOfWeek = DateTimeUtils.getFirstDayOfWeek(currDate);
        LocalDate lastDateOfWeek = DateTimeUtils.getLastDayOfWeek(currDate);

        return createRevenueReport(firstDateOfWeek, lastDateOfWeek, "WEEK");
    }

    @Override
    public ReportResponse getCoachUsage(String startDate, String endDate, String timeOption) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startLocalDate, endLocalDate;

        if (startDate == null || startDate.isEmpty())
            startLocalDate = LocalDate.now();
        else startLocalDate = LocalDate.parse(startDate, formatter);

        if (endDate == null || endDate.isEmpty())
            endLocalDate = LocalDate.now();
        else endLocalDate = LocalDate.parse(endDate, formatter);
        return createUsageReport(startLocalDate, endLocalDate, timeOption);
    }

    @Override
    public ReportResponse getTopRoute(String startDate, String endDate, String timeOption) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startLocalDate, endLocalDate;

        if (startDate == null || startDate.isEmpty())
            startLocalDate = LocalDate.now();
        else startLocalDate = LocalDate.parse(startDate, formatter);

        if (endDate == null || endDate.isEmpty())
            endLocalDate = LocalDate.now();
        else endLocalDate = LocalDate.parse(endDate, formatter);
        return createTopRouteReport(startLocalDate, endLocalDate, timeOption);
    }

    private ReportResponse createTopRouteReport(LocalDate startLocalDate, LocalDate endLocalDate, String timeOption) {
        ReportResponse reportResponse = new ReportResponse();
        switch (timeOption.trim().toUpperCase()) {
            case "DAY": {
                List<TopRouteDto> topRouteDtoList = reportRepo.getTopRoute(startLocalDate, startLocalDate);
                Map<String, Long> topRoutes = new LinkedHashMap<>();
                topRouteDtoList.forEach(topRouteDto ->
                        topRoutes.put(topRouteDto.getRoute(), topRouteDto.getCount()));
                reportResponse.setReportData(topRoutes);
                break;
            }
            case "WEEK": {
                LocalDate start = DateTimeUtils.getFirstDayOfWeek(startLocalDate);
                LocalDate end = DateTimeUtils.getLastDayOfWeek(endLocalDate);
                List<TopRouteDto> topRouteDtoList = reportRepo.getTopRoute(start, end);
                Map<String, Long> topRoutes = new LinkedHashMap<>();
                topRouteDtoList.forEach(topRouteDto ->
                        topRoutes.put(topRouteDto.getRoute(), topRouteDto.getCount()));
                reportResponse.setReportData(topRoutes);
                break;
            }
            case "MONTH": {
                LocalDate start = LocalDate.of(startLocalDate.getYear(), startLocalDate.getMonthValue(), 1);
                LocalDate end = LocalDate.of(endLocalDate.getYear(),
                        endLocalDate.getMonthValue(),
                        DateTimeUtils.getTotalDaysInMonthOfYear(endLocalDate));
                List<TopRouteDto> topRouteDtoList = reportRepo.getTopRoute(start, end);
                Map<String, Long> topRoutes = new LinkedHashMap<>();
                for (TopRouteDto topRouteDto : topRouteDtoList) {
                    topRoutes.put(
                            topRouteDto.getRoute(),
                            topRouteDto.getCount()
                    );
                }
                reportResponse.setReportData(topRoutes);
                break;
            }
            case "YEAR": {

                LocalDate start = LocalDate.of(startLocalDate.getYear(), 1, 1);
                LocalDate end = LocalDate.of(endLocalDate.getYear(), 12, 31);
                List<TopRouteDto> topRouteDtoList = reportRepo.getTopRoute(start, end);
                Map<String, Long> topRoutes = new LinkedHashMap<>();
                topRouteDtoList.forEach(topRouteDto ->
                        topRoutes.put(topRouteDto.getRoute(), topRouteDto.getCount()));
                reportResponse.setReportData(topRoutes);
                break;
            }
            default:
                break;
        }
        return reportResponse;
    }

    private ReportResponse createUsageReport(LocalDate startLocalDate, LocalDate endLocalDate, String timeOption) {
        ReportResponse reportResponse = new ReportResponse();
        List<CoachUsageDto> coachUsageDtoList;

        switch (timeOption.trim().toUpperCase()) {
            case "DAY": {
                coachUsageDtoList = reportRepo.getCoachUsage(startLocalDate, startLocalDate);
                break;
            }
            case "WEEK": {
                LocalDate start = DateTimeUtils.getFirstDayOfWeek(startLocalDate);
                LocalDate end = DateTimeUtils.getLastDayOfWeek(endLocalDate);
                coachUsageDtoList = reportRepo.getCoachUsage(start, end);
                break;
            }
            case "MONTH": {
                LocalDate start = LocalDate.of(startLocalDate.getYear(), startLocalDate.getMonthValue(), 1);
                LocalDate end = LocalDate.of(endLocalDate.getYear(),
                        endLocalDate.getMonthValue(),
                        DateTimeUtils.getTotalDaysInMonthOfYear(endLocalDate));
                coachUsageDtoList = reportRepo.getCoachUsage(start, end);
                break;
            }
            case "YEAR": {
                LocalDate start = LocalDate.of(startLocalDate.getYear(), 1, 1);
                LocalDate end = LocalDate.of(endLocalDate.getYear(), 12, 31);
                coachUsageDtoList = reportRepo.getCoachUsage(start, end);
                break;
            }
            default:
                coachUsageDtoList = null;
                break;
        }

        if (coachUsageDtoList != null) {
            Map<String, Long> usages = processCoachUsage(coachUsageDtoList);
            reportResponse.setReportData(usages);
        }
        return reportResponse;
    }


    private Long countCoachUsage(String coachLabel, List<CoachUsageDto> coachUsageDtoList) {
        return coachUsageDtoList
                .stream()
                .filter(coachUsage -> coachUsage.getCoachType().name().equals(coachLabel))
                .mapToLong(CoachUsageDto::getUsage)
                .sum();
    }

    private Map<String, Long> processCoachUsage(List<CoachUsageDto> coachUsageDtoList) {
        Map<String, Long> usages = new LinkedHashMap<>();
        String[] coachLabels = {"", "Bed", "Limousine", "Chair"};
        for (int i = 1; i <= 3; i++) {
            usages.put(
                    coachLabels[i],
                    countCoachUsage(coachLabels[i].toUpperCase(), coachUsageDtoList)
            );
        }
        return usages;
    }

    private ReportResponse createRevenueReport(LocalDate startLocalDate, LocalDate endLocalDate, String timeOption) {
        ReportResponse reportResponse = new ReportResponse();
        switch (timeOption.trim().toUpperCase()) {
            case "DAY": {
                break;
            }
            case "WEEK": {
                List<WeekRevenueDto> revenueDtoList = reportRepo.getWeekTotalRevenue(startLocalDate, endLocalDate);
                Map<String, BigDecimal> revenues = new LinkedHashMap<>();
                for (int i = 1; i <= 7; i++) {
                    revenues.put(
                            "%s (%d/%d)".formatted(AppConstants.WEEK_COLUMNS[i],
                                    startLocalDate.getDayOfMonth(), startLocalDate.getMonthValue()),
                            BigDecimal.valueOf(
                                    countTotalRevenueForWeek(startLocalDate, revenueDtoList)
                            )
                    );
                    startLocalDate = startLocalDate.plusDays(1);
                }
                reportResponse.setReportData(revenues);
                break;
            }
            case "MONTH": {
                // e.g: 2022/07/15 -> 2023/07/20, so we need to start from 2022/07/01 -> 2023/07/31
                LocalDate start = LocalDate.of(startLocalDate.getYear(), startLocalDate.getMonthValue(), 1);
                LocalDate end = LocalDate.of(endLocalDate.getYear(),
                        endLocalDate.getMonthValue(),
                        DateTimeUtils.getTotalDaysInMonthOfYear(endLocalDate));

                List<MonthRevenueDto> revenueDtoList = reportRepo.getMonthTotalRevenue(start, end);
                Map<String, BigDecimal> revenues = new LinkedHashMap<>();
                long totalMonthBetween = DateTimeUtils.getTotalMonthBetween(start, end);
                for (int i = 1; i <= totalMonthBetween; i++) {
                    revenues.put("%d/%d".formatted(start.getMonthValue(), start.getYear()),
                            BigDecimal.valueOf(
                                    countTotalRevenueForMonthYear(
                                            start.getMonthValue(),
                                            start.getYear(),
                                            revenueDtoList)
                            )
                    );
                    start = start.plusMonths(1);
                }
                reportResponse.setReportData(revenues);
                break;
            }
            case "YEAR": {
                int startYear = startLocalDate.getYear(), endYear = endLocalDate.getYear();
                List<YearRevenueDto> revenueDTOList = reportRepo.getYearTotalRevenue(startYear, endYear);
                Map<String, BigDecimal> revenues = new LinkedHashMap<>();
                for (int i = startYear; i <= endYear; i++) {
                    revenues.put(String.valueOf(i), BigDecimal.valueOf(countTotalRevenueForYear(i, revenueDTOList)));
                }
                reportResponse.setReportData(revenues);
                break;
            }
            default:
                break;
        }

        return reportResponse;
    }

    private Double countTotalRevenueForWeek(LocalDate date, List<WeekRevenueDto> revenueDtoList) {
        return revenueDtoList
                .stream()
                .filter(revenue -> revenue.getDay().equals(date.getDayOfMonth())
                        && revenue.getMonth().equals(date.getMonthValue())
                        && revenue.getYear().equals(date.getYear()))
                .mapToDouble(revenue -> revenue.getTotalRevenue().doubleValue())
                .sum();
    }

    private Double countTotalRevenueForMonthYear(int monthValue, int year, List<MonthRevenueDto> revenueDtoList) {
        return revenueDtoList
                .stream()
                .filter(revenue -> revenue.getMonth().equals(monthValue) && revenue.getYear().equals(year))
                .mapToDouble(revenue -> revenue.getTotalRevenue().doubleValue())
                .sum();
    }

    private Double countTotalRevenueForYear(int year, List<YearRevenueDto> revenueDTOList) {
        return revenueDTOList
                .stream()
                .filter(revenue -> revenue.getYear().equals(year))
                .mapToDouble(revenue -> revenue.getTotalRevenue().doubleValue())
                .sum();
    }

    // Lấy username của người dùng hiện tại
    private String getCurrentUsername() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            return ((UserDetails) principal).getUsername();
        } else {
            return principal.toString();
        }
    }

    @Override
    public ReportResponse getWeeklyPointsReport(String startDate, String endDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime startLocalDateTime = (startDate == null || startDate.isEmpty())
                ? LocalDateTime.now().minusWeeks(1)
                : LocalDate.parse(startDate, formatter).atStartOfDay();

        LocalDateTime endLocalDateTime = (endDate == null || endDate.isEmpty())
                ? LocalDateTime.now()
                : LocalDate.parse(endDate, formatter).atTime(23, 59, 59);

        String username = getCurrentUsername();
        List<WeeklyPointsReportDto> weeklyReport = reportRepo.getWeeklyPointsReport(username, startLocalDateTime, endLocalDateTime);

        return processWeeklyPointsReport(weeklyReport);
    }

    @Override
    public ReportResponse getMonthlyPointsReport(String startDate, String endDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime startLocalDateTime = (startDate == null || startDate.isEmpty())
                ? LocalDateTime.now().minusMonths(1)
                : LocalDate.parse(startDate, formatter).atStartOfDay();

        LocalDateTime endLocalDateTime = (endDate == null || endDate.isEmpty())
                ? LocalDateTime.now()
                : LocalDate.parse(endDate, formatter).atTime(23, 59, 59);

        String username = getCurrentUsername();
        List<MonthlyPointsReportDto> monthlyReport = reportRepo.getMonthlyPointsReport(username, startLocalDateTime, endLocalDateTime);

        return processMonthlyPointsReport(monthlyReport);
    }

    @Override
    public ReportResponse getYearlyPointsReport(String startDate, String endDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime startLocalDateTime = (startDate == null || startDate.isEmpty())
                ? LocalDateTime.now().minusYears(1)
                : LocalDate.parse(startDate, formatter).atStartOfDay();

        LocalDateTime endLocalDateTime = (endDate == null || endDate.isEmpty())
                ? LocalDateTime.now()
                : LocalDate.parse(endDate, formatter).atTime(23, 59, 59);

        String username = getCurrentUsername();
        List<YearlyPointsReportDto> yearlyReport = reportRepo.getYearlyPointsReport(username, startLocalDateTime, endLocalDateTime);

        return processYearlyPointsReport(yearlyReport);
    }


    // Phương thức xử lý báo cáo theo tuần
    private ReportResponse processWeeklyPointsReport(List<WeeklyPointsReportDto> weeklyReport) {
        Map<String, Map<String, Object>> reportData = new LinkedHashMap<>();
        weeklyReport.forEach(report -> {
            Map<String, Object> pointsData = new LinkedHashMap<>();
            pointsData.put("Points Earned", report.getPointsEarned());
            pointsData.put("Points Used", report.getPointsUsed());
            reportData.put("Week %d of %d".formatted(report.getWeek(), report.getYear()), pointsData);
        });

        ReportResponse response = new ReportResponse();
        response.setReportData(reportData);
        return response;
    }

    // Phương thức xử lý báo cáo theo tháng
    private ReportResponse processMonthlyPointsReport(List<MonthlyPointsReportDto> monthlyReport) {
        Map<String, Map<String, Object>> reportData = new LinkedHashMap<>();
        monthlyReport.forEach(report -> {
            Map<String, Object> pointsData = new LinkedHashMap<>();
            pointsData.put("Points Earned", report.getPointsEarned());
            pointsData.put("Points Used", report.getPointsUsed());
            reportData.put("%d/%02d".formatted(report.getYear(), report.getMonth()), pointsData);
        });

        ReportResponse response = new ReportResponse();
        response.setReportData(reportData);
        return response;
    }

    // Phương thức xử lý báo cáo theo năm
    private ReportResponse processYearlyPointsReport(List<YearlyPointsReportDto> yearlyReport) {
        Map<String, Map<String, Object>> reportData = new LinkedHashMap<>();
        yearlyReport.forEach(report -> {
            Map<String, Object> pointsData = new LinkedHashMap<>();
            pointsData.put("Points Earned", report.getPointsEarned());
            pointsData.put("Points Used", report.getPointsUsed());
            reportData.put(String.valueOf(report.getYear()), pointsData);
        });

        ReportResponse response = new ReportResponse();
        response.setReportData(reportData);
        return response;
    }

}