package com.codeup.adlister.models;

public class Vehicle {
    private long id;
    private long user_id;
    private int make_id;
    private String model;
    private short year;
    private short color;
    private float price;
    private int mileage;
    private byte type_id;
    private String description;

    public Vehicle(long id, long user_id, int make_id, String model, short year, short color, float price, int mileage, byte type_id, String description){
        this.id = id;
        this.user_id = user_id;
        this.make_id = make_id;
        this.model = model;
        this.year = year;
        this.color = color;
        this.price = price;
        this.mileage = mileage;
        this.type_id = type_id;
        this.description = description;
    }

    public void setId(long id){
        this.id = id;
    }
    public void setUser_id(long user_id){
        this.user_id = user_id;
    }
    public void setMake_id(int make_id){
        this.make_id = make_id;
    }
    public void setModel(String model){
        this.model = model;
    }

    public void setYear(short year) {
        this.year = year;
    }

    public void setColor(short color) {
        this.color = color;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setMileage(int mileage) {
        this.mileage = mileage;
    }

    public void setType_id(byte type_id) {
        this.type_id = type_id;
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

    public int getMake_id() {
        return make_id;
    }

    public String getModel() {
        return model;
    }

    public short getYear() {
        return year;
    }

    public short getColor() {
        return color;
    }

    public float getPrice() {
        return price;
    }

    public int getMileage() {
        return mileage;
    }

    public byte getType_id() {
        return type_id;
    }

    public String getDescription() {
        return description;
    }
}
