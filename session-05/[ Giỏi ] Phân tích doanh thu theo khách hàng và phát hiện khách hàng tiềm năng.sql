CREATE SCHEMA shop;

CREATE TABLE shop.customers(
	customer_id SERIAL PRIMARY KEY,
	customer_name VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL
);

CREATE TABLE shop.orders(
	order_id INT PRIMARY KEY,
	customer_id INT REFERENCES shop.customers(customer_id) NOT NULL,
	order_date DATE DEFAULT CURRENT_DATE,
	total_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE shop.order_items(
	item_id SERIAL PRIMARY KEY,
	order_id INT REFERENCES shop.orders(order_id) NOT NULL,
	product_id INT NOT NULL,
	quantity INT CHECK (quantity > 0),
	price DECIMAL(10,2) NOT NULL
);

INSERT INTO shop.customers (customer_name,city) VALUES
('Nguyễn Văn A','Hà Nội'),
('Trần Thị B','Đà Nẵng'),
('Lê Văn C','Hồ Chí Minh'),
('Phạm Thị D','Hà Nội');

INSERT INTO shop.orders (order_id, customer_id, order_date, total_price) VALUES
(101,1,'2024-12-20',3000),
(102,2,'2025-01-05',1500),
(103,1,'2025-02-10',2500),
(104,3,'2025-02-15',4000),
(105,4,'2025-03-01',800);

INSERT INTO shop.order_items (order_id,product_id,quantity,price) VALUES
(101,1,2,1500),
(102,2,1,1500),
(103,3,5,1500),
(104,2,4,1500);

SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.total_price) AS total_revenue,
    COUNT(o.order_id) AS order_count
FROM shop.customers c
JOIN shop.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_price) > 2000;


SELECT 
    c.customer_id,
    c.customer_name,
    SUM(o.total_price) AS total_revenue
FROM shop.customers c
JOIN shop.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.total_price) > (
    SELECT AVG(customer_revenue)
    FROM (
        SELECT SUM(total_price) AS customer_revenue
        FROM shop.orders
        GROUP BY customer_id
    ) AS sub);

SELECT 
    c.city,
    SUM(o.total_price) AS total_revenue
FROM shop.customers c
JOIN shop.orders o ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING SUM(o.total_price) = (
    SELECT MAX(city_revenue)
    FROM (
        SELECT SUM(o2.total_price) AS city_revenue
        FROM shop.customers c2
        JOIN shop.orders o2 ON c2.customer_id = o2.customer_id
        GROUP BY c2.city
    ) AS sub
);