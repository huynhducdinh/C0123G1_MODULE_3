USE furama;
-- tack 16
SET FOREIGN_KEY_CHECKS = 1;
DELETE FROM nhan_vien
WHERE 
ma_nhan_vien NOT IN(
SELECT ma_nhan_vien
FROM hop_dong AS hd
WHERE YEAR(hd.ngay_lam_hop_dong)BETWEEN 2019 AND 2021);
SELECT * FROM nhan_vien;


-- tack 16
-- SET sql_safe_updates=0;
-- UPDATE nhan_vien SET is_delete = 0 -- dùm biến cờ
-- WHERE is_delete =1 AND nhan_vien.ma_nhan_vien NOT IN (
-- SELECT hd.ma_nhan_vien
-- FROM hop_dong AS hd
-- WHERE YEAR(hd.ngay_lam_hop_dong)BETWEEN 2019  AND 2021);
-- SET sql_safe_updates=1;
-- SELECT * FROM nhan_vien AS nv WHERE nv.is_delete =0;

-- tack 17
  CREATE VIEW v_khach_hang AS
  
  SELECT kh.ma_khach_hang,kh.ho_ten,lk.ma_loai_khach,
    IFNULL((SUM(IFNULL((hdct.so_luong * dvdk.gia),0)) + dv.chi_phi_thue),0) AS tong_tien
    FROM khach_hang AS kh
	LEFT JOIN loai_khach AS lk ON lk.ma_loai_khach=kh.ma_loai_khach_hang
	LEFT JOIN hop_dong AS hd ON kh.ma_khach_hang=hd.ma_khach_hang
	LEFT JOIN dich_vu AS dv ON dv.ma_dich_vu =hd.ma_dich_vu
	LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong=hdct.ma_hop_dong
	LEFT JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
    WHERE (YEAR(hd.ngay_lam_hop_dong)=2021) AND (lk.ten_loai_khach)= 'Platinum'
    GROUP BY ma_khach_hang
    HAVING (tong_tien >100000);
    UPDATE khach_hang SET ma_loai_khach_hang =1 WHERE ma_khach_hang IN (
    SELECT ma_khach_hang
    FROM v_khach_hang);
    
-- tack 18 
SET FOREIGN_KEY_CHECKS = 0;-- chỉ định có hay không kiểm tra các ràng buộc khóa ngoại đối với các bảng
DELETE FROM khach_hang AS kh
WHERE kh.ma_khach_hang IN (
SELECT hd.ma_khach_hang
FROM hop_dong AS hd
WHERE (YEAR(hd.ngay_lam_hop_dong) < 2021));
SET FOREIGN_KEY_CHECKS = 1;

-- tack 19
SET SQL_SAFE_UPDATES=0;
UPDATE dich_vu_di_kem SET gia = gia * 2
WHERE dich_vu_di_kem.ma_dich_vu_di_kem IN (
    SELECT ma_dich_vu_di_kem FROM (
    SELECT dvdk.ma_dich_vu_di_kem, SUM(hdct.so_luong) AS so_lan_su_dung
	FROM hop_dong_chi_tiet AS hdct
	INNER JOIN dich_vu_di_kem AS dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
	GROUP BY hdct.ma_dich_vu_di_kem
	HAVING so_lan_su_dung > 10) AS temp);
SET SQL_SAFE_UPDATES=1;
-- tack 20
 SELECT  nv.ma_nhan_vien AS id , nv.ho_ten,nv.email,nv.ngay_sinh,nv.so_dien_thoai,nv.email FROM nhan_vien AS nv
 UNION ALL
 SELECT kh.ma_khach_hang AS id , kh.ho_ten,kh.email,kh.ngay_sinh,kh.so_dt,kh.email FROM khach_hang AS kh;
