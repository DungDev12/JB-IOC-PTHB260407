CREATE SCHEMA shop;

CREATE TABLE shop.products(
	product_id SERIAL PRIMARY KEY,
	category_id INT,
	price NUMERIC(10,2),
	stock_quantity INT CHECK (stock_quantity > 0) DEFAULT 0
);

INSERT INTO shop.products (category_id, price, stock_quantity) VALUES
(1, 120000.00, 10),
(1, 250000.00, 5),
(1, 99000.00, 20),

(2, 450000.00, 7),
(2, 300000.00, 15),
(2, 150000.00, 12),

(3, 999000.00, 3),
(3, 750000.00, 8),
(3, 520000.00, 6),

(4, 199000.00, 25),
(4, 89000.00, 40),
(4, 350000.00, 9),

(5, 1200000.00, 2),
(5, 850000.00, 4),
(5, 670000.00, 6);

-- Bảng Products gồm các cột: product_id, category_id, price, stock_quantity
-- Cần tìm kiếm sản phẩm theo category_id và sắp xếp theo price

-- Yêu cầu:

-- Tạo Clustered Index trên cột category_id
CREATE INDEX idx_category_id
ON shop.products(category_id);
CLUSTER shop.products USING idx_category_id;
-- Tạo Non-clustered Index trên cột price
CREATE INDEX idx_price
ON shop.products(price);
-- Thực hiện truy vấn SELECT * FROM Products WHERE category_id = X ORDER BY price; và giải thích cách Index hỗ trợ tối ưu
EXPLAIN ANALYZE
SELECT * 
FROM shop.products 
WHERE category_id = 1
ORDER BY price;
