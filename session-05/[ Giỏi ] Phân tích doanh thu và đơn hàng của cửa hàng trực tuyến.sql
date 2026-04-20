CREATE SCHEMA shop;

CREATE TABLE shop.customers(
	customer_id SERIAL PRIMARY KEY,
	customer_name VARCHAR(100),
	city VARCHAR(50)
);

CREATE TABLE shop.orders(
	order_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES shop.customers(customer_id),
	order_date DATE,
	total_amount NUMERIC(10,2)
);

CREATE TABLE shop.order_items(
	item_id SERIAL PRIMARY KEY,
	order_id INT REFERENCES shop.orders(order_id),
	product_name VARCHAR(100),
	quantity INT,
	price NUMERIC(10,2)
);

INSERT INTO shop.customers (customer_name, city) VALUES 
('Nguyễn Văn A', 'Hà Nội'),
('Trần Thị B', 'Đà Nẵng'),
('Lê Văn C', 'Hồ Chí Minh'),
('Phạm Thị D', 'Hà Nội'),
('Hoàng Văn E', 'Cần Thơ'),
('Nguyễn Thị F', 'Hải Phòng'),
('Võ Văn G', 'Đà Nẵng'),
('Đặng Thị H', 'Hồ Chí Minh');

INSERT INTO shop.orders (customer_id, order_date, total_amount) VALUES 
(1, '2025-01-01', 2200),
(2, '2025-01-03', 1500),
(3, '2025-01-05', 3300),
(4, '2025-01-10', 2500),
(1, '2025-01-12', 1100),
(2, '2025-01-15', 1800),
(3, '2025-01-18', 4000),
(4, '2025-01-20', 900);

INSERT INTO shop.order_items (order_id, product_name, quantity, price) VALUES 
(1, 'Laptop Dell', 2, 1100),
(2, 'IPhone 15', 1, 1500),
(3, 'IPhone 15', 2, 1650),
(4, 'Bàn học gỗ', 5, 500),
(5, 'Laptop Dell', 1, 1100),
(6, 'Ghế xoay', 3, 600),
(7, 'IPhone 15', 2, 2000),
(8, 'Ghế xoay', 1, 900);

SELECT
	c.customer_name AS "Tên Khách Hàng",
	o.order_date AS "Ngày Đặt Hàng",
	o.total_amount AS "Tổng tiền"
FROM shop.customers c
JOIN shop.orders o ON c.customer_id = o.customer_id;

SELECT
	SUM(total_amount) AS "Tổng doanh thu",
	AVG(total_amount) AS "Trung bình giá trị đơn hàng",
	MAX(total_amount) AS "Đơn hàng lớn nhất",
	MIN(total_amount) AS "Đơn hàng nhỏ nhất",
	COUNT(*) AS "Số lượng đơn hàng"
FROM shop.orders;

SELECT 
    c.city,
    SUM(o.total_amount) AS "Tổng doanh thu"
FROM shop.customers c
JOIN shop.orders o ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING SUM(o.total_amount) > 10000;

SELECT 
    c.customer_name AS "Tên khách hàng",
    o.order_date AS "Ngày đặt hàng",
    oi.product_name AS "Sản phẩm",
    oi.quantity AS "Số lượng",
    oi.price AS "Giá"
FROM shop.customers c
JOIN shop.orders o ON c.customer_id = o.customer_id
JOIN shop.order_items oi ON o.order_id = oi.order_id;

SELECT 
    c.customer_name,
    SUM(o.total_amount) AS total_revenue
FROM shop.customers c
JOIN shop.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING SUM(o.total_amount) = (
    SELECT MAX(customer_revenue)
    FROM (
        SELECT SUM(total_amount) AS customer_revenue
        FROM shop.orders
        GROUP BY customer_id
    ) AS sub
);
