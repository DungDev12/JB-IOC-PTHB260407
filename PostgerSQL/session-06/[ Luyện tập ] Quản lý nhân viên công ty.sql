CREATE SCHEMA company;

CREATE TABLE company.Employee(
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(100),
	department VARCHAR(50),
	salary NUMERIC(10,2),
	hire_date DATE
);

INSERT INTO company.Employee (full_name, department, salary, hire_date) VALUES
('Nguyễn Văn An', 'IT', 15000000, '2022-01-10'),
('Trần Thị Bình', 'HR', 12000000, '2021-03-15'),
('Lê Văn Cường', 'IT', 8000000, '2020-07-20'),
('Phạm Thị Dung', 'Finance', 9000000, '2019-11-05'),
('Hoàng Văn An', 'IT', 5000000, '2023-02-01'),
('Nguyễn Thị Phương', 'HR', 4000000, '2022-06-18');

UPDATE company.Employee
SET salary = salary * 1.1
WHERE department = 'IT';

DELETE FROM company.Employee
WHERE salary < 6000000;

SELECT *
FROM company.Employee
WHERE full_name ILIKE '%an';

SELECT *
FROM company.Employee
WHERE hire_date 
	BETWEEN '2023-01-01' AND '2023-12-31';