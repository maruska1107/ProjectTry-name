package com.example.sweater.repos;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.sweater.domain.User;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
    @Query(value = "SELECT * FROM usr u JOIN user_role ur on u.id=ur.user_id WHERE ur.roles='EMPLOYEE'", nativeQuery = true)
    List<User> findByRole();
}
