CREATE SCHEMA shop;

CREATE TABLE shop.order_detail (
	id SERIAL PRIMARY KEY,
	order_id INT,
	product_name VARCHAR(100),
	quantity INT,
	unit_price NUMERIC
);

INSERT INTO shop.order_detail (order_id, product_name, quantity, unit_price) VALUES
(1, 'Áo thun', 2, 150000),
(1, 'Quần jeans', 1, 350000),
(2, 'Giày sneaker', 1, 800000),
(2, 'Vớ thể thao', 5, 50000),
(3, 'Áo khoác', 1, 600000),
(3, 'Nón lưỡi trai', 2, 120000),
(4, 'Túi xách', 1, 950000),
(4, 'Ví da', 1, 300000),
(5, 'Thắt lưng', 2, 200000),
(5, 'Kính mát', 1, 400000);

-- 1.

CREATE OR REPLACE PROCEDURE calculate_order_total(
	IN order_id_input INT, 
	OUT total NUMERIC
)
LANGUAGE plpgsql
AS $$
	BEGIN
		total := (
			SELECT SUM(quantity*unit_price) 
			FROM shop.order_detail
			WHERE order_id = order_id_input
		);
	END;
$$;

CALL calculate_order_total(2,null);