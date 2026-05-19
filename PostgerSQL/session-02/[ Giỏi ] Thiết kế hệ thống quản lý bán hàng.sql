-- Tạo Database
CREATE DATABASE SalesDB;

-- Tạo Schema
CREATE SCHEMA sales;

-- Tạo Table
CREATE TABLE sales.customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	phone VARCHAR(10) UNIQUE
);

CREATE TABLE sales.products(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	price FLOAT NOT NULL,
	stock_quantity INT CHECK (stock_quantity >= 0) NOT NULL DEFAULT 0
);

CREATE TABLE sales.orders(
	order_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES sales.customers(customer_id),
	order_date DATE NOT NULL DEFAULT (CURRENT_DATE)
);

CREATE TABLE sales.orderItems(
	order_item_id SERIAL PRIMARY KEY,
	order_id INT REFERENCES sales.orders(order_id),
	product_id INT REFERENCES sales.products(product_id),
	quantity INT CHECK (quantity >= 1) NOT NULL DEFAULT 1
);