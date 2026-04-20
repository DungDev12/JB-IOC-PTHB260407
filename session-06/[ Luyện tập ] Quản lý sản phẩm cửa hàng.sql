CREATE SCHEMA shop;

CREATE TABLE shop.products(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	category VARCHAR(50),
	price NUMERIC(10,2),
	stock INT
);

INSERT INTO shop.products (name, category, price, stock) VALUES
('Laptop Acer','LAPTOP',14999000,10),
('Latop ASUS','LAPTOP',14999000,5),
('Tai nghe Razer','ELECTRONICS',499000,4),
('IPHONE 15 PROMAX','ELECTRONICS',32999000,8),
('Bàn phím Razer','KEYBOARD',899000,12);

SELECT * FROM shop.products;

SELECT *
FROM shop.products
ORDER BY price DESC
LIMIT 3;

SELECT *
FROM shop.products
WHERE category = 'ELECTRONICS' AND price < 10000000;

SELECT *
FROM shop.products
ORDER BY stock ASC;