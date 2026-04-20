CREATE SCHEMA app;

CREATE TABLE app.Customer(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	email VARCHAR(100),
	phone VARCHAR(20),
	points INT
);

INSERT INTO app.Customer (name, email, phone, points) VALUES
('Nguyễn Văn An', 'an.nguyen@gmail.com', '0901234567', 120),
('Trần Thị Bình', 'binh.tran@gmail.com', '0902345678', 80),
('Lê Văn Cường', 'cuong.le@gmail.com', '0912345678', 200),
('Phạm Thị Dung', 'dung.pham@gmail.com', '0923456789', 150),
('Hoàng Văn Em', NULL, '0934567890', 300),
('Nguyễn Thị Phương', 'phuong.nguyen@gmail.com', '0945678901', 60),
('Võ Văn Giang', 'giang.vo@gmail.com', '0956789012', 90);

SELECT DISTINCT name
FROM app.Customer;

SELECT *
FROM app.Customer
WHERE email IS NULL;

SELECT *
FROM app.Customer
ORDER BY points DESC
LIMIT 3 OFFSET 1;

SELECT *
FROM app.Customer
ORDER BY name DESC;