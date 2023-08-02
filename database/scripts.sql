create database if not exists SCHEDULE_APP;

use  SCHEDULE_APP;

-- TA: get notification,  get category, get news
-- Trí: add user and save to sharedpreference, add notification
-- Đại: add service, get service by studentcode, push notification
-- Thế: get class schedule, get exam schedule, get schedule by date, 

-- user
-- api: lưu user



create table if not exists users (
	id INT PRIMARY KEY AUTO_INCREMENT,
	avatar VARCHAR(150) NOT NULL,
	name NVARCHAR(100) NOT NULL, -- tiếng việt
	email VARCHAR(100) NOT NULL UNIQUE,
    student_code VARCHAR(100) NOT NULL UNIQUE,
    gender BIT,
    birthday DATE,
    address NVARCHAR(500),
    course NVARCHAR(100)
);

insert into users (studentCode, email, avatar, password,address) values ("ps1234", "abc@gmail.com", "https://cdn.vox-cdn.com/thumbor/xBIBkXiGLcP-kph3pCX61U7RMPY=/0x0:1400x788/1200x800/filters:focal(588x282:812x506)/cdn.vox-cdn.com/uploads/chorus_image/image/70412073/0377c76083423a1414e4001161e0cdffb0b36e1f_760x400.0.png", "123","tphcm");


-- category
-- api: get category
create table if not exists categories (
    id INT KEY AUTO_INCREMENT,
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
    id INT KEY AUTO_INCREMENT,
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
    id INT KEY AUTO_INCREMENT,
    date DATE NOT NULL,

)


-- notification
-- api: get notification, add notification

create TABLE if not exists notifications(
    id INT KEY AUTO_INCREMENT,
    userID INT NOT NULL,
    newsID INT NOT NULL,

    FOREIGN KEY (userID) REFERENCES users(id)
    FOREIGN KEY (newsID) REFERENCES news(id)
);

-- service

create table if not exists services(
    id INT KEY AUTO_INCREMENT,
    studentCodeID VARCHAR(7) NOT NULL,
    image VARCHAR(1000),
    phoneNumber VARCHAR(20) NOT NULL,
    service VARCHAR(100) NOT NULL,
    note VARCHAR(500),
    quantity INT,
    mucdich VARCHAR(100),
    confirm VARCHAR(100),
    FOREIGN KEY (studentCodeID) REFERENCES users(student_code)
);
insert into services (id, studentCodeID, image, phoneNumber, service,note,quantity,mucdich,confirm) 
            values (1, "ps24412", "https://i.pinimg.com/originals/a2/98/16/a29816cd63e5d731cc70cfd3f88c2ce8.jpg", "0123456789", "Cấp thẻ sinh viên","làm nhanh giúp em",1,"","");
insert into services (id, studentCodeID, image, phoneNumber, service,note,quantity,mucdich,confirm) 
            values (2, "ps24412", "", "0123456789", "Giấy xác nhận sinh viên","làm nhanh giúp em",1,"Hoãn Nghĩa Vụ","Theo Mẫu của nhà trường");
insert into services (id, studentCodeID, image, phoneNumber, service,note,quantity,mucdich,confirm) 
            values (3, "ps24412", "", "0123456789", "Cấp bảng điểm","làm nhanh giúp em",1,"","");
-- api: add service by mssv, get service

create table if not exists servicecomplete (
    id INT PRIMARY KEY AUTO_INCREMENT,
    service VARCHAR(100) NOT NULL,
    confirm VARCHAR(100) NOT NULL,
    date VARCHAR(100) NOT NULL,
    thongbao VARCHAR(500) NOT NULL,
    studentCodeID VARCHAR(7) NOT NULL,
    FOREIGN KEY (studentCodeID) REFERENCES users(student_code)
);