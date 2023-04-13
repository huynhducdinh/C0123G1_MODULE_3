USE furama;
-- tack 2
SELECT *  FROM nhan_vien
 WHERE ho_ten REGEXP '^[HTK]'AND CHAR_LENGTH(ho_ten) <= 15;

 
 -- tack 3
 SELECT * FROM khach_hang
WHERE (YEAR(CURDATE()) - YEAR(ngay_sinh) BETWEEN 18 AND 50) AND (dia_chi LIKE '%Đà Nẵng' OR dia_chi LIKE '%Quảng Trị%');
										
-- tack 4
 SELECT * FROM hop_dong;
 SELECT * FROM loai_khach;
SELECT khach_hang.ma_khach_hang,khach_hang.ho_ten, COUNT(ma_hop_dong) AS so_lan_dat_phong
FROM khach_hang
JOIN hop_dong ON khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
JOIN loai_khach ON loai_khach.ma_loai_khach=khach_hang.ma_loai_khach_hang
WHERE loai_khach.ten_loai_khach = 'Diamond'
GROUP BY ma_khach_hang 
ORDER BY so_lan_dat_phong ;

-- tack 5
SELECT  khach_hang.ma_khach_hang,
		khach_hang.ho_ten,
		loai_khach.ten_loai_khach,
		hop_dong.ma_hop_dong,
		dich_vu.ten_dich_vu,
		hop_dong.ngay_lam_hop_dong,
		hop_dong.ngay_ket_thuc_hop_dong,(dich_vu.chi_phi_thue)+(hop_dong_chi_tiet.so_luong)*(dich_vu_di_kem.gia) AS tong_tien
FROM khach_hang
LEFT JOIN khach_hang ON khach_hang.ma_khach_hang=loai_khach.ma_loai_khach_hang
ORDER BY ma_khach_hang,ma_hop_dong;





 
