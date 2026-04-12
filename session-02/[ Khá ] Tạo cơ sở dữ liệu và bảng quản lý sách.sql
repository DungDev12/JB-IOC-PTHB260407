-- Tạo Database
CREATE DATABASE librarydb;
-- Kết nối database mới tạo librarydb

-- Tạo Schema
CREATE SCHEMA library;

-- Tạo Bảng (Table)
CREATE TABLE library.books(
	book_id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	author VARCHAR(50) NOT NULL,
	published_year INT,
	price FLOAT
);

-- Xem tất cả các database
SELECT current_database();

-- Xem tất cả các schema trong database
SELECT schema_name
FROM information_schema.schemata;

-- Xem cấu trúc bảng Books
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'books';