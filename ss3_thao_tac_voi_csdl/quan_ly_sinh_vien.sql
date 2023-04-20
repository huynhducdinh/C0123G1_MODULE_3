CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;
 
CREATE TABLE class(
	class_id INT PRIMARY KEY AUTO_INCREMENT,
	class_name VARCHAR(45) NOT NULL,
	start_date DATE NOT NULL,
	statuses BIT
);
INSERT INTO class(class_name,start_date,statuses) 
VALUES('A1','2008-12-20',1),
	  ('A2','2008-12-22',1),
	  ('B3','2012-04-13',0);
SELECT * FROM class;

CREATE TABLE student(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
	student_name VARCHAR(45) NOT NULL,
	address VARCHAR(45),
	phone VARCHAR(10),
	statuses BIT,
	class_id INT, FOREIGN KEY(class_id) REFERENCES class(class_id)
);
INSERT INTO student(student_name,address,phone,statuses,class_id)
		VALUES  ('Huynh','Ha Noi',0912113113,1,1);

INSERT INTO student(student_name,address,statuses,class_id) 
		VALUES  ('Hoa','Hai Phong',1,1);

INSERT INTO student(student_name,address,phone,statuses,class_id) 
		VALUES  ('Manh','HCM',0123123123,0,2);

SELECT * FROM student;

CREATE TABLE subjects(
sub_id INT PRIMARY KEY AUTO_INCREMENT,
sub_name VARCHAR(45),
credit INT,
statuses BIT
);
INSERT INTO subjects(sub_name,credit,statuses)
VALUES ( 'CF', 5, 1),
       ( 'C', 6, 1),
       ( 'HDJ', 5, 1),
       ( 'RDBMS', 10, 1);
SELECT * FROM subjects;

CREATE TABLE mark(
	mark_id INT PRIMARY KEY AUTO_INCREMENT,
	sub_id INT,
	student_id INT,
UNIQUE(sub_id,student_id),
FOREIGN KEY (sub_id) REFERENCES subjects (sub_id),
FOREIGN KEY (student_id) REFERENCES student(student_id),
	poin INT CHECK(poin > 0 AND poin < 100),
	exam_times INT NOT NULL
);
INSERT INTO mark(sub_id,student_id,poin,exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
SELECT * FROM mark;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT * FROM student
WHERE student_name LIKE 'H%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT * FROM class
WHERE start_date LIKE '%-12-%';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
 SELECT * FROM subjects
 WHERE credit BETWEEN 3 AND 5;
 
 -- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
 SET SQL_SAFE_UPDATES =0;
 UPDATE student SET class_id=2
 WHERE student.student_name='HUNG';
SET SQL_SAFE_UPDATES =1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT student.student_name,subjects.sub_name,mark.poin
FROM mark
JOIN student ON student.student_id=mark.student_id
JOIN subjects ON subjects.sub_id=mark.sub_id
ORDER BY poin DESC;

DROP DATABASE quan_ly_sinh_vien;