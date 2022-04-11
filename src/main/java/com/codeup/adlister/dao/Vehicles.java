package com.codeup.adlister.dao;

import com.codeup.adlister.models.Vehicle;

import java.util.List;

public interface Vehicles {

    List<Vehicle> all();
    List<Vehicle> findByMake(int make_id);
    List<Vehicle> findByModel(String model);
    List<Vehicle> findByYear(short year);
    List<Vehicle> findByColor(short color);
    List<Vehicle> findByPrice(float price);
    List<Vehicle> findByMileage(int mileage);
    List<Vehicle> findByType(byte type);
    Long insert(Vehicle vehicle);


}