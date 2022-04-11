package com.codeup.adlister.dao;

public class Config {
    public String getUrl() {
        return "jdbc:mysql://localhost:3306/vehicle_list?allowPublicKeyRetrieval=true&useSSL=false";
    }

    public String getUsername() {
        return "vehiclelistuser";
    }

    public String getPassword() {
        return "codeup";
    }
}