USE furama;
-- tack 11
SELECT  dvdk.ma_dich_vu_di_kem , 
	    dvdk.ten_dich_vu_di_kem
FROM dich_vu_di_kem dvdk
INNER JOIN hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
INNER JOIN hop_dong hd ON hdct.ma_hop_dong=hd.ma_hop_dong
INNER JOIN khach_hang kh ON hd.ma_khach_hang=kh.ma_khach_hang
INNER JOIN loai_khach lk ON kh.ma_loai_khach_hang=lk.ma_loai_khach
WHERE ((lk.ten_loai_khach ='Diamond') AND((kh.dia_chi LIKE '%Vinh') OR (kh.dia_chi LIKE '%Quảng Ngãi')));

-- tack 12
SELECT * FROM furama.dich_vu_di_kem;
SELECT * FROM furama.hop_dong_chi_tiet;
SELECT * FROM furama.hop_dong;
SELECT  hd.ma_hop_dong, 
		nv.ho_ten AS ho_ten_nhan_vien,
		kh.ho_ten AS ho_ten_khach_hang,
		kh.so_dt AS sdt_khach_hang,
		dv.ma_dich_vu, dv.ten_dich_vu,
        SUM(IFNULL(hdct.so_luong,0)) AS so_luong_dich_vu_di_kem,
       hd.tien_dat_coc 
FROM  hop_dong hd
LEFT JOIN nhan_vien nv ON hd.ma_nhan_vien=nv.ma_nhan_vien
LEFT JOIN khach_hang kh ON kh.ma_khach_hang=hd.ma_khach_hang
LEFT JOIN dich_vu dv ON hd.ma_dich_vu=dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong=hdct.ma_hop_dong
WHERE (YEAR(hd.ngay_lam_hop_dong) =2020 AND (MONTH(hd.ngay_lam_hop_dong)IN(10,11,12))) AND hd.ma_hop_dong NOT IN(
YEAR(hd.ngay_lam_hop_dong)=2021 AND MONTH(hd.ngay_lam_hop_dong) BETWEEN 1 AND 6)
GROUP BY hd.ma_hop_dong;

-- tack 13
SELECT * FROM furama.hop_dong_chi_tiet;
SELECT dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem,
SUM(IFNULL(hdct.so_luong,0)) AS so_luong_dich_vu_di_kem
FROM dich_vu_di_kem dvdk
LEFT JOIN hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING so_luong_dich_vu_di_kem = SUM(hdct.so_luong)
ORDER BY so_luong_dich_vu_di_kem DESC
LIMIT 2;

-- tack 14
SELECT  hd.ma_hop_dong,
ldv.ten_loai_dich_vu, 
dvdk.ten_dich_vu_di_kem,
COUNT(hdct.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM hop_dong  hd
INNER JOIN dich_vu  dv ON hd.ma_dich_vu = dv.ma_dich_vu
INNER JOIN loai_dich_vu  ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
INNER JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
INNER JOIN dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong,
ldv.ten_loai_dich_vu, 
dvdk.ten_dich_vu_di_kem
HAVING dvdk.ten_dich_vu_di_kem IN ( -- Kiểm tra dk đếm số lần xuất hiện.
SELECT dvdk.ten_dich_vu_di_kem, hdct.ma_dich_vu_di_kem
 FROM hop_dong_chi_tiet hdct
INNER JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem= dvdk.ma_dich_vu_di_kem
GROUP BY hdct.ma_dich_vu_di_kem
HAVING COUNT(*)=1 -- Kiểm tra trong tất cả tên_dịch_vụ_đi_kèm cái nào xuất hiện 1 lần xẽ lấy ra.
);
 
-- tack 15
SELECT 	nv.ma_nhan_vien,
nv.ho_ten,
td.ma_trinh_do,
bp.ten_bo_phan,
nv.so_dien_thoai,
nv.dia_chi
FROM nhan_vien nv 
INNER JOIN hop_dong hd ON nv.ma_nhan_vien=hd.ma_nhan_vien
INNER JOIN trinh_do td ON td.ma_trinh_do=nv.ma_trinh_do
INNER JOIN bo_phan bp ON bp.ma_bo_phan= nv.ma_bo_phan
WHERE YEAR(hd.ngay_lam_hop_dong ) BETWEEN 2020 AND 2021 
GROUP BY hd.ma_nhan_vien
HAVING COUNT(hd.ma_nhan_vien)<=3;
