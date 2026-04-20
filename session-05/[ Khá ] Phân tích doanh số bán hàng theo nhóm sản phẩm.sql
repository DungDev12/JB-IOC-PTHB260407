CREATE SCHEMA shop;

CREATE TABLE shop.products(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(50) NOT NULL,
	category VARCHAR(50) NOT NULL
);

CREATE TABLE shop.orders(
	order_id SERIAL PRIMARY KEY,
	product_id INT REFERENCES shop.products(product_id),
	quantity INT NOT NULL CHECK (quantity >= 0) DEFAULT 0,
	total_price DECIMAL(10,2) NOT NULL CHECK (total_price >= 0)
);

INSERT INTO shop.products (product_name, category) VALUES
('Laptop Dell','Electronics'),
('IPhone 15','Electronics'),
('Bàn học gỗ','Furniture'),
('Ghế xoay','Furniture');

INSERT INTO shop.orders(product_id,quantity,total_price) VALUES
(1,2,2200),
(2,3,3300),
(3,5,2500),
(4,4,1600),
(1,1,1100);

SELECT 
	p.category,
	SUM(o.total_price) AS total_sales,
	SUM(o.quantity) AS total_quantity
FROM shop.products p
JOIN shop.orders o ON p.product_id = o.order_id
GROUP BY p.category
HAVING SUM(o.total_price) > 2000
ORDER BY total_sales DESC;
