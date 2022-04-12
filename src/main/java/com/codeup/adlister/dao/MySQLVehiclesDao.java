package com.codeup.adlister.dao;

import com.codeup.adlister.models.Vehicle;

import java.util.List;

import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;

public class MySQLVehiclesDao implements Vehicles {
    private Connection connection = null;


    public MySQLVehiclesDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(config.getUrl(), config.getUsername(), config.getPassword());

        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Vehicle> all() {
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement("SELECT * FROM vehicles");
            ResultSet rs = statement.executeQuery();
            return createVehicleAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting ALL vehicles from database", e);
        }
    }

    @Override
    public Vehicle findByVehicle_id(long id) {
        PreparedStatement statement = null;
        String user = "" + id;
        String query = "SELECT * FROM vehicles WHERE id = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, user);
            ResultSet rs = statement.executeQuery();
            List<Vehicle> list = createVehicleAdsFromResults(rs);
            return list.get(0);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting vehicles from database with ID", e);
        }
    }

    @Override
    public List<Vehicle> findByUser_id(long user_id) {
        PreparedStatement statement = null;
        String user = "" + user_id;
        String query = "SELECT * FROM vehicles WHERE user_id = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, user);
            ResultSet rs = statement.executeQuery();
            return createVehicleAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting vehicles from database with MAKE_ID", e);
        }
    }

    @Override
    public List<Vehicle> findByMake(int make_id) {
        PreparedStatement statement = null;
        String make = "" + make_id;
        String query = "SELECT * FROM vehicles WHERE make_id = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, make);
            ResultSet rs = statement.executeQuery();
            return createVehicleAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting vehicles from database with MAKE_ID", e);
        }
    }

    @Override
    public List<Vehicle> findByModel(String model) {
        PreparedStatement statement = null;
        String query = "SELECT * FROM vehicles WHERE model = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, model);
            ResultSet rs = statement.executeQuery();
            return createVehicleAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting vehicles from database with MODEL", e);
        }
    }

    @Override
    public List<Vehicle> findByYear(short year) {
        PreparedStatement statement = null;
        String yearString = "" + year;
        String query = "SELECT * FROM vehicles WHERE year = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, yearString);
            ResultSet rs = statement.executeQuery();
            return createVehicleAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting vehicles from database with YEAR", e);
        }
    }

    @Override
    public List<Vehicle> findByColor(short color) {
        PreparedStatement statement = null;
        String color_id = "" + color;
        String query = "SELECT * FROM vehicles WHERE color_id = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, color_id);
            ResultSet rs = statement.executeQuery();
            return createVehicleAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting vehicles from database with COLOR_ID", e);
        }
    }

    @Override
    public List<Vehicle> findByPrice(float price) {
        PreparedStatement statement = null;
        String priceString = "" + price;
        String query = "SELECT * FROM vehicles WHERE price = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, priceString);
            ResultSet rs = statement.executeQuery();
            return createVehicleAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting vehicles from database with PRICE", e);
        }
    }

    @Override
    public List<Vehicle> findByMileage(int mileage) {
        PreparedStatement statement = null;
        String mileageString = "" + mileage;
        String query = "SELECT * FROM vehicles WHERE mileage = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, mileageString);
            ResultSet rs = statement.executeQuery();
            return createVehicleAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting vehicles from database with MILEAGE", e);
        }
    }

    @Override
    public List<Vehicle> findByType(byte type_id) {
        PreparedStatement statement = null;
        String typeString = "" + type_id;
        String query = "SELECT * FROM vehicles WHERE type_id = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, typeString);
            ResultSet rs = statement.executeQuery();
            return createVehicleAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting vehicles from database with TYPE_ID", e);
        }
    }

    public int getMakeId(String make) {
        PreparedStatement statement;
        String query = "SELECT id FROM makes WHERE name = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, make);
            ResultSet rs = statement.executeQuery();
            return rs.getInt("id");
        } catch (SQLException e) {
            throw new RuntimeException("Error finding make id from database");
        }
    }

    public String getMake(int id) {
        PreparedStatement statement;
        String query = "SELECT name FROM makes WHERE id = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            rs.next();
            return rs.getString("name");
        } catch (SQLException e) {
            throw new RuntimeException("Error finding make String from database");
        }
    }

    public int getColorId(String color) {
        PreparedStatement statement;
        String query = "SELECT id FROM colors WHERE name = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, color);
            ResultSet rs = statement.executeQuery();
            return rs.getInt("id");
        } catch (SQLException e) {
            throw new RuntimeException("Error finding color id from database");
        }
    }

    public String getColor(int id) {
        PreparedStatement statement;
        String query = "SELECT name FROM colors WHERE id = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            rs.next();
            return rs.getString("name");
        } catch (SQLException e) {
            throw new RuntimeException("Error finding color String from database");
        }
    }

    public int getTypeId(String type) {
        PreparedStatement statement;
        String query = "SELECT id FROM types WHERE name = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, type);
            ResultSet rs = statement.executeQuery();
            return rs.getInt("id");
        } catch (SQLException e) {
            throw new RuntimeException("Error finding type id from database");
        }
    }

    public String getType(int id) {
        PreparedStatement statement;
        String query = "SELECT name FROM types WHERE id = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            rs.next();
            return rs.getString("name");
        } catch (SQLException e) {
            throw new RuntimeException("Error finding type String from database");
        }
    }

    @Override
    public Long insert(Vehicle vehicle) {
        PreparedStatement statement = null;
        String query = "INSERT INTO vehicles(user_id, make_id, model, year, color_id, price, mileage, type_id, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String user_id = "" + vehicle.getUser_id();
        String make_id = "" + getMakeId(vehicle.getMake());
        String year = "" + vehicle.getYear();
        String color = "" + getColorId(vehicle.getColor());
        String price = "" + vehicle.getPrice();
        String mileage = "" + vehicle.getMileage();
        String type_id = "" + getTypeId(vehicle.getType());
        try {
            statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, user_id);
            statement.setString(2, make_id);
            statement.setString(3, vehicle.getModel());
            statement.setString(4, year);
            statement.setString(5, color);
            statement.setString(6, price);
            statement.setString(7, mileage);
            statement.setString(8, type_id);
            statement.setString(9, vehicle.getDescription());
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error adding Vehicle to vehicle database!", e);
        }
    }

    private List<Vehicle> createVehicleAdsFromResults(ResultSet rs) throws SQLException {
        List<Vehicle> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractVehicle(rs));
        }
        return ads;
    }

    private Vehicle extractVehicle(ResultSet rs) throws SQLException {
        return new Vehicle(rs.getLong("id"), rs.getLong("user_id"), getMake(rs.getInt("make_id")), rs.getString("model"), rs.getShort("year"), getColor(rs.getInt("color_id")), rs.getFloat("price"), rs.getInt("mileage"), getType(rs.getInt("type_id")), rs.getString("description"));
    }
}