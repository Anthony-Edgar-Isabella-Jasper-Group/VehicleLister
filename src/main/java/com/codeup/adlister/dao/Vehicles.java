package com.codeup.adlister.dao;

import com.codeup.adlister.models.Vehicle;

import java.util.List;

public interface Vehicles {
    List<Vehicle> all();

    Vehicle findByVehicle_id(long id);

    List<Vehicle> findByMake(int make_id);

    List<Vehicle> findByModel(String model);

    List<Vehicle> findByYear(short year);

    List<Vehicle> findByColor(short color);

    List<Vehicle> findByPrice(float price);

    List<Vehicle> findByMileage(int mileage);

    List<Vehicle> findByType(byte type);

    List<Vehicle> findByUser_Id(long user_id);

    void insert(Vehicle vehicle, String purpose);

    void delete(Long id);

    void edit(Vehicle vehicle, String purpose);

}
