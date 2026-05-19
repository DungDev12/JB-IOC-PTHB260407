CREATE SCHEMA shop;

CREATE TABLE shop.customer(
	customer_id SERIAL PRIMARY KEY,
	full_name VARCHAR(100),
	email VARCHAR(100),
	phone VARCHAR(15)
);

CREATE TABLE shop.orders(
	order_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES shop.customer(customer_id),
	total_amount DECIMAL(10,2),
	order_date DATE
);

--
INSERT INTO shop.customer (full_name, email, phone)
SELECT
    'Customer ' || gs,
    'customer' || gs || '@mail.com',
    '09' || LPAD((gs % 1000000000)::text, 9, '0')
FROM generate_series(1, 100000) AS gs;

INSERT INTO shop.orders (customer_id, total_amount, order_date)
SELECT
    (random() * 99999 + 1)::int AS customer_id,

    CASE
        -- 80% low value
        WHEN gs % 10 < 8 THEN
            ROUND((random() * 200000 + 10000)::numeric, 2)

        -- 19.9% medium value
        WHEN gs % 10 < 10 THEN
            ROUND((random() * 800000 + 200000)::numeric, 2)

        -- 0.1% high value
        ELSE
            ROUND((random() * 5000000 + 10000000)::numeric, 2)
    END AS total_amount,

    CURRENT_DATE - (random() * 365)::int
FROM generate_series(1, 1000000) gs;

-- 
SELECT * FROM shop.customer;
SELECT * FROM shop.orders;

DELETE FROM shop.orders;

-- 1.
CREATE VIEW shop.v_order_summary AS
SELECT
    c.full_name,
    o.total_amount,
    o.order_date
FROM shop.customer c
JOIN shop.orders o
    ON c.customer_id = o.customer_id;

SELECT * FROM shop.v_order_summary;

-- 2.

SELECT table_name AS view
FROM information_schema.views
WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY table_schema, table_name;

-- 3.
CREATE VIEW shop.v_high_value_orders AS
SELECT
    c.full_name,
    c.email,
    o.order_id,
    o.total_amount,
    o.order_date
FROM shop.customer c
JOIN shop.orders o
    ON c.customer_id = o.customer_id
WHERE o.total_amount >= 1000000;

SELECT * FROM shop.v_high_value_orders;


-- 5.
DROP VIEW shop.v_high_value_orders;