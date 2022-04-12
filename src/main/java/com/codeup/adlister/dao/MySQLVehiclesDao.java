package com.codeup.adlister.dao;

import com.codeup.adlister.models.Vehicle;
import com.mysql.cj.jdbc.Driver;

import java.util.List;

import java.sql.*;
import java.util.ArrayList;

public class MySQLVehiclesDao implements Vehicles {
    private Connection connection;

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
        PreparedStatement statement;
        try {
            statement = connection.prepareStatement("SELECT v.id, username, email, make, model, year, color, type, price, mileage, description FROM vehicles v JOIN types t on t.id = v.type_id JOIN colors c on c.id = v.color_id JOIN makes m on m.id = v.make_id JOIN users u on u.id = v.user_id");
            ResultSet rs = statement.executeQuery();
            return createVehicleAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting ALL vehicles from database", e);
        }
    }

    @Override
    public Vehicle findByVehicle_id(long id) {
        PreparedStatement statement;
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
    public List<Vehicle> findByUser_Id(long user_id) {
        PreparedStatement statement;
        String user = "" + user_id;
        String query = "SELECT v.id, username, email, make, model, year, color, type, price, mileage, description FROM vehicles v JOIN types t on t.id = v.type_id JOIN colors c on c.id = v.color_id JOIN makes m on m.id = v.make_id JOIN users u on u.id = v.user_id WHERE user_id = ?";
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
        PreparedStatement statement;
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
        PreparedStatement statement;
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
        PreparedStatement statement;
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
        PreparedStatement statement;
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
        PreparedStatement statement;
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
        PreparedStatement statement;
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
        PreparedStatement statement;
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

    public int getUserId(String username) {
        PreparedStatement statement;
        String query = "SELECT id FROM users WHERE username = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            rs.next();
            return rs.getInt("id");
        } catch (SQLException e) {
            throw new RuntimeException("Error finding id from users table.");
        }
    }

    public int getMakeId(String make) {
        PreparedStatement statement;
        String query = "SELECT id FROM makes WHERE make = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, make);
            ResultSet rs = statement.executeQuery();
            rs.next();
            return rs.getInt("id");
        } catch (SQLException e) {
            throw new RuntimeException("Error finding make id from database");
        }
    }

    public int getColorId(String color) {
        PreparedStatement statement;
        String query = "SELECT id FROM colors WHERE color = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, color);
            ResultSet rs = statement.executeQuery();
            rs.next();
            return rs.getInt("id");
        } catch (SQLException e) {
            throw new RuntimeException("Error finding color id from database");
        }
    }

    public int getTypeId(String type) {
        PreparedStatement statement;
        String query = "SELECT id FROM types WHERE type = ?";
        try {
            statement = connection.prepareStatement(query);
            statement.setString(1, type);
            ResultSet rs = statement.executeQuery();
            rs.next();
            return rs.getInt("id");
        } catch (SQLException e) {
            throw new RuntimeException("Error finding type id from database");
        }
    }

    @Override
    public Long insert(Vehicle vehicle) {
        int makeId;
        try {
            PreparedStatement findMake;
            String makeQuery = "SELECT id FROM makes WHERE make = ?";
            findMake = connection.prepareStatement(makeQuery);
            findMake.setString(1, vehicle.getMake());
            ResultSet makeRs = findMake.executeQuery();
            if (makeRs.next()) {
                makeId = makeRs.getInt("id");
            } else {
                String makeStatement = "INSERT INTO makes (make) VALUES (?)";
                PreparedStatement insertMake = connection.prepareStatement(makeStatement, Statement.RETURN_GENERATED_KEYS);
                insertMake.setString(1, vehicle.getMake());
                insertMake.executeUpdate();
                makeRs = insertMake.getGeneratedKeys();
                makeRs.next();
                makeId = makeRs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding make id from database.");
        }
        int colorId;
        try {
            PreparedStatement findColor;
            String colorQuery = "SELECT id FROM colors WHERE color = ?";
            findColor = connection.prepareStatement(colorQuery);
            findColor.setString(1, vehicle.getColor());
            ResultSet colorRs = findColor.executeQuery();
            if (colorRs.next()) {
                colorId = colorRs.getInt("id");
            } else {
                String colorStatement = "INSERT INTO colors (color) VALUES (?)";
                PreparedStatement insertColor = connection.prepareStatement(colorStatement, Statement.RETURN_GENERATED_KEYS);
                insertColor.setString(1, vehicle.getColor());
                insertColor.executeUpdate();
                colorRs = insertColor.getGeneratedKeys();
                colorRs.next();
                colorId = colorRs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding color id from database.");
        }
        int typeId;
        try {
            PreparedStatement findType;
            String typeQuery = "SELECT id FROM types WHERE type = ?";
            findType = connection.prepareStatement(typeQuery);
            findType.setString(1, vehicle.getType());
            ResultSet typeRs = findType.executeQuery();
            if (typeRs.next()) {
                typeId = typeRs.getInt("id");
            } else {
                String typeStatement = "INSERT INTO types (type) VALUES (?)";
                PreparedStatement insertType = connection.prepareStatement(typeStatement, Statement.RETURN_GENERATED_KEYS);
                insertType.setString(1, vehicle.getType());
                insertType.executeUpdate();
                typeRs = insertType.getGeneratedKeys();
                typeRs.next();
                typeId = typeRs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding type id from database.");
        }
        PreparedStatement statement;
        String query = "INSERT INTO vehicles(user_id, make_id, model, year, color_id, price, mileage, type_id, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        String userId = "" + getUserId(vehicle.getUsername());
        String year = "" + vehicle.getYear();
        String price = "" + vehicle.getPrice();
        String mileage = "" + vehicle.getMileage();
        try {
            statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            statement.setString(1, userId);
            statement.setInt(2, makeId);
            statement.setString(3, vehicle.getModel());
            statement.setString(4, year);
            statement.setInt(5, colorId);
            statement.setString(6, price);
            statement.setString(7, mileage);
            statement.setInt(8, typeId);
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
        return new Vehicle(rs.getLong("id"), rs.getString("username"), rs.getString("email"), rs.getString("make"), rs.getString("model"), rs.getShort("year"), rs.getString("color"), rs.getFloat("price"), rs.getInt("mileage"), rs.getString("type"), rs.getString("description"));
    }

    @Override
    public void edit(Vehicle vehicle) {
        int makeId;
        try {
            PreparedStatement findMake;
            String makeQuery = "SELECT id FROM makes WHERE make = ?";
            findMake = connection.prepareStatement(makeQuery);
            findMake.setString(1, vehicle.getMake());
            ResultSet makeRs = findMake.executeQuery();
            if (makeRs.next()) {
                makeId = makeRs.getInt("id");
            } else {
                String makeStatement = "INSERT INTO makes (make) VALUES (?)";
                PreparedStatement insertMake = connection.prepareStatement(makeStatement, Statement.RETURN_GENERATED_KEYS);
                insertMake.setString(1, vehicle.getMake());
                insertMake.executeUpdate();
                makeRs = insertMake.getGeneratedKeys();
                makeRs.next();
                makeId = makeRs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding make id from database.");
        }
        int colorId;
        try {
            PreparedStatement findColor;
            String colorQuery = "SELECT id FROM colors WHERE color = ?";
            findColor = connection.prepareStatement(colorQuery);
            findColor.setString(1, vehicle.getColor());
            ResultSet colorRs = findColor.executeQuery();
            if (colorRs.next()) {
                colorId = colorRs.getInt("id");
            } else {
                String colorStatement = "INSERT INTO colors (color) VALUES (?)";
                PreparedStatement insertColor = connection.prepareStatement(colorStatement, Statement.RETURN_GENERATED_KEYS);
                insertColor.setString(1, vehicle.getColor());
                insertColor.executeUpdate();
                colorRs = insertColor.getGeneratedKeys();
                colorRs.next();
                colorId = colorRs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding color id from database.");
        }
        int typeId;
        try {
            PreparedStatement findType;
            String typeQuery = "SELECT id FROM types WHERE type = ?";
            findType = connection.prepareStatement(typeQuery);
            findType.setString(1, vehicle.getType());
            ResultSet typeRs = findType.executeQuery();
            if (typeRs.next()) {
                typeId = typeRs.getInt("id");
            } else {
                String typeStatement = "INSERT INTO types (type) VALUES (?)";
                PreparedStatement insertType = connection.prepareStatement(typeStatement, Statement.RETURN_GENERATED_KEYS);
                insertType.setString(1, vehicle.getType());
                insertType.executeUpdate();
                typeRs = insertType.getGeneratedKeys();
                typeRs.next();
                typeId = typeRs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error finding type id from database.");
        }
        PreparedStatement statement;
        String query = "UPDATE vehicles SET make_id = ?, model = ?, year = ?, color_id = ?, price = ?, mileage = ?, type_id = ?, description = ? WHERE id = ?";
        String vehicleId = "" + vehicle.getId();
        String year = "" + vehicle.getYear();
        String price = "" + vehicle.getPrice();
        String mileage = "" + vehicle.getMileage();
        try {
            statement = connection.prepareStatement(query);
            statement.setInt(1, makeId);
            statement.setString(2, vehicle.getModel());
            statement.setString(3, year);
            statement.setInt(4, colorId);
            statement.setString(5, price);
            statement.setString(6, mileage);
            statement.setInt(7, typeId);
            statement.setString(8, vehicle.getDescription());
            statement.setString(9, vehicleId);
            statement.executeUpdate();

            System.out.println("I'm working");;
        } catch (SQLException e) {
            throw new RuntimeException("Error editing Vehicle to vehicle database!", e);
        }
    }
    @Override
    public void delete(Long id){
        PreparedStatement statement;
        String query = "DELETE FROM vehicles WHERE id = ?";
        try{
            statement = connection.prepareStatement(query);
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch(SQLException e) {
            throw new RuntimeException("Error deleting Vehicle to vehicle database!", e);
        }

    }
}