-- Tạo database
CREATE DATABASE UniversityDB;

-- Tạo schema
CREATE SCHEMA university;

-- Tạo Table Student
CREATE TABLE university.students(
	student_id SERIAL PRIMARY KEY,
	first_name	VARCHAR(50) NOT NULL,
	last_name	VARCHAR(50) NOT NULL,
	birth_date  DATE,
	email VARCHAR(255) NOT NULL UNIQUE
);

-- Tạo Table Student
CREATE TABLE university.courses(
	course_id  SERIAL PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL,
	credits 	INT
);

-- Tạo Table Enrollments 
CREATE TABLE university.enrollments(
	enrollment_id  SERIAL PRIMARY KEY,
	enroll_date  DATE,
	student_id INT REFERENCES university.students(student_id),
	courses_id INT REFERENCES university.courses(course_id)
);

-- Xem tất cả các database
SELECT current_database();

-- Xem tất cả các schema trong database
SELECT schema_name
FROM information_schema.schemata;

-- Xem cấu trúc bảng Students, Courses, Enrollments
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'students';

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'courses';
SELECT column_name

FROM information_schema.columns
WHERE table_name = 'enrollments';

