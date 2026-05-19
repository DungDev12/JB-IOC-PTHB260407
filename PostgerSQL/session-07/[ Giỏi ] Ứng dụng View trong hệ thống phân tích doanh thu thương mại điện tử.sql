CREATE SCHEMA shop;

CREATE TABLE shop.customer(
	customer_id SERIAL PRIMARY KEY,
	full_name VARCHAR(100),
	region VARCHAR(50)
);

CREATE TABLE shop.orders(
	order_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES shop.customer(customer_id),
	total_amount DECIMAL(10,2),
	order_date DATE,
	status VARCHAR(20)
);

CREATE TABLE shop.product(
	product_id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	price DECIMAL(10,2),
	category VARCHAR(50)
);

CREATE TABLE order_detail(
	order_id INT REFERENCES shop.orders(order_id),
	product_id INT REFERENCES shop.product(product_id),
	quantity INT
);

--
INSERT INTO shop.customer (full_name, region)
SELECT
    'Khách hàng ' || gs,
    CASE (gs % 8)
        WHEN 0 THEN 'Hà Nội'
        WHEN 1 THEN 'TP.HCM'
        WHEN 2 THEN 'Đà Nẵng'
        WHEN 3 THEN 'Hải Phòng'
        WHEN 4 THEN 'Cần Thơ'
        WHEN 5 THEN 'Bình Dương'
        WHEN 6 THEN 'Nghệ An'
        ELSE 'Khánh Hòa'
    END
FROM generate_series(1, 10000) gs;

INSERT INTO shop.product (name, price, category)
SELECT
    'Sản phẩm ' || gs,
    ROUND((random() * 100000 + 10000)::numeric, 2),
    CASE (gs % 5)
        WHEN 0 THEN 'Điện tử'
        WHEN 1 THEN 'Gia dụng'
        WHEN 2 THEN 'Thời trang'
        WHEN 3 THEN 'Thực phẩm'
        ELSE 'Khác'
    END
FROM generate_series(1, 1000) gs;

INSERT INTO shop.orders (customer_id, total_amount, order_date, status)
SELECT
    (random() * 9999 + 1)::int,
    ROUND((random() * 2000000 + 50000)::numeric, 2),
    CURRENT_DATE - (random() * 365)::int,
    CASE (gs % 3)
        WHEN 0 THEN 'completed'
        WHEN 1 THEN 'pending'
        ELSE 'cancelled'
    END
FROM generate_series(1, 50000) gs;


INSERT INTO order_detail (order_id, product_id, quantity)
SELECT
    (random() * 49999 + 1)::int,
    (random() * 999 + 1)::int,
    (random() * 5 + 1)::int
FROM generate_series(1, 100000) gs;
--
-- 1.
CREATE VIEW vw_revenue_byregion AS
SELECT c.region, SUM(o.total_amount) AS total_revenue
FROM shop.customer c
JOIN shop.orders o ON c.customer_id = o.customer_id
GROUP BY c.region;

SELECT
    region,
    total_revenue
FROM vw_revenue_byregion
ORDER BY total_revenue DESC
LIMIT 3;

-- 2.
