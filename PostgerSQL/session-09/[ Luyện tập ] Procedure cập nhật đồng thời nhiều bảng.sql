
CREATE SCHEMA shop;

CREATE TABLE shop.customers(
	customer_id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	total_spent NUMERIC(10,2)
);

CREATE TABLE shop.orders(
	order_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES shop.customers(customer_id),
	total_amount NUMERIC(10,2)
);

INSERT INTO shop.customers (name, total_spent) VALUES
('Nguyen Van An', 0),
('Tran Thi Bich', 0),
('Le Van Cuong', 0),
('Pham Thi Dao', 0),
('Hoang Minh Duc', 0),
('Vo Thi Hang', 0),
('Dang Quoc Huy', 0),
('Bui Thi Lan', 0),
('Do Van Minh', 0),
('Nguyen Thi Nga', 0);

INSERT INTO shop.orders (customer_id, total_amount) VALUES
(1, 120.50),
(1, 250.00),
(2, 89.99),
(2, 150.00),
(3, 45.00),
(3, 300.00),
(4, 99.90),
(5, 310.75),
(5, 500.00),
(6, 15.99),

(6, 200.00),
(7, 199.99),
(7, 450.00),
(8, 520.00),
(8, 600.00),
(9, 75.25),
(9, 130.00),
(10, 999.00),
(10, 55.55);

-- Bảng Orders (order_id, customer_id, total_amount) và bảng Customers (customer_id, name, total_spent)
-- Khi thêm đơn hàng mới, cần cập nhật total_spent của khách hàng
 

-- Yêu cầu:

-- Tạo Procedure add_order_and_update_customer(p_customer_id INT, p_amount NUMERIC) để:
-- Thêm đơn hàng mới vào bảng Orders
-- Cập nhật total_spent trong bảng Customers
-- Sử dụng biến và xử lý điều kiện để đảm bảo khách hàng tồn tại
-- Sử dụng EXCEPTION để báo lỗi nếu thêm đơn hàng thất bại
-- Gọi Procedure với tham số mẫu và kiểm tra kết quả trên cả hai bảng

CREATE OR REPLACE PROCEDURE shop.add_order_and_update_customer( 
	p_customer_id INT,
	p_amount NUMERIC(10,2) 
) 
LANGUAGE plpgsql 
AS 
$$ 
	DECLARE v_customer_id INT; 
	BEGIN 
		SELECT customer_id 
		INTO v_customer_id 
		FROM shop.customers 
		WHERE customer_id = p_customer_id; 

		 IF v_customer_id IS NULL THEN
	        RAISE EXCEPTION 'Khách hàng % không tồn tại', p_customer_id;
		ELSIF p_amount < 0 THEN
			RAISE EXCEPTION 'Giá tiền không hợp lệ';
	    END IF;
		
		INSERT INTO shop.orders (customer_id, total_amount) VALUES 
		(v_customer_id, p_amount); 
		
		UPDATE shop.customers 
		SET total_spent = ( 
			SELECT SUM(o.total_amount) AS total 
			FROM shop.orders o 
			WHERE o.customer_id = v_customer_id
		) 
		WHERE customer_id = v_customer_id; 
		
		RAISE NOTICE 'Thêm đơn hàng thành công';
		
		EXCEPTION
		    WHEN OTHERS THEN
		        RAISE EXCEPTION 'Thêm đơn hàng thất bại: %', SQLERRM;
	END; 
$$; 
CALL shop.add_order_and_update_customer(1,-1);
CALL shop.add_order_and_update_customer(999,152);
CALL shop.add_order_and_update_customer(4,124);
SELECT * FROM shop.customers;
SELECT * FROM shop.orders;