package com.ticketbooking.repo;

import com.ticketbooking.model.User;
import com.ticketbooking.model.UserPermission;
import com.ticketbooking.model.enumType.RoleCode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserPermissionRepo extends JpaRepository<UserPermission, Long> {
    List<UserPermission> findAllByUser(User username);

    @Modifying
    @Query(value = "delete " +
                    "from user_permission up where up.screen_code=:screenCode "+
                    "and username=:username " +
                    "and up.role_id not in (select id from role r where r.role_code in ('ROLE_ADMIN', 'ROLE_STAFF', 'ROLE_CUSTOMER'))"
            , nativeQuery = true)
    void deleteOldUserCrudRoles(@Param("screenCode") String screenCode,
                                @Param("username") String username);
}
