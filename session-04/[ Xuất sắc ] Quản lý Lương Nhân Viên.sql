-- Tạo Schema
CREATE SCHEMA company;

-- Tạo Bảng
CREATE TABLE company.employees(
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(50) NOT NULL,
	department VARCHAR(50) NOT NULL,
	position VARCHAR(50) NOT NULL,
	salary INT,
	bonus INT,
	join_year INT CHECK (join_year BETWEEN 1900 AND 2100)
);

-- Thêm dữ liệu
INSERT INTO company.employees (full_name, department, position, salary, bonus, join_year) VALUES
('Nguyễn Văn Huy','IT','Developer',18000000,1000000,2021),
('Trần Thị Mai','HR','Recruiter',12000000,NULL,2020),
('Lê Quốc Trung','IT','Tester',15000000,800000,2023),
('Nguyễn Văn Huy','IT','Developer',18000000,1000000,2021),
('Phạm Ngọc Hân','Finance','Accountant',14000000,NULL,2019),
('Bùi Thị Lan','HR','HR Manager',20000000,3000000,2018),
('Đặng Hữu Tài','IT','Developer',17000000,NULL,2022);

SELECT * FROM company.employees;
DELETE FROM company.employees
-- 1.Chuẩn hóa dữ liệu: Xóa các bản ghi trùng nhau hoàn toàn về tên, phòng ban và vị trí

--- Tìm dữ liệu không trùng
SELECT MIN(ID)
FROM company.employees
GROUP BY full_name, department, position;
--- Xoá dữ liệu trùng ( phủ định )
DELETE FROM company.employees
WHERE id NOT IN (
	SELECT MIN(ID)
	FROM company.employees
	GROUP BY full_name, department, position
);

-- 2. Cập nhật lương thưởng:
--- a. Tăng 10% lương cho những nhân viên làm trong phòng IT có mức lương dưới 18,000,000
UPDATE company.employees
SET salary = salary * 1.1
WHERE department = 'IT' AND salary < 18000000;
--- b. Với nhân viên có bonus IS NULL, đặt giá trị bonus = 500000
UPDATE company.employees
SET bonus = 500000
WHERE bonus IS NULL;

-- 3.Truy vấn:
--- a. Hiển thị danh sách nhân viên thuộc phòng IT hoặc HR, gia nhập sau năm 2020, và có tổng thu nhập (salary + bonus) lớn hơn 15,000,000
SELECT *
FROM company.employees
WHERE department 
	IN ('IT','HR')
	AND join_year > 2020
	AND salary + bonus > 15000000;
--- b. Chỉ lấy 3 nhân viên đầu tiên sau khi sắp xếp giảm dần theo tổng thu nhập
SELECT *
FROM company.employees
ORDER BY (salary + bonus) DESC
LIMIT 3;

-- 4.Truy vấn theo mẫu tên: Tìm tất cả nhân viên có tên bắt đầu bằng “Nguyễn” hoặc kết thúc bằng “Hân”
SELECT *
FROM company.employees
WHERE full_name ILIKE 'nguyễn%' 
	OR full_name ILIKE '%hân';

-- 5.Truy vấn đặc biệt: Liệt kê các phòng ban duy nhất có ít nhất một nhân viên có bonus IS NOT NULL
SELECT DISTINCT department
FROM company.employees
WHERE bonus IS NOT NULL;


-- 6.Khoảng thời gian làm việc: Hiển thị nhân viên gia nhập trong khoảng từ 2019 đến 2022 (BETWEEN)
SELECT *
FROM company.employees
WHERE join_year BETWEEN 2019 AND 2022;