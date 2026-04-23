CREATE SCHEMA shop;

CREATE TABLE shop.book(
	book_id SERIAL PRIMARY KEY,
	title VARCHAR(255),
	author VARCHAR(100),
	genre VARCHAR(50),
	price DECIMAL(10,2),
	description TEXT,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- DÙNG AI ĐỂ TẠO 500.000 DỮ LIỆU
INSERT INTO shop.book (title, author, genre, price, description)
SELECT
    'Book ' || gs AS title,
    CASE 
        WHEN gs % 250000 = 0 THEN 'Rowling' || (gs % 1000)   -- ~2% dữ liệu là Rowling
        ELSE 'Author ' || (gs % 1000)
    END AS author,
    CASE 
        WHEN gs % 5 = 0 THEN 'Fiction'
        WHEN gs % 5 = 1 THEN 'Science'
        WHEN gs % 5 = 2 THEN 'History'
        WHEN gs % 5 = 3 THEN 'Fantasy'
        ELSE 'Technology'
    END AS genre,
    ROUND((RANDOM() * 100 + 5)::numeric, 2) AS price,
    'Description for book ' || gs
FROM generate_series(1, 500000) AS gs;
--

DELETE FROM shop.book;
SELECT * FROM shop.book;

--1.

CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE INDEX idx_book_author 
ON shop.book
USING GIN (author gin_trgm_ops);

EXPLAIN ANALYZE
SELECT * FROM shop.book WHERE author ILIKE '%Rowling%';

CREATE INDEX idx_book_genre ON shop.book(genre);
EXPLAIN ANALYZE
SELECT * FROM shop.book WHERE genre = 'Fantasy';

 -- 2.
CREATE INDEX idx_book_title
ON shop.book
USING GIN (title gin_trgm_ops);

EXPLAIN ANALYZE
SELECT * FROM shop.book WHERE title ILIKE '%143';

-- 3.
CLUSTER shop.book USING idx_book_genre;
EXPLAIN ANALYZE
SELECT * FROM shop.book WHERE genre = 'Fantasy';