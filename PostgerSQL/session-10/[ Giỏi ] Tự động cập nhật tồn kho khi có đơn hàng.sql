
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    stock INT
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id),
    quantity INT
);

CREATE OR REPLACE FUNCTION update_stock()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
	BEGIN
	    IF TG_OP = 'INSERT' THEN
	        UPDATE products
	        SET stock = stock - NEW.quantity
	        WHERE id = NEW.product_id;
	        RETURN NEW;
			
	    ELSIF TG_OP = 'UPDATE' THEN
	        SET stock = stock + OLD.quantity
	        WHERE id = OLD.product_id;
	
	        UPDATE products
	        SET stock = stock - NEW.quantity
	        WHERE id = NEW.product_id;
	        RETURN NEW;
	
	    ELSIF TG_OP = 'DELETE' THEN
	        UPDATE products
	        SET stock = stock + OLD.quantity
	        WHERE id = OLD.product_id;
	        RETURN OLD;
	    END IF;
	
	END;
$$;

CREATE TRIGGER trg_update_stock
AFTER INSERT OR UPDATE OR DELETE ON orders
FOR EACH ROW
EXECUTE FUNCTION update_stock();

INSERT INTO products(name, stock) VALUES
('Laptop', 100),
('Mouse', 50);

INSERT INTO orders(product_id, quantity)
VALUES (1, 10);

UPDATE orders
SET quantity = 20
WHERE id = 1;

DELETE FROM orders WHERE id = 1;