CREATE DATABASE ung_dung_quan_ly_user;
USE ung_dung_quan_ly_user;
CREATE TABLE quan_ly_user(
id INT AUTO_INCREMENT PRIMARY KEY,
namese VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
country VARCHAR(50) NOT NULL
);
INSERT INTO quan_ly_user VALUES (1,"Định","heeyeon0982002@gmail.com","Việt Nam"),
								(2,"Thắng","thang@gmail.com","Hàn Quốc"),
								(3,"Viễn","vien123@gmail.com","Lào");
SELECT * FROM quan_ly_user;
SELECT * FROM quan_ly_user AS u WHERE u.country='Lào';

delimiter //
CREATE PROCEDURE get_users()
BEGIN
SELECT *FROM quan_ly_user;
END //
delimiter ;

CALL users();