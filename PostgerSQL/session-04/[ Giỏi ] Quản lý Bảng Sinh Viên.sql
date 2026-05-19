-- Tạo Schema
CREATE SCHEMA infostudents;

-- Tạo Table
CREATE TABLE infostudents.students(
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(50) NOT NULL,
	gender VARCHAR(5) NOT NULL,
	birth_year INT CHECK (birth_year BETWEEN 1900 AND 2100 ) NOT NULL,
	major VARCHAR(50) NOT NULL,
	gpa DECIMAL(3,2) DEFAULT 0
);

-- Thêm dữ liệu
INSERT INTO infostudents.students (full_name, gender, birth_year, major, gpa) VALUES
('Nguyễn Văn A','Nam',2002,'CNTT',3.6),
('Trần Thị Bích Ngọc','Nữ',2001,'Kinh tế',3.2),
('Lê Quốc Cường','Nam',2003,'CNTT',2.7),
('Phạm Minh Anh','Nữ',2000,'Luật',3.9),
('Nguyễn Văn A','Nam',2002,'CNTT',3.6),
('Lưu Đức Tài',2004,2004,'Cơ khí',NULL),
('Võ Thị Thu Hằng','Nữ',2001,'CNTT',3.0);

-- 1. Chèn dữ liệu mới: Thêm sinh viên “Phan Hoàng Nam”, giới tính Nam, sinh năm 2003, ngành CNTT, GPA 3.8
INSERT INTO infostudents.students (full_name, gender, birth_year, major, gpa) VALUES
('Phan Hoàng Nam', 'Nam', 2003, 'CNTT',3.8);

-- 2. Cập nhật dữ liệu: Sinh viên “Lê Quốc Cường” vừa cải thiện học lực, cập nhật gpa = 3.4
UPDATE infostudents.students
SET gpa = 3.4
WHERE full_name = 'Lê Quốc Cường';

-- 3. Xóa dữ liệu: Xóa tất cả sinh viên có gpa IS NULL
DELETE FROM infostudents.students
WHERE gpa IS NULL;

-- 4. Truy vấn cơ bản: Hiển thị sinh viên ngành CNTT có gpa >= 3.0, chỉ lấy 3 kết quả đầu tiên
SELECT *
FROM infostudents.students
WHERE major = 'CNTT' AND gpa >= 3.0
LIMIT 3;

-- 5.Loại bỏ trùng lặp: Liệt kê danh sách ngành học duy nhất
SELECT DISTINCT major
FROM infostudents.students;

-- 6.Sắp xếp: Hiển thị sinh viên ngành CNTT, sắp xếp giảm dần theo GPA, sau đó tăng dần theo tên
SELECT *
FROM infostudents.students
WHERE major = 'CNTT'
ORDER BY gpa DESC, full_name ASC;

-- 7.Tìm kiếm: Tìm sinh viên có tên bắt đầu bằng “Nguyễn”
SELECT *
FROM infostudents.students
WHERE full_name ILIKE 'nguyễn%';

-- 8.Khoảng giá trị: Hiển thị sinh viên có năm sinh từ 2001 đến 2003
SELECT *
FROM infostudents.students
WHERE birth_year BETWEEN 2001 AND 2003;

