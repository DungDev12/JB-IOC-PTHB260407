CREATE SCHEMA shop;

CREATE TABLE shop.inventory(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(100),
	quantity INT
);

INSERT INTO shop.inventory (product_name, quantity) VALUES
('Áo thun', 120),
('Quần jeans', 80),
('Giày sneaker', 45),
('Áo khoác', 30),
('Nón lưỡi trai', 60),
('Túi xách', 25),
('Ví da', 50),
('Thắt lưng', 40),
('Kính mát', 35),
('Vớ thể thao', 200);

--1. Viết một Procedure có tên check_stock(p_id INT, p_qty INT) để:
	-- Kiểm tra xem sản phẩm có đủ hàng không
	-- Nếu quantity < p_qty, in ra thông báo lỗi bằng RAISE EXCEPTION ‘Không đủ hàng trong kho’

SELECT quantity
FROM shop.inventory
WHERE product_id = 1;

CREATE OR REPLACE PROCEDURE check_stock(
	IN p_id INT, 
	IN p_qty INT
)
LANGUAGE plpgsql
AS $$
DECLARE
	stock_qty INT;
BEGIN
		SELECT quantity
		INTO stock_qty -- Gán vào quantity của procedure
		FROM shop.inventory
		WHERE product_id = p_id;
	IF stock_qty IS NULL THEN
		RAISE EXCEPTION 'Sản phẩm không tồn tại';
	END IF;
		
	IF stock_qty < p_qty THEN
		RAISE EXCEPTION 'Không đủ hàng trong kho';
	ELSE
		RAISE NOTICE 'Đủ hàng trong kho';
	END IF;
END;
$$;

	
-- 2. Gọi Procedure với các trường hợp:
	-- Một sản phẩm có đủ hàng
	-- Một sản phẩm không đủ hàng
CALL check_stock(1,5);
CALL check_stock(4,35);
CALL check_stock(100,5);