package com.ticketbooking.repo;

import com.ticketbooking.model.Token;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface TokenRepo extends JpaRepository<Token, Long> {

    @Query("""
			select t from Token t inner join User u on t.user.username = u.username
			where u.username = :username and (t.expired = false or t.revoked = false)
			""")
    List<Token> findAllValidTokenByUsername(String username);

    Optional<Token> findByToken(String token);
}
