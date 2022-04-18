package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLUsersDao implements Users {
    private Connection connection;

    @Override
    public List<User> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM users");
            ResultSet rs = stmt.executeQuery();
            return createUserList(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

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
    public User findByEmail(String email) {
        List<User> users = all();
        for (int i = 0; i < users.size(); i++) {
            User user = users.get(i);
            if (user.getEmail().equals(email)) {
                return user;
            }

        }
        return null;
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password, security_question, security_answer) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getSecurityQuestion());
            stmt.setString(5, user.getSecurityAnswer());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (!rs.next()) {
            return null;
        }
        return new User(
                rs.getLong("id"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getString("security_question"),
                rs.getString("security_answer")
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

    private List<User> createUserList(ResultSet rs) throws SQLException {
        List<User> users = new ArrayList<>();
        while (rs.next()) {
            users.add(makeUser(rs));
        }
        return users;
    }

    private User makeUser(ResultSet rs) throws SQLException {
        return new User(
                rs.getLong("id"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("password"),
                rs.getString("security_question"),
                rs.getString("security_answer")
        );
    }
}
