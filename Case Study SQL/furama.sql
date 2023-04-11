create database furama;
use furama;
create table vi_tri(
ma_vi_tri int primary key,
ten_vi_tri varchar(50));
insert into vi_tri value(1,'Quản Lý'),(2,'Nhân Viên');
select * from vi_tri;

create table trinh_do(
ma_trinh_do int primary key,
ten_trinh_do varchar(50));
insert into trinh_do value(1,'Trung Cấp'),
						  (2,'Cao Đẳng'),
						  (3,'Đại Học'),
						  (4,'Sau Đại Hoc');
select * from trinh_do;

create table bo_phan(
ma_bo_phan int primary key,
ten_bo_phan varchar(50));
insert into bo_phan value()