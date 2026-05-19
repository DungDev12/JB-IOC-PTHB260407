CREATE TABLE customers(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	credit_limit INT
); 

CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
	customer_id INT
		REFERENCES customers(id),
	order_amount INT
);


CREATE OR REPLACE FUNCTION check_credit()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
	DECLARE
		total_amount INT;
		credit INT;
	BEGIN
		SELECT COALESCE(SUM(order_amount), 0)
		INTO total_amount
		FROM orders
		WHERE customer_id = NEW.customer_id;

		SELECT credit_limit
		INTO credit
		FROM customers
		WHERE id = NEW.customer_id;

		IF total_amount + NEW.order_amount > credit THEN
			RAISE EXCEPTION 'Credit bị vượt giới hạn %',credit;
		END IF;

		RETURN NEW;
	END;
$$;

CREATE TRIGGER trg_check_credit
BEFORE INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION check_credit();

INSERT INTO customers (name, credit_limit)
VALUES 
('Nguyễn Văn A', 1000),
('Huỳnh Văn B', 500);

-- Hợp lệ
INSERT INTO orders (customer_id, order_amount)
VALUES (1, 300);
INSERT INTO orders (customer_id, order_amount)
VALUES (1, 400);

-- Không hợp lệ
INSERT INTO orders (customer_id, order_amount)
VALUES (2, 600);

SELECT *
FROM customers;