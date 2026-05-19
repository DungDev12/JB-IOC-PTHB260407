-- Tạo schema
CREATE SCHEMA infostudents;

-- Tạo table
CREATE TABLE infostudents.students(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	age INT NOT NULL,
	major VARCHAR(50),
	gpa DECIMAL(3,2) DEFAULT 0
);

-- Thêm dữ liệu
INSERT INTO infostudents.students (name,age,major,gpa) VALUES
('An', 20, 'CNTT', 3.5),
('Bình', 21, 'Toán', 3.2),
('Cường', 22, 'CNTT', 3.8),
('Dương', 20, 'Vật lý', 3.0),
('Em', 21, 'CNTT', 2.9);

-- 1.Thêm sinh viên mới: "Hùng", 23 tuổi, chuyên ngành "Hóa học", GPA 3.4
INSERT INTO infostudents.students (name,age,major,gpa) VALUES
('Hùng',23,'Hoá học',3.4);

-- 2.Cập nhật GPA của sinh viên "Bình" thành 3.6
UPDATE infostudents.students
SET gpa = 3.6
WHERE name = 'Bình';

-- 3.Xóa sinh viên có GPA thấp hơn 3.0
DELETE FROM infostudents.students
WHERE gpa < 3.0;
SELECT * FROM infostudents.students;
-- 4.Liệt kê tất cả sinh viên, chỉ hiển thị tên và chuyên ngành, sắp xếp theo GPA giảm dần
SELECT name, major
FROM infostudents.students
ORDER BY gpa DESC;

-- 5.Liệt kê tên sinh viên duy nhất có chuyên ngành "CNTT"
SELECT * 
FROM infostudents.students
WHERE major = 'CNTT'
LIMIT 1;

-- 6.Liệt kê sinh viên có GPA từ 3.0 đến 3.6
SELECT *
FROM infostudents.students
WHERE gpa BETWEEN 3.0 AND 3.6;

-- 7.Liệt kê sinh viên có tên bắt đầu bằng chữ 'C' (sử dụng LIKE/ILIKE)
SELECT *
FROM infostudents.students
WHERE name ILIKE 'C%';	

-- 8.Hiển thị 3 sinh viên đầu tiên theo thứ tự tên tăng dần, hoặc lấy từ sinh viên thứ 2 đến thứ 4 bằng LIMIT và OFFSET
SELECT *
FROM infostudents.students
ORDER BY name ASC
LIMIT 3;

SELECT *
FROM infostudents.students
ORDER BY name ASC
LIMIT 3 OFFSET 1;