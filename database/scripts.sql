create database if not exists SCHEDULE_APP;

use  SCHEDULE_APP;

-- TA: get notification,  get category, get news
-- Trí: add user and save to sharedpreference, add notification
-- Đại: add service, get service by studentcode, push notification
-- Thế: get class schedule, get exam schedule, get schedule by date, 

-- user
-- api: lưu user

create TABLE if not exists users(
    studentCode VARCHAR(7) NOT NULL PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    avatar VARCHAR(1000) NOT NULL,
    email VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    isLogged BIT DEFAULT 1
)

-- category
-- api: get category
create table if not exists categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(500) NOT NULL,
    image VARCHAR(5000) NOT NULL,
    bgColor VARCHAR(5000) NOT NULL
);

-- news
-- api: get news
create TABLE if not exists news(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    image VARCHAR(1000) NOT NULL,
    detail VARCHAR(5000) NOT NULL,
)

-- schedule
-- api: get all schedule, get schedule by date
create TABLE if not exists schedules(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date DATE NOT NULL,

)


-- notification
-- api: get notification, add notification

create TABLE if not exists notifications(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    image VARCHAR(1000) NOT NULL,
)

-- service

create TABLE if not exists services(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    studentCodeID INT NOT NULL,

    FOREIGN KEY (studentCodeID) REFERENCES users(studentCode)
)

-- api: add service by mssv, get service