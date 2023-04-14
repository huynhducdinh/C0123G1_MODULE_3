USE furama;
SELECT * FROM furama.dich_vu;
SELECT * FROM furama.loai_dich_vu;
SELECT * FROM furama.hop_dong;
-- tack 6

SELECT d.ma_dich_vu, d.ten_dich_vu,d.dien_tich,d.chi_phi_thue,ldv.ten_loai_dich_vu AS HH
FROM dich_vu AS d
JOIN loai_dich_vu AS ldv ON d.ma_loai_dich_vu=ldv.ma_loai_dich_vu
JOIN hop_dong AS h ON d.ma_dich_vu=h.ma_dich_vu
WHERE h.ma_dich_vu NOT IN(
SELECT h.ma_dich_vu
FROM hop_dong AS h
WHERE (YEAR(h.ngay_lam_hop_dong) IN (2020)) AND (MONTH(h.ngay_lam_hop_dong) IN (1,2,3)) )
-- WHERE h.ngay_lam_hop_dong BETWEEN '2021-01-01' AND '2021-03-31'
GROUP BY d.ma_dich_vu, d.ten_dich_vu,d.dien_tich,d.chi_phi_thue,ldv.ten_loai_dich_vu;

-- tack 7
SELECT d.ma_dich_vu, d.ten_dich_vu,d.dien_tich,d.chi_phi_thue,ldv.ten_loai_dich_vu AS HH
FROM dich_vu AS d
JOIN loai_dich_vu AS ldv ON d.ma_loai_dich_vu=ldv.ma_loai_dich_vu
JOIN hop_dong AS h ON d.ma_dich_vu=h.ma_dich_vu
WHERE(YEAR(h.ngay_lam_hop_dong) IN (2020)) AND h.ma_dich_vu NOT IN (
SELECT h.ma_dich_vu
FROM hop_dong AS h
WHERE YEAR(h.ngay_lam_hop_dong ) IN ( 2021))
GROUP BY d.ma_dich_vu, d.ten_dich_vu,d.dien_tich,d.chi_phi_thue,ldv.ten_loai_dich_vu;

-- tack 8
-- SELECT DISTINCT ho_ten
-- FROM khach_hang;

-- SELECT ho_ten
-- FROM khach_hang 
-- GROUP BY ho_ten;

-- SELECT ho_ten
-- FROM khach_hang  
-- UNION
-- SELECT ho_ten
 -- FROM khach_hang;



