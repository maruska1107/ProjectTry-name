package com.example.sweater.Services;

import com.example.sweater.domain.Role;
import com.example.sweater.domain.User;
import com.example.sweater.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserRepo userRepo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }
    public boolean addUser(User user) {
        User userFromDb = userRepo.findByUsername(user.getUsername());
        String name = user.getName();
        String family = user.getFamily();
        String patronymic = user.getPatronymic();
        String email = user.getEmail();
        String phone = user.getPhone();
        String address = user.getAddress();

        if (userFromDb != null) {
            return false;
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        
        userRepo.save(user);
        return true;

    }
}
