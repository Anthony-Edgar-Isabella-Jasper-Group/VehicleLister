DROP DATABASE IF EXISTS vehicle_list;
CREATE DATABASE IF NOT EXISTS vehicle_list;
CREATE USER 'vehiclelistuser'@'localhost' IDENTIFIED BY 'codeup';
GRANT ALL ON vehicle_list.* TO 'vehiclelistuser'@'localhost';
USE vehicle_list;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(30),
    email VARCHAR(50),
    password VARCHAR(255),
    PRIMARY KEY (id),
    UNIQUE (username,email)
);

CREATE TABLE usages (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE makes (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(30),
    PRIMARY KEY (id),
    UNIQUE (name)

);

CREATE TABLE types (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR (20),
    PRIMARY KEY (id),
    UNIQUE (name)

);

CREATE TABLE colors (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR (20),
    PRIMARY KEY (id),
    UNIQUE (name)

);

CREATE TABLE vehicles (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    make_id INT UNSIGNED NOT NULL,
    model VARCHAR(20),
    year INT NOT NULL,
    color_id INT UNSIGNED,
    price FLOAT NOT NULL,
    mileage INT NOT NULL,
    type_id INT UNSIGNED,
    description TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (make_id) REFERENCES makes (id),
    FOREIGN KEY (color_id) REFERENCES colors (id),
    FOREIGN KEY (type_id) REFERENCES types (id)
);

CREATE TABLE vehicle_usages (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    vehicle_id INT UNSIGNED,
    usage_id INT UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (id),
    FOREIGN KEY (usage_id) REFERENCES usages (id)
);
