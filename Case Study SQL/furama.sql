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
insert into bo_phan value(1,'Sale-Marketing'),
					     (2,'Hành Chính'),
						 (3,'Phục Vụ'),
						 (4,'Quản Lý');
select * from bo_phan;
create table nhan_vien(
ma_nhan_vien int primary key,
ho_ten varchar (50),
ngay_sinh int,
so_cmnd int primary key,
luong int,
so_dien_thoai int primary key,
email varchar(100),
dia_chi varchar(50));

create table loai_khach(
ma_loai_khach int primary key,
ten_loai_khach varchar(50));
insert into loai_khach value(1,'Diamond'),
							(2,'Platinum'),
							(3,'Gold'),
							(4,'Silver'),
							(5,'Member');
select * from loai_khach;
create table kieu_thue(
ma_kieu_thue int primary key,
ten_kieu_thue varchar( 50));
insert into kieu_thue value(1,'Year'),
						   (2,'Month'),
						   (3,'Day'),
						   (4,'Hour');
select *from kieu_thue;

create table loai_dich_vu(
ma_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(20));
insert into loai_dich_vu value(1, 'Villa'),
							  (2, 'House'),
							  (3, 'Room');
select * from loai_dich_vu;

create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(50),
gia int,
don_vi varchar(30),
trang_thai varchar(100));
insert into dich_vu_di_kem value(1,'Karaoke',10000,'giờ','tiện nghi, hiện đại'),
								(2,'Thuê Xe Máy',10000,'chiếc','hỏng 1 xe'),
								(3,'Thuê Xe Đạp',20000,'chiếc','tốt'),
								(4,'Buffer Buổi Sáng',10000,'suất','đầy đủ đồ ăn tráng miệng'),
								(5,'Buffer Buổi Trưa',9000,'suất','đầy đủ đồ ăn tráng miệng'),
								(6,'Buffer Buổi Tối',8000,'suất','đầy đủ đồ ăn tráng miệng');
select * from dich_vu_di_kem;


