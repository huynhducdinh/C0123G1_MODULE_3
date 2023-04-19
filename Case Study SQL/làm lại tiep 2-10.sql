 USE furama;
 -- tack 2
  
  SELECT nv.ma_nhan_vien, nv.ho_ten
  FROM nhan_vien AS nv
  WHERE (ho_ten REGEXP '^[HTK]') AND CHAR_LENGTH(ho_ten)<=15;
   
   -- tack 3
   
   SELECT kh.ma_khach_hang,kh.ho_ten
   FROM khach_hang AS kh
   WHERE YEAR(CURDATE())- YEAR(ngay_sinh BETWEEN 18 AND 50) AND (dia_chi LIKE '% Đà Nẵng' OR dia_chi LIKE '% Quãng Trị' );
   
   -- tack 4
    SELECT kh.ma_khach_hang, kh.ho_ten ,COUNT(ma_hop_dong) AS so_lan_dat
    FROM khach_hang AS kh
    INNER JOIN  hop_dong AS hd ON kh.ma_khach_hang= hd.ma_hop_dong
    INNER JOIN loai_khach AS lk ON lk.ma_loai_khach=kh.ma_loai_khach_hang
    WHERE lk.ten_loai_khach ='Diamond'
    GROUP BY ma_khach_hang
    ORDER BY so_lan_dat;
    
    -- Tack 5
    
    SELECT kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc_hop_dong,
    (IFNULL(dv.chi_phi_thue,0)+SUM(IFNULL(hdct.so_luong,0)*(IFNULL(dvdk.gia,0)))) AS tong_tien
   -- IFNULL((SUM(IFNULL((hdct.so_luong * dvdk.gia),0)) + dv.chi_phi_thue),0) AS tong_tien
    FROM khach_hang AS kh
    LEFT JOIN loai_khach AS lk ON lk.ma_loai_khach=kh.ma_loai_khach_hang
    LEFT JOIN hop_dong AS hd ON kh.ma_khach_hang=hd.ma_khach_hang
    LEFT JOIN dich_vu AS dv ON dv.ma_dich_vu=hd.ma_dich_vu
    LEFT JOIN hop_dong_chi_tiet AS hdct ON hd.ma_hop_dong=hdct.ma_hop_dong
    LEFT JOIN dich_vu_di_kem AS dvdk ON dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
    GROUP BY ma_khach_hang,ma_hop_dong;
    
    -- tack 6
    
    SELECT dv.ma_dich_vu,dv.ten_dich_vu, dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu
    FROM dich_vu AS dv
    INNER JOIN loai_dich_vu AS ldv ON ldv.ma_loai_dich_vu=dv.ma_loai_dich_vu
    WHERE dv.ma_dich_vu NOT IN(
    SELECT hd.ma_dich_vu
    FROM hop_dong AS hd
    WHERE (YEAR(hd.ngay_lam_hop_dong) =2021)AND MONTH(hd.ngay_lam_hop_dong)IN (1,2,3));
    
    -- tack 7
    
    SELECT DISTINCT dv.ma_dich_vu,dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dich_vu
    FROM dich_vu AS dv
    LEFT JOIN loai_dich_vu AS ldv ON  ldv.ma_loai_dich_vu=dv.ma_loai_dich_vu
    LEFT JOIN hop_dong AS hd ON dv.ma_dich_vu=hd.ma_dich_vu
    WHERE (YEAR(hd.ngay_lam_hop_dong)=2020)AND hd.ma_hop_dong NOT IN (
    SELECT hd.ma_dich_vu
    FROM hop_dong AS hd
    WHERE (YEAR(hd.ngay_lam_hop_dong )=2021));

    
    -- tach 8
    
    SELECT DISTINCT kh.ma_khach_hang,kh.ho_ten
    FROM khach_hang AS kh;
    
    SELECT kh.ma_khach_hang,kh.ho_ten FROM khach_hang AS kh
    UNION
    SELECT kh.ma_khach_hang,kh.ho_ten FROM khach_hang AS kh;
    
    SELECT kh.ma_khach_hang,kh.ho_ten FROM khach_hang AS kh
    GROUP BY ma_khach_hang;
    
    -- tack 9
    
    SELECT MONTH(hd.ngay_lam_hop_dong) AS thang , COUNT(kh.ma_khach_hang) AS sl_kh
    FROM khach_hang AS kh
    INNER JOIN hop_dong AS hd ON kh.ma_khach_hang= hd.ma_khach_hang
    WHERE (YEAR(hd.ngay_lam_hop_dong )=2021)
    GROUP BY thang
    ORDER BY thang ;
    
    -- tack 10
    
    SELECT hd.ma_hop_dong,hd.ngay_lam_hop_dong, hd.ngay_ket_thuc_hop_dong,hd.tien_dat_coc,
    SUM(IFNULL(hdct.so_luong,0)) AS sl_dv_di_kem
    FROM hop_dong AS hd
    LEFT JOIN hop_dong_chi_tiet AS hdct ON hd.ma_hop_dong=hdct.ma_hop_dong
    GROUP BY ma_hop_dong
    ORDER BY sl_dv_di_kem DESC;
    
    -- tack 11
	
    