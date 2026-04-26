CREATE SCHEMA shop;

CREATE TABLE shop.products(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	price NUMERIC,
	discount_percent INT
);

INSERT INTO shop.products (name, price, discount_percent) VALUES
('Áo thun basic', 150000, 10),
('Quần jeans slimfit', 400000, 15),
('Giày sneaker trắng', 850000, 5),
('Áo khoác hoodie', 500000, 20),
('Nón lưỡi trai', 120000, 0),
('Túi xách da', 950000, 25),
('Ví da nam', 300000, 60),
('Thắt lưng da', 220000, 5),
('Kính mát thời trang', 450000, 30),
('Vớ thể thao', 50000, 0);

--1. Viết Procedure calculate_discount(p_id INT, OUT p_final_price NUMERIC) để:
	-- Lấy price và discount_percent của sản phẩm
	-- Tính giá sau giảm:
	-- p_final_price = price - (price * discount_percent / 100)
	-- Nếu phần trăm giảm giá > 50, thì giới hạn chỉ còn 50%
-- 2. Cập nhật lại cột price trong bảng products thành giá sau giảm

CREATE OR REPLACE PROCEDURE calculate_discount(
	IN p_id INT,
	OUT p_final_price NUMERIC
)
LANGUAGE plpgsql
AS $$
	DECLARE
		v_price NUMERIC;
		v_discount_percent INT;
	BEGIN
		SELECT
			price,
			 CASE
		        WHEN discount_percent > 50 THEN 50
		        ELSE discount_percent
		    END
		INTO
			v_price,
			v_discount_percent
		FROM shop.products
		WHERE id = p_id;

		IF NOT FOUND THEN
			RAISE EXCEPTION 'Sản phẩm không tồn tại';
		ELSIF v_price IS NULL THEN
			 RAISE EXCEPTION 'Sản phẩm có giá tiền không hợp lệ: %', v_price;
		ELSIF v_discount_percent IS NULL THEN
			RAISE EXCEPTION 'Sản phẩm có giảm giá không hợp lệ: %', v_discount_percent;
		END IF;
		
		p_final_price := v_price - (v_price * (v_discount_percent / 100));

		UPDATE shop.products
		SET price = p_final_price
		WHERE id = p_id;
	END;
$$;


-- 3. Gọi thử: 
	-- CALL calculate_discount(2,  p_final_price);
	-- SELECT p_final_price;
CALL calculate_discount(2, null);
CALL calculate_discount(7, null);
SELECT * FROM shop.products;