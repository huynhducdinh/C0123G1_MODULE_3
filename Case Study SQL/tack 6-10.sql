USE furama;
SELECT * FROM furama.dich_vu;
SELECT * FROM furama.loai_dich_vu;
SELECT * FROM furama.hop_dong;
-- tack 6

SELECT d.ma_dich_vu, d.ten_dich_vu,d.dien_tich,d.chi_phi_thue,ldv.ten_loai_dich_vu AS HH
FROM dich_vu AS d
INNER JOIN loai_dich_vu AS ldv ON d.ma_loai_dich_vu=ldv.ma_loai_dich_vu
INNER JOIN hop_dong AS h ON d.ma_dich_vu=h.ma_dich_vu
WHERE d.ma_dich_vu NOT IN(
SELECT h.ma_dich_vu
FROM hop_dong AS h
WHERE (YEAR(h.ngay_lam_hop_dong) IN (2021)) AND (MONTH(h.ngay_lam_hop_dong) IN (1,2,3)) )
GROUP BY ma_dich_vu
ORDER BY ten_dich_vu ;





-- tack 7
SELECT d.ma_dich_vu, d.ten_dich_vu,d.dien_tich,d.chi_phi_thue,ldv.ten_loai_dich_vu AS HH
FROM dich_vu AS d
INNER JOIN loai_dich_vu AS ldv ON d.ma_loai_dich_vu=ldv.ma_loai_dich_vu
INNER JOIN hop_dong AS h ON d.ma_dich_vu=h.ma_dich_vu
WHERE(YEAR(h.ngay_lam_hop_dong) IN (2020)) AND h.ma_dich_vu NOT IN (
SELECT h.ma_dich_vu
FROM hop_dong AS h
WHERE YEAR(h.ngay_lam_hop_dong ) IN ( 2021))
GROUP BY d.ma_dich_vu, d.ten_dich_vu,d.dien_tich,d.chi_phi_thue,ldv.ten_loai_dich_vu;

-- tack 8
SELECT DISTINCT ho_ten
FROM khach_hang;

SELECT ho_ten
FROM khach_hang 
GROUP BY ho_ten;

SELECT ho_ten
FROM khach_hang  
UNION
SELECT ho_ten
FROM khach_hang;
 
 -- tack 9
 
 SELECT MONTH(hd.ngay_lam_hop_dong) AS thang , COUNT(kh.ma_khach_hang) AS so_luong_khach_hang 
 FROM hop_dong hd
 INNER JOIN khach_hang kh ON hd.ma_khach_hang=kh.ma_khach_hang
 WHERE YEAR(hd.ngay_lam_hop_dong) = 2021
 GROUP BY thang
 ORDER BY thang ;
 
-- tack 10

SELECT hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc_hop_dong,hd.tien_dat_coc ,
SUM(ifnull(hdct.so_luong,0)) AS so_luong_dich_vu_di_kem
FROM hop_dong hd
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong=hdct.ma_hop_dong 
GROUP BY hd.ma_hop_dong
ORDER BY ma_hop_dong;





