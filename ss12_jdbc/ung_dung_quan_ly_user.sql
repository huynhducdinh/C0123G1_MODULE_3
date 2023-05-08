CREATE DATABASE ung_dung_quan_ly_user;
USE ung_dung_quan_ly_user;
CREATE TABLE quan_ly_user(
id INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR(50) NOT NULL,
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

CALL get_users();

delimiter //
CREATE PROCEDURE update_user( IN u_id INT,IN u_name VARCHAR(50),
IN u_email VARCHAR (50),
IN u_country VARCHAR (50))
BEGIN
UPDATE quan_ly_user SET `name`=u_name,email=u_email,country=u_country WHERE id=u_id;
END //
delimiter ;

CALL update_user(10,'dinh','hee@gmail.com','Mĩ');

delimiter //
CREATE PROCEDURE delete_user(IN u_id INT)
BEGIN
DELETE FROM quan_ly_user WHERE id=u_id;
END //
delimiter ;
CALL delete_user(1);

SELECT * FROM 
