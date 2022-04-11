package com.codeup.adlister.dao;

public class DaoFactory {
    private static Vehicles vehiclesDao;
    private static Users usersDao;
    private static Config config = new Config();

    public static Vehicles getAdsDao() {
        if (vehiclesDao == null) {
            vehiclesDao = new MySQLVehiclesDao(config);
        }
        return vehiclesDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao(config);
        }
        return usersDao;
    }
}
