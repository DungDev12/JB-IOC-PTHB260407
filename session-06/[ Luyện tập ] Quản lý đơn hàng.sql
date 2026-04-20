CREATE SCHEMA shop;

CREATE TABLE shop.OrderInfo(
	id SERIAL PRIMARY KEY,
	customer_id INT,
	order_date DATE,
	total NUMERIC(10,2),
	status VARCHAR(20)
);

INSERT INTO shop.OrderInfo (customer_id, order_date, total, status) VALUES
(101, '2024-10-15 10:30:00', 1500000, 'Completed'),
(102, '2024-10-16 14:45:00', 450000, 'Pending'),
(105, '2024-09-17 08:20:00', 2100000, 'Shipping'),
(101, '2024-05-18 19:15:00', 120000, 'Cancelled'),
(108, '2024-03-19 11:00:00', 780000, 'Completed');

SELECT * 
FROM shop.OrderInfo
WHERE total > 500000;

SELECT *
FROM shop.OrderInfo
WHERE order_date BETWEEN '2024-10-01' AND '2024-10-31';

SELECT *
FROM shop.OrderInfo
WHERE status != 'Completed';

SELECT *
FROM shop.OrderInfo
WHERE order_date < NOW()
ORDER BY order_date DESC
LIMIT 2;