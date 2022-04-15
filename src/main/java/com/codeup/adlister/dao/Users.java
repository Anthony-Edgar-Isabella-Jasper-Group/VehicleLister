package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    List<User> all();
    User findByUsername(String username);
    String findByEmail(String email);
    Long insert(User user);
    User editUsername(User user, String newUsername);
    User editPassword(User user, String newPassword);
}
