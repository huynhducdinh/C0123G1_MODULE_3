		USE furama;
-- tack 2
SELECT *  FROM nhan_vien
 WHERE ho_ten REGEXP '^[HTK]'AND CHAR_LENGTH(ho_ten) <= 15;

 
 -- tack 3
SELECT * FROM khach_hang
WHERE (YEAR(CURDATE()) - YEAR(ngay_sinh) BETWEEN 18 AND 50) AND (dia_chi LIKE '%Đà Nẵng' OR dia_chi LIKE '%Quảng Trị%');
										
-- tack 4

SELECT khach_hang.ma_khach_hang,khach_hang.ho_ten, COUNT(ma_hop_dong) AS so_lan_dat_phong
FROM khach_hang
INNER JOIN hop_dong ON khach_hang.ma_khach_hang=hop_dong.ma_khach_hang
INNER JOIN loai_khach ON loai_khach.ma_loai_khach=khach_hang.ma_loai_khach_hang
WHERE loai_khach.ten_loai_khach = 'Diamond'
GROUP BY ma_khach_hang 
ORDER BY so_lan_dat_phong ;

-- tack 5
SELECT  k.ma_khach_hang,k.ho_ten,
		l.ten_loai_khach,h.ma_hop_dong,
        d.ten_dich_vu,h.ngay_lam_hop_dong,
        h.ngay_ket_thuc_hop_dong,
       (ifnull(d.chi_phi_thue, 0) + SUM(ifnull(dich_vu_di_kem.gia, 0)) * ifnull(hop_dong_chi_tiet.so_luong, 0)) AS tong_tien
FROM khach_hang  AS k 
LEFT JOIN loai_khach AS l ON k.ma_loai_khach_hang=l.ma_loai_khach
LEFT JOIN hop_dong AS h ON k.ma_khach_hang=h.ma_khach_hang 
LEFT JOIN dich_vu AS d ON h.ma_dich_vu=d.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet ON  h.ma_hop_dong=hop_dong_chi_tiet.ma_hop_dong
LEFT JOIN  dich_vu_di_kem ON hop_dong_chi_tiet.ma_dich_vu_di_kem = dich_vu_di_kem.ma_dich_vu_di_kem
GROUP BY k.ma_khach_hang;
       -- SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
		








 
