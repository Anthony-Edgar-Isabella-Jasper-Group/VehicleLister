DROP DATABASE IF EXISTS vehicle_list;
CREATE DATABASE IF NOT EXISTS vehicle_list;
DROP USER IF EXISTS 'vehiclelistuser'@'localhost';
CREATE USER 'vehiclelistuser'@'localhost' IDENTIFIED BY 'codeup';
GRANT ALL ON vehicle_list.* TO 'vehiclelistuser'@'localhost';
USE vehicle_list;

CREATE TABLE users
(
    id       INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL,
    email    VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (username, email)
);

CREATE TABLE purposes
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    purpose VARCHAR(30) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (purpose)
);

CREATE TABLE makes
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    make VARCHAR(30) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (make)
);

CREATE TABLE types
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    type VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (type)
);

CREATE TABLE colors
(
    id    INT UNSIGNED NOT NULL AUTO_INCREMENT,
    color VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (color)
);

CREATE TABLE vehicles
(
    id          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id     INT UNSIGNED NOT NULL,
    make_id     INT UNSIGNED NOT NULL,
    model       VARCHAR(20) NOT NULL,
    year        INT          NOT NULL,
    color_id    INT UNSIGNED,
    price       FLOAT        NOT NULL,
    mileage     INT          NOT NULL,
    type_id     INT UNSIGNED NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (make_id) REFERENCES makes (id),
    FOREIGN KEY (color_id) REFERENCES colors (id),
    FOREIGN KEY (type_id) REFERENCES types (id)
);

CREATE TABLE vehicle_purposes
(
    id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    vehicle_id INT UNSIGNED NOT NULL,
    purpose_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (id),
    FOREIGN KEY (purpose_id) REFERENCES purposes (id)
);

INSERT INTO types(type)
VALUES ('sedan'),
       ('coupe'),
       ('SUV');
INSERT INTO colors(color)
VALUES ('white'),
       ('maroon'),
       ('gray'),
       ('blue');
INSERT INTO makes(make)
VALUES ('Honda'),
       ('Dodge'),
       ('Chevrolet'),
       ('BMW');
INSERT INTO users(username, email, password)
VALUES ('test', 'test@testmail.com', '$2a$12$.wCMmof5KF7tZv9w2BPLz.8t6qSP4t8lOdcj9qFOnju.viucLVOqu');
INSERT INTO vehicles(user_id, make_id, model, year, color_id, price, mileage, type_id, description)
VALUES (1, 1, 'Civic', 2018, 1, 10000, 20000, 1, 'Jasper'),
       (1, 2, 'Challenger', 2017, 3, 15000, 50000, 2, 'Edgar'),
       (1, 3, 'Trailblazer', 2007, 2, 5000, 100000, 3, 'Isabella'),
       (1, 4, '540i', 2000, 4, 5000, 200000, 1, 'Anthony');