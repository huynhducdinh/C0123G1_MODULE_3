USE furama;
-- tack 16
DELETE FROM nhan_vien
WHERE 
ma_nhan_vien NOT IN(
SELECT ma_nhan_vien
FROM hop_dong AS hd
WHERE YEAR(hd.ngay_lam_hop_dong)BETWEEN 2019 AND 2021);
SELECT * FROM nhan_vien;

-- tack 17