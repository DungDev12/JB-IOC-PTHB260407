CREATE TABLE products(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	price DECIMAL(10,2),
	last_modified TIMESTAMP
);


CREATE OR REPLACE FUNCTION update_last_modified()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
	BEGIN
		NEW.last_modified = NOW();
    	RETURN NEW;
	END;
$$;


CREATE TRIGGER trg_update_last_modified
	BEFORE UPDATE ON products
	FOR EACH ROW
	EXECUTE FUNCTION update_last_modified();

INSERT INTO products (name, price) VALUES 
('Laptop', 1000),
('Mouse', 200);

SELECT * FROM products;

UPDATE products
SET price = 1200
WHERE id = 1;