package com.notificationschedulerservice.notificationschedulerservice.model.enumType;

public enum RoleCode {
    ROLE_ADMIN("Quản trị viên"),
    ROLE_STAFF("Nhân viên"),
    ROLE_CUSTOMER("Khách hàng"),
    ROLE_CREATE("Tạo mới"),
    ROLE_READ("Đọc"),
    ROLE_UPDATE("Cập nhật"),
    ROLE_DELETE("Xóa");

    private String name;

    private RoleCode(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }
}
