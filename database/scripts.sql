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


insert into categories (id, name, image, bgColor) values (1, "Hoạt Động", "", "#E6F2EA");
insert into categories (id, name, image, bgColor) values (2, "Học Tập", "", "#FFE9E5");
insert into categories (id, name, image, bgColor) values (3, "Học Phí", "", "#FFF6E3");

-- news
-- api: get news
create TABLE if not exists news(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    image VARCHAR(1000) NOT NULL,
    detail VARCHAR(5000) NOT NULL,
    categoryID INT NOT NULL,
    FOREIGN KEY (categoryID) REFERENCES categories(id)
)
-- hoạt động

insert into news (id, title, image, detail, categoryID) values (1, "Học Phí", "", "#FFF6E3", 1);
insert into news (id, title, image, detail, categoryID) values (2, "Học Phí", "", "#FFF6E3", 1);
insert into news (id, title, image, detail, categoryID) values (3, "Học Phí", "", "#FFF6E3", 1);
insert into news (id, title, image, detail, categoryID) values (4, "Học Phí", "", "#FFF6E3", 1);
insert into news (id, title, image, detail, categoryID) values (5, "Học Phí", "", "#FFF6E3", 1);
insert into news (id, title, image, detail, categoryID) values (6, "Học Phí", "", "#FFF6E3", 1);

-- học tập
insert into news (id, title, image, detail, categoryID) values (7, "Học Phí", "", "#FFF6E3", 2);
insert into news (id, title, image, detail, categoryID) values (8, "Học Phí", "", "#FFF6E3", 2);
insert into news (id, title, image, detail, categoryID) values (9, "Học Phí", "", "#FFF6E3", 2);
insert into news (id, title, image, detail, categoryID) values (10, "Học Phí", "", "#FFF6E3", 2);
insert into news (id, title, image, detail, categoryID) values (11, "Học Phí", "", "#FFF6E3", 2);
insert into news (id, title, image, detail, categoryID) values (12, "Học Phí", "", "#FFF6E3", 2);

-- học phí
insert into news (id, title, image, detail, categoryID) values (13, "Học Phí", "", "#FFF6E3", 3);
insert into news (id, title, image, detail, categoryID) values (14, "Học Phí", "", "#FFF6E3", 3);
insert into news (id, title, image, detail, categoryID) values (15, "Học Phí", "", "#FFF6E3", 3);
insert into news (id, title, image, detail, categoryID) values (16, "Học Phí", "", "#FFF6E3", 3);
insert into news (id, title, image, detail, categoryID) values (17, "Học Phí", "", "#FFF6E3", 3);
insert into news (id, title, image, detail, categoryID) values (18, "Học Phí", "", "#FFF6E3", 3);

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
    userID INT NOT NULL,
    newsID INT NOT NULL,

    FOREIGN KEY (userID) REFERENCES users(id)
    FOREIGN KEY (newsID) REFERENCES news(id)
)

-- service

create TABLE if not exists services(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    studentCodeID INT NOT NULL,

    FOREIGN KEY (studentCodeID) REFERENCES users(studentCode)
)

-- api: add service by mssv, get service