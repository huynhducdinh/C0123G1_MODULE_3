create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
id int primary key,
`name` varchar(50));
insert into class value (1,'C0123G1');
select * from class;

create table student(
id int primary key,
`name` varchar(50),
age int,
country varchar(50));
insert into student value(1,'Huỳnh Đức Định',21,'Việt Nam');

create table teacher(
id int primary key,
`name` varchar(50),
age int,
country varchar(50));
insert into teacher value(1,'Nam',20,'Việt Nam');
select * from teacher;
