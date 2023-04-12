CREATE DATABASE chuyen_doi_erd_sang_quan_he;
USE chuyen_doi_erd_sang_quan_he;

CREATE TABLE phieu_xuat(
	so_phieu_xuat INT PRIMARY KEY,
    ngay_xuat DATE NOT NULL
);

CREATE TABLE phieu_nhap(
	so_phieu_nhap INT PRIMARY KEY,
	ngay_nhap DATE NOT NULL
    );

CREATE TABLE vat_tu(
	ma_vat_tu INT PRIMARY KEY,
    ten_vat_tu VARCHAR(100) NOT NULL 
    );
    
CREATE TABLE nha_cung_cap(
    ma_nha_cc INT PRIMARY KEY,
    ten_nha_cc VARCHAR(100)NOT NULL,
    dia_chi VARCHAR(50)NOT NULL
    );
    
CREATE TABLE don_dat_hang(
    so_don_hang INT PRIMARY KEY,
    ngay_dat_hang DATE NOT NULL,
    ma_nha_cc INT ,
FOREIGN KEY (ma_nha_cc) REFERENCES nha_cung_cap(ma_nha_cc)
    );

CREATE TABLE chi_tiet_phieu_xuat(
	don_gia_xuat FLOAT,
	so_luong_xuat VARCHAR(45),
    so_phieu_xuat INT,
    ma_vat_tu INT,
PRIMARY KEY (so_phieu_xuat,ma_vat_tu),
FOREIGN KEY (so_phieu_xuat) REFERENCES phieu_xuat(so_phieu_xuat),
FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu(ma_vat_tu)
);

CREATE TABLE chi_tiet_phieu_nhap(
	don_gia_nhap FLOAT,
	so_luong_nhap VARCHAR(45),
    so_phieu_nhap INT,
    ma_vat_tu INT,
PRIMARY KEY (so_phieu_nhap,ma_vat_tu),
FOREIGN KEY (so_phieu_nhap) REFERENCES phieu_nhap(so_phieu_nhap),
FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu(ma_vat_tu)
);

CREATE TABLE chi_tiet_don_dat_hang(
	so_don_hang INT,
	ma_vt INT,
PRIMARY KEY (so_don_hang,ma_vt),
FOREIGN KEY(so_don_hang)REFERENCES don_dat_hang(so_don_hang),
FOREIGN KEY(ma_vt)REFERENCES vat_tu(ma_vat_tu)
);

CREATE TABLE sdt(
	sdt VARCHAR(10)NOT NULL,
	ma_nha_cc INT, FOREIGN KEY(ma_nha_cc)REFERENCES nha_cung_cap(ma_nha_cc)
);
DROP DATABASE chuyen_doi_erd_sang_quan_he;

    