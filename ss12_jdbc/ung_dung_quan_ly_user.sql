CREATE DATABASE ung_dung_quan_ly_user;
USE ung_dung_quan_ly_user;
CREATE TABLE quan_ly_user(
id INT PRIMARY KEY,
namese VARCHAR(50),
email VARCHAR(50),
country VARCHAR(50)
);
INSERT INTO quan_ly_user VALUES (1,"Định","heeyeon0982002@gmail.com","Việt Nam"),
								(2,"Thắng","thang@gmail.com","Hàn Quốc"),
								(3,"Viễn","vien123@gmail.com","Lào");
SELECT * FROM quan_ly_user;