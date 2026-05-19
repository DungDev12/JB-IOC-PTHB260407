CREATE SCHEMA shop;

CREATE TABLE shop.customers(
	customer_id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	email VARCHAR(100)
);

CREATE TABLE shop.orders(
	order_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES shop.customers(customer_id),
	amount NUMERIC(10,2),
	order_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO shop.customers (name, email) VALUES
('Nguyen Van An', 'an@gmail.com'),
('Tran Thi Bich', 'bich@gmail.com'),
('Le Van Cuong', 'cuong@gmail.com'),
('Pham Thi Dao', 'dao@gmail.com'),
('Hoang Minh Duc', 'duc@gmail.com'),
('Vo Thi Hang', 'hang@gmail.com'),
('Dang Quoc Huy', 'huy@gmail.com'),
('Bui Thi Lan', 'lan@gmail.com'),
('Do Van Minh', 'minh@gmail.com'),
('Nguyen Thi Nga', 'nga@gmail.com');

INSERT INTO shop.orders (customer_id, amount, order_date) VALUES
(1, 120.50, '2026-01-02'),
(1, 250.00, '2026-01-10'),
(2, 89.99,  '2026-01-03'),
(2, 150.00, '2026-01-15'),
(3, 45.00,  '2026-01-04'),
(3, 300.00, '2026-01-18'),
(4, 99.90,  '2026-01-06'),
(5, 310.75, '2026-01-07'),
(5, 500.00, '2026-01-20'),
(6, 15.99,  '2026-01-08'),

(6, 200.00, '2026-01-22'),
(7, 199.99, '2026-01-09'),
(7, 450.00, '2026-01-25'),
(8, 520.00, '2026-01-11'),
(8, 600.00, '2026-01-28'),
(9, 75.25,  '2026-01-12'),
(9, 130.00, '2026-01-30'),
(10, 999.00,'2026-01-13'),
(10, 55.55, '2026-01-31');

-- Tạo Procedure add_order(p_customer_id INT, p_amount NUMERIC) để thêm đơn hàng
-- Kiểm tra nếu customer_id không tồn tại trong bảng Customers, sử dụng RAISE EXCEPTION để báo lỗi
-- Nếu khách hàng tồn tại, thêm bản ghi mới vào bảng Orders

CREATE OR REPLACE PROCEDURE shop.add_order(
	IN p_customer_id INT,
	IN p_amount NUMERIC(10,2)
)
LANGUAGE plpgsql
AS $$
	DECLARE
		v_customer_id INT;
	BEGIN
		SELECT customer_id
		INTO v_customer_id
		FROM shop.customers
		WHERE customer_id = p_customer_id;

		IF NOT FOUND THEN
			RAISE EXCEPTION 'Khách hàng % không tồn tại',p_customer_id;
		END IF;

		INSERT INTO shop.orders(customer_id, amount) VALUES
		(v_customer_id,p_amount);

		RAISE NOTICE 'Đã thêm đơn hàng thành công';
	END;
$$;

CALL shop.add_order(999, 50000);
CALL shop.add_order(3, 40000);
SELECT * FROM shop.orders;