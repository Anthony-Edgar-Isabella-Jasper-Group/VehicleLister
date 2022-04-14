package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class MySQLUsersDao implements Users {
    private Connection connection;

    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUsername(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }


    @Override
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (! rs.next()) {
            return null;
        }
        return new User(
            rs.getLong("id"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password")
        );
    }


    @Override
    public User editUsername(User user, String newUsername) {
        PreparedStatement statement;
        String query = "UPDATE users SET username = ? WHERE id = ?";
        String userId = "" + user.getId();
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, newUsername);
            statement.setString(2, userId);
            statement.executeUpdate();
            user.setUsername(newUsername);
            return user;
        } catch (SQLException e) {
            throw new RuntimeException("Error editing Username to users database!", e);
        }
    }

    @Override
    public User editPassword(User user, String newPassword) {
        PreparedStatement statement;
        user.setPassword(newPassword);
        String query = "UPDATE users SET password = ? WHERE id = ?";
        String userId = "" + user.getId();
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, user.getPassword());
            statement.setString(2, userId);
            statement.executeUpdate();

            return user;
        } catch (SQLException e) {
            throw new RuntimeException("Error editing Password to users database!", e);
        }
    }

}
