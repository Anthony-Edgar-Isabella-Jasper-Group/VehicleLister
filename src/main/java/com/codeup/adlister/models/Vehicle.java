package com.codeup.adlister.models;

public class Vehicle {
    private long id;
    private long user_id;
    private String make;
    private String model;
    private short year;
    private String color;
    private float price;
    private int mileage;
    private String type;
    private String description;

    public Vehicle(long id, long user_id, String make, String model, short year, String color, float price, int mileage, String type, String description) {
        this.id = id;
        this.user_id = user_id;
        this.make = make;
        this.model = model;
        this.year = year;
        this.color = color;
        this.price = price;
        this.mileage = mileage;
        this.type = type;
        this.description = description;
    }

    public Vehicle(long user_id, String make, String model, short year, String color, float price, int mileage, String type, String description) {
        this.user_id = user_id;
        this.make = make;
        this.model = model;
        this.year = year;
        this.color = color;
        this.price = price;
        this.mileage = mileage;
        this.type = type;
        this.description = description;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public void setMake(String make) {
        this.make = make;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setYear(short year) {
        this.year = year;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setMileage(int mileage) {
        this.mileage = mileage;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public long getUser_id() {
        return user_id;
    }

    public String getMake() {
        return make;
    }

    public String getModel() {
        return model;
    }

    public short getYear() {
        return year;
    }

    public String getColor() {
        return color;
    }

    public float getPrice() {
        return price;
    }

    public int getMileage() {
        return mileage;
    }

    public String getType() {
        return type;
    }

    public String getDescription() {
        return description;
    }
}