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


insert into users (avatar, name, email, student_code, gender, birthday, address, course) values ('', 'Võ Thành Thế', 'abc@gmail.com', 'PS24513', 1 , '2003-04-23', 'Hàm Thuận Bắc, Bình Thuận', 'Android Networking');
insert into users (avatar, name, email, student_code, gender, birthday, address, course) values ('', 'Võ Chi Toàn', 'abc1@gmail.com', 'PS24514', 1 , '2003-04-23', 'Hàm Thuận Bắc, Bình Thuận', 'Android Networking');
insert into users (avatar, name, email, student_code, gender, birthday, address, course) values ('', 'Võ Đài Nghĩa ', 'abc2@gmail.com', 'PS24515', 1 , '2003-04-23', 'Hàm Thuận Bắc, Bình Thuận', 'Android Networking');
insert into users (avatar, name, email, student_code, gender, birthday, address, course) values ('', 'Võ Thị Thanh Tuyền', 'abc3@gmail.com', 'PS24516', 1 , '2003-04-23', 'Hàm Thuận Bắc, Bình Thuận', 'Android Networking');

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
create table if not exists schedules (
    id INT PRIMARY KEY AUTO_INCREMENT,
    room NVARCHAR(100) NOT NULL, -- phòng
    day DATE NOT NULL, -- ngày học
    time NVARCHAR(100) NOT NULL, -- ca học
    course_name NVARCHAR(100) NOT NULL, -- tên môn
    course_id NVARCHAR(100) NOT NULL, -- mã môn
    class_name NVARCHAR(100) NOT NULL, -- mã lớp
    teacher_name NVARCHAR(100) NOT NULL, -- tên giảng viên
    address NVARCHAR(100) NOT NULL, -- địa điểm
    type BIT NOT NULL, -- 0: học, 1: thi
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-01', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, 1);
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-02', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, 1);
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-03', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, 1);
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-05', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, 1);
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-06', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, 2);
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-07', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, 2);
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-08', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, 2);
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-09', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, 2);
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-10', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, 3);
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-11', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 0, 3);
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-12', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, 3);
insert into schedules (room, day, time, course_name, course_id, class_name, teacher_name, address, type, user_id) values ('T308', '2023-08-12', '17:30 - 19:30 PM', 'Android Networking', 'MOB1234',  'MD17306', 'Chann3', 'Phan Mem Quang Trung', 1, 3);


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