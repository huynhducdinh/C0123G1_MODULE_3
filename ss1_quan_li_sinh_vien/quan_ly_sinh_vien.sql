create database student_manage;
use student_manage;
create table class(
id int primary key,
`name` varchar(50));
insert into class value (1,'C0123G1');
select * from class;

create table student(
id int primary key,
`name` varchar(50),
age date,
country varchar(50));
insert into student value(1,'Huỳnh Đức Định','2002-8-9','Việt Nam');
select * from student;

create table teacher(
id int primary key,
`name` varchar(50),
age date,
country varchar(50));
insert into teacher value(1,'Nam','1997-12-20','Việt Nam');
select * from teacher;
