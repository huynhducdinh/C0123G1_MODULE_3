CREATE DATABASE student_manage;
USE student_manage;
CREATE TABLE class (
	id INT PRIMARY KEY,
	namese VARCHAR(50));
INSERT class VALUES (1,'C0123G1');
SELECT * FROM class;

CREATE TABLE student (
    id INT PRIMARY KEY,
    namese VARCHAR(50),
    age DATE,
    country VARCHAR(50));
INSERT INTO student VALUES(1,'Huỳnh Đức Định','2002-8-9','Việt Nam');
SELECT * FROM student;

CREATE TABLE teacher(
	id INT PRIMARY KEY,
	namese VARCHAR(50),
	AGE DATE,
	counTRY VARCHAR(50));
INSERT INTO teacher VALUES(1,'Nam','1997-12-20','Việt Nam');
SELECT * FROM teacher;

