package com.ticketbooking.utils;

public class AppConstants {

    public static final String EMAIL_REGEX_PATTERN = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@[^-][A-Za-z0-9-]" +
            "+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";

    public static final String PHONE_REGEX_PATTERN = "^(0|84)[0-9]{9}$";

    public static final String[] WEEK_COLUMNS = {"", "Mon", "Tue", "Wed", "Thu", "Fri", "Sar", "Sun"};

    public static final String[] MONTH_COLUMNS = {"", "Jan", "Feb", "Mar", "Apr" , "May",
            "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
}
