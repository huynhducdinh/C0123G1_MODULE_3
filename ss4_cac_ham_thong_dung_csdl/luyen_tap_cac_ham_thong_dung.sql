USE quan_ly_sinh_vien;
SELECT * FROM quan_ly_sinh_vien.student;
SELECT * FROM quan_ly_sinh_vien.mark;
SELECT * FROM quan_ly_sinh_vien.subjects;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất

SELECT sb.*,sb.credit
FROM subjects sb
WHERE sb.credit=( SELECT MAX(credit) FROM subjects);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

SELECT sb.*,m.mark AS max_mark
FROM subjects AS sb
JOIN mark AS m ON sb.sub_id=m.sub_id
WHERE m.mark=(SELECT MAX(mark) FROM mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

SELECT s.*, AVG(m.mark) AS diem_trung_binh
FROM student AS s
JOIN mark AS m ON s.student_id=m.student_id
GROUP BY s.student_id
ORDER BY diem_trung_binh DESC;



