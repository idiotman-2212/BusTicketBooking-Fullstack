package com.ticketbooking.repo;

import com.ticketbooking.model.UserNotification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserNotificationRepo extends JpaRepository<UserNotification, Long> {
    List<UserNotification> findByUser_UsernameOrderByNotification_SendDateTimeDesc(String username);

    void deleteByNotificationId(Long notificationId);

    void deleteAll();

    @Query("SELECT COUNT(un) FROM UserNotification un WHERE un.user.username = :username AND un.isRead = false")
    long countUnreadNotifications(String username);

    List<UserNotification> findByUser_UsernameAndNotification_SendDateTimeAfter(String username, LocalDateTime date);


    Optional<UserNotification> findByNotification_IdAndUser_Username(Long notificationId, String username);

    // Lấy danh sách thông báo chưa bị xóa mềm
    @Query("SELECT u FROM UserNotification u WHERE u.user.username = :username AND u.isDeleted = false ORDER BY u.notification.sendDateTime DESC")
    List<UserNotification> findByUser_UsernameAndNotDeleted(String username);

    // Tìm thông báo theo ID và chưa bị xóa
    @Query("SELECT u FROM UserNotification u WHERE u.notification.id = :notificationId AND u.isDeleted = false AND u.user.username = :username")
    Optional<UserNotification> findFirstByNotificationIdAndUsername(@Param("notificationId") Long notificationId, @Param("username") String username);

    @Query("SELECT un FROM UserNotification un WHERE un.user.username = :username AND un.isDeleted = false")
    List<UserNotification> findAllByUserAndNotDeleted(@Param("username") String username);

    @Query("SELECT un FROM UserNotification un WHERE un.user.username = :username AND un.isDeleted = false AND un.notification.sendDateTime >= :startDate")
    List<UserNotification> findRecentByUserAndNotDeleted(@Param("username") String username, @Param("startDate") LocalDateTime startDate);

    List<UserNotification> findByUser_UsernameAndIsDeletedFalseAndIsReadFalse(String username);
}
