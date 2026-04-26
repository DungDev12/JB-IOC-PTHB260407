CREATE SCHEMA shop;

CREATE TABLE shop.sales(
	sale_id SERIAL PRIMARY KEY,
	customer_id INT,
	product_id INT,
	sale_date DATE,
	amount NUMERIC(10,2)
);

INSERT INTO shop.sales (customer_id, product_id, sale_date, amount) VALUES
(1, 101, '2026-01-02', 120.50),
(2, 102, '2026-01-03', 89.99),
(3, 103, '2026-01-04', 45.00),
(1, 104, '2026-01-05', 250.00),
(4, 101, '2026-01-06', 99.90),
(5, 105, '2026-01-07', 310.75),
(2, 106, '2026-01-08', 15.99),
(3, 102, '2026-01-09', 60.00),
(6, 107, '2026-01-10', 199.99),
(7, 108, '2026-01-11', 520.00),

(1, 109, '2026-01-12', 75.25),
(8, 110, '2026-01-13', 130.00),
(9, 101, '2026-01-14', 99.99),
(10, 103, '2026-01-15', 44.50),
(2, 104, '2026-01-16', 210.00),
(5, 105, '2026-01-17', 399.99),
(6, 106, '2026-01-18', 25.00),
(7, 107, '2026-01-19', 180.75),
(8, 108, '2026-01-20', 999.00),
(9, 109, '2026-01-21', 55.55);


-- Bảng Sales gồm các cột: sale_id, customer_id, product_id, sale_date, amount
-- Muốn tổng hợp tổng amount theo từng khách hàng

-- Yêu cầu:

-- Tạo View CustomerSales tổng hợp tổng amount theo từng customer_id
CREATE OR REPLACE VIEW shop.CustomerSales AS
SELECT 
    customer_id,
    SUM(amount) AS total_amount
FROM shop.sales
GROUP BY customer_id;

SELECT * 
FROM shop.CustomerSales
WHERE customer_id = 1;
-- Viết truy vấn SELECT * FROM CustomerSales WHERE total_amount > 1000; để xem khách hàng mua nhiều
SELECT * 
FROM shop.CustomerSales
WHERE total_amount > 1000;
-- Thử cập nhật một bản ghi qua View và quan sát kết quả
UPDATE shop.CustomerSales
SET amount = 14000
WHERE customer_id = 1;
-- VIEW CustomerSales là view tổng hợp nên không thể cập nhật trực tiếp dữ liệu. Muốn thay đổi dữ liệu phải update bảng gốc shop.sales


