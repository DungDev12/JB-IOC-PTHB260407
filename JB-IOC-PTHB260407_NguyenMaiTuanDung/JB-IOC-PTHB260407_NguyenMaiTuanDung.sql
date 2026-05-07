--- TẠO BẢNG
CREATE TABLE IF NOT EXISTS Passengers(
	passenger_id VARCHAR(5) PRIMARY KEY,
	passenger_full_name VARCHAR(100) NOT NULL,
	passenger_email VARCHAR(100) NOT NULL,
	passenger_phone VARCHAR(15) NOT NULL,
	passenger_cccd VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Trains(
	train_id VARCHAR(5) PRIMARY KEY,
	train_name VARCHAR(100) NOT NULL,
	train_type VARCHAR(10) NOT NULL,
	total_seats INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Tickets(
	ticket_id VARCHAR(5) PRIMARY KEY,
	passenger_id VARCHAR(5) NOT NULL,
	train_id VARCHAR(5) NOT NULL,
	departure_date DATE NOT NULL,
	seat_number VARCHAR(10) NOT NULL,
	ticket_price DECIMAL(10,2) NOT NULL,

	CONSTRAINT	fk_passenger_id
		FOREIGN KEY (passenger_id)
		REFERENCES Passengers(passenger_id),
	CONSTRAINT	fk_train_id
		FOREIGN KEY (train_id)
		REFERENCES Trains(train_id)
);

CREATE TABLE IF NOT EXISTS Transactions(
	transaction_id VARCHAR(5) PRIMARY KEY,
	ticket_id VARCHAR(5) NOT NULL,
	payment_method VARCHAR(50) NOT NULL,
	transaction_date DATE NOT NULL,
	amount DECIMAL(10,2) NOT NULL,

	CONSTRAINT	fk_ticket_id
		FOREIGN KEY (ticket_id)
		REFERENCES Tickets(ticket_id)
);

--- THÊM DỮ LIỆU
INSERT INTO Passengers(passenger_id,passenger_full_name,passenger_email,passenger_phone,passenger_cccd) VALUES
('P001','Nguyen Van An','an.nguyen@example.com','0912345678','001234567890'),
('P002','Tran Thi Binh','binh.tran@example.com','0923456789','002345678901'),
('P003','Le Minh Chau','chau.le@example.com','0934567890','003456789012'),
('P004','Pham Quoc Dat','dat.pham@example.com','0945678901','004567890123'),
('P005','Vo Thanh Em','em.vo@example.com','0956789012','005678901234');

INSERT INTO Trains(train_id,train_name,train_type,total_seats) VALUES
('T001','Tau Thong Nhat 1','SE',500),
('T002','Tau Thong Nhat 2','TN',450),
('T003','Tau Sai Gon - Hue','SE',400),
('T004','Tau Ha Noi - Lao Cai','TN',350),
('T005','Tau Da Nang Express','SE',300);

INSERT INTO Tickets(ticket_id,passenger_id,train_id,departure_date,seat_number,ticket_price) VALUES
('TK001','P001','T001','2025-06-10','A01',850000),
('TK002','P002','T002','2025-06-11','B05',650000),
('TK003','P003','T003','2025-06-12','C10',720000),
('TK004','P004','T004','2025-06-13','D12',500000),
('TK005','P005','T005','2025-06-14','E08',900000);

INSERT INTO Transactions(transaction_id,ticket_id,payment_method,transaction_date,amount) VALUES
('TR001','TK001','Credit Card','2025-06-01',850000),
('TR002','TK002','Cash','2025-06-02',650000),
('TR003','TK003','Bank Transfer','2025-06-03',720000),
('TR004','TK004','E-Wallet','2025-06-04',500000),
('TR005','TK005','Credit Card','2025-06-05',900000);

--- Viết câu lệnh UPDATE giảm giá vé 15% (price = price * 0.85) cho các vé tàu có ngày khởi hành trước ngày 2025-05-01.
UPDATE Tickets 
SET ticket_price = ticket_price * 0.85
WHERE departure_date < '2025-05-01';
-- Gọi kiểm tra
SELECT * FROM Tickets WHERE departure_date < '2025-05-01';
-- Thêm dữ liệu nếu không có
-- INSERT INTO Tickets(ticket_id,passenger_id,train_id,departure_date,seat_number,ticket_price) VALUES
-- ('TK099','P001','T001','2025-04-10','A01',850000);

--- Viết câu lệnh DELETE xóa các giao dịch có phương thức là "E-Wallet" và số tiền nhỏ hơn 200.000 VNĐ.
DELETE FROM Transactions
WHERE payment_method ILIKE 'E-Wallet'
AND	amount < 200000;

--- Lấy thông tin hành khách gồm: mã HK, họ tên, email, SĐT sắp xếp theo họ tên giảm dần.
SELECT 
	passenger_id AS ma_HK,
	passenger_full_name AS ho_ten,
	passenger_email AS email,
	passenger_phone AS SDT
FROM Passengers
ORDER BY passenger_full_name DESC;

--- Lấy danh sách đoàn tàu gồm: mã tàu, tên tàu, tổng số ghế, sắp xếp theo số ghế tăng dần.
SELECT
	train_id AS ma_tau,
	train_name AS ten_tau,
	total_seats AS tong_so_ghe
FROM Trains
ORDER BY total_seats;

--- Lấy thông tin vé đã đặt gồm: Họ tên hành khách, Tên tàu, Ngày khởi hành, Số ghế.
SELECT 
	p.passenger_full_name AS ho_ten_hanh_khach,
	trs.train_name AS ten_tau,
	t.departure_date AS ngay_khoi_hanh,
	t.seat_number AS so_ghe
FROM Tickets t
JOIN Passengers p
	ON p.passenger_id = t.passenger_id
JOIN Trains trs
	ON trs.train_id = t.train_id;

--- Lấy danh sách hành khách và tổng tiền đã thanh toán: mã HK, họ tên, phương thức thanh toán, số tiền thanh toán, sắp xếp theo số tiền tăng dần.
SELECT 
	p.passenger_id AS ma_HK,
	p.passenger_full_name AS ho_ten_HK,
	tst.payment_method AS PTTT,
	tst.amount AS so_tien_TT
FROM Transactions tst
JOIN Tickets t
	ON tst.ticket_id = t.ticket_id
JOIN Passengers p
	ON  p.passenger_id = t.passenger_id
ORDER BY tst.amount;

--- Lấy thông tin hành khách từ vị trí thứ 3 đến thứ 5 trong bảng Passengers sắp xếp theo tên (Z-A).
SELECT *
FROM Passengers
ORDER BY passenger_full_name
LIMIT 3 OFFSET 2;

--- Liệt kê các hành khách đã đặt ít nhất 3 vé tàu.
SELECT 
	p.passenger_id AS ma_HK,
	p.passenger_full_name AS ho_ten_HK,
	COUNT(t.train_id) AS tong_ve
FROM Tickets t
JOIN Passengers p
	ON p.passenger_id = t.passenger_id
GROUP BY p.passenger_id
HAVING COUNT(t.train_id) >= 3;
-- Thêm dữ liệu nếu không có
-- INSERT INTO Tickets(ticket_id,passenger_id,train_id,departure_date,seat_number,ticket_price) VALUES
-- ('TK030','P001','T001','2025-06-10','A01',850000),
-- ('TK031','P002','T001','2025-06-11','B05',650000),
-- ('TK032','P003','T001','2025-06-12','C10',720000),
-- ('TK033','P004','T001','2025-06-13','D12',500000),
-- ('TK034','P002','T001','2025-06-14','E08',900000),
-- ('TK035','P003','T001','2025-06-10','A01',850000),
-- ('TK036','P004','T001','2025-06-11','B05',650000),
-- ('TK037','P002','T001','2025-06-12','C10',720000),
-- ('TK038','P003','T001','2025-06-13','D12',500000),
-- ('TK039','P004','T001','2025-06-10','A01',850000),
-- ('TK040','P005','T001','2025-06-11','B05',650000),
-- ('TK041','P002','T001','2025-06-12','C10',720000),
-- ('TK042','P003','T001','2025-06-13','D12',500000);

--- Liệt kê các đoàn tàu đã có hơn 10 lượt khách đặt vé.
SELECT 
	tr.train_id,
	COUNT(t.ticket_id)
FROM Tickets t
JOIN Trains tr
ON t.train_id = tr.train_id
GROUP BY tr.train_id
HAVING COUNT(t.ticket_id) > 10;
-- -- Thêm dữ liệu nếu không có
-- INSERT INTO Tickets(ticket_id,passenger_id,train_id,departure_date,seat_number,ticket_price) VALUES
-- ('TK030','P001','T001','2025-06-10','A01',850000),
-- ('TK031','P002','T001','2025-06-11','B05',650000),
-- ('TK032','P003','T001','2025-06-12','C10',720000),
-- ('TK033','P004','T001','2025-06-13','D12',500000),
-- ('TK034','P002','T001','2025-06-14','E08',900000),
-- ('TK035','P003','T001','2025-06-10','A01',850000),
-- ('TK036','P004','T001','2025-06-11','B05',650000),
-- ('TK037','P002','T001','2025-06-12','C10',720000),
-- ('TK038','P003','T001','2025-06-13','D12',500000),
-- ('TK039','P004','T001','2025-06-10','A01',850000),
-- ('TK040','P005','T001','2025-06-11','B05',650000),
-- ('TK041','P002','T001','2025-06-12','C10',720000),
-- ('TK042','P003','T001','2025-06-13','D12',500000);

--- Lấy danh sách hành khách có tổng tiền giao dịch > 2.000.000 VNĐ, gồm: mã HK, họ tên, mã tàu, tổng tiền.
SELECT 
	 p.passenger_id AS ma_HK,
	 p.passenger_full_name AS ho_ten,
	 t.train_id AS ma_tau,
	 SUM(tst.amount) AS tong_tien
FROM Transactions tst
JOIN Tickets t
	ON t.ticket_id = tst.ticket_id
JOIN Passengers p
	ON p.passenger_id = t.passenger_id
GROUP BY 
	p.passenger_id,
	p.passenger_full_name,
	t.train_id
HAVING SUM(tst.amount) > 2000000;
-- Thêm dữ liệu nếu không có
-- INSERT INTO Transactions(transaction_id,ticket_id,payment_method,transaction_date,amount) VALUES
-- ('TR006','TK005','Credit Card','2025-06-01',20000000);

--- Lấy danh sách hành khách có tên chứa chữ "Hoàng" hoặc địa chỉ email thuộc miền "@gmail.com". Sắp xếp theo tên tăng dần.
SELECT *
FROM Passengers
WHERE passenger_full_name ILIKE '%hoàng%'
	OR passenger_email LIKE '%@gmail.com'
ORDER BY passenger_full_name;
-- Thêm dữ liệu nếu không có
-- INSERT INTO Passengers(passenger_id,passenger_full_name,passenger_email,passenger_phone,passenger_cccd) VALUES
-- ('P006','Nguyễn Văn Hoàng','hoang.nguyen@example.com','0912345678','001234567890'),
-- ('P007','Tran Thi Binh','binh.tran@gmail.com','0923456789','002345678901');


--- Lấy danh sách đoàn tàu (trang thứ 2, mỗi trang 5 bản ghi) sắp xếp theo số ghế giảm dần.
SELECT *
FROM Trains
ORDER BY total_seats DESC
LIMIT 5 OFFSET 5;
-- Thêm dữ liệu nếu không có
-- INSERT INTO Trains(train_id,train_name,train_type,total_seats) VALUES
-- ('T006','Tau Thong Nhat 3','SE',500),
-- ('T007','Tau Thong Nhat 4','TN',450),
-- ('T008','Tau Sai Gon - Da Lat','SE',400),
-- ('T009','Tau Ha Noi - Thanh Hoa','TN',350),
-- ('T010','Tau Da Nang - Lao Cai','SE',300);

--- Tạo view vw_UpcomingTrips hiển thị thông tin tàu và hành khách đã đặt vé với ngày khởi hành sau ngày 2025-06-01,
--- gồm:Họ tên, Tên tàu, Số ghế, Giá vé, Ngày khởi hành.
CREATE VIEW vw_UpcomingTrips AS
SELECT 
	p.passenger_full_name AS ho_ten_HK,
	tr.train_name AS ten_tau,
	t.seat_number AS so_ghe,
	t.ticket_price AS gia_ve,
	t.departure_date AS ngay_khoi_hanh
FROM Tickets t
JOIN Passengers p
	ON p.passenger_id = t.passenger_id
JOIN Trains tr
	ON tr.train_id = t.train_id
WHERE t.departure_date > '2025-06-01';
--- Gọi view vw_UpcomingTrips
SELECT * FROM vw_UpcomingTrips;

--- Tạo view vw_HighValueTickets hiển thị khách hàng đặt vé có giá trị trên 500.000 VNĐ, gồm: Họ tên, Tên tàu, Số ghế, Giá vé.
CREATE VIEW vw_HighValueTickets AS
SELECT 
	p.passenger_full_name AS ho_ten_HK,
	tr.train_name AS ten_tau,
	t.seat_number AS so_ghe,
	t.ticket_price AS gia_ve
FROM Tickets t
JOIN Passengers p
	ON p.passenger_id = t.passenger_id
JOIN Trains tr
	ON tr.train_id = t.train_id
WHERE t.ticket_price > 500000;
-- Gọi view vw_HighValueTickets
SELECT * FROM vw_HighValueTickets;

--- Tạo trigger tg_check_ticket_date kiểm tra khi chèn vào bảng Tickets. 
--- Nếu ngày khởi hành nhỏ hơn ngày hiện tại thì báo lỗi "Ngày khởi hành không hợp lệ" và hủy thao tác.
CREATE OR REPLACE FUNCTION check_ticket_date_func()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
	BEGIN
		IF NEW.departure_date < NOW() THEN
			RAISE EXCEPTION 'Ngày khởi hành không hợp lệ';
		END IF;
	END;
$$;

CREATE TRIGGER tg_check_ticket_date
BEFORE INSERT OR UPDATE ON Tickets
FOR EACH ROW
USING FUNCTION check_ticket_date_func();


---Tạo trigger tg_update_seats tự động giảm total_seats của bảng Trains đi 1 khi có một bản ghi mới được thêm vào bảng Tickets.
CREATE OR REPLACE FUNCTION update_seats_func()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
	BEGIN
		UPDATE Trains
		SET total_seats = total_seats - 1;
	END;
$$;

CREATE TRIGGER tg_update_seats
AFTER INSERT ON Tickets
FOR EACH ROW
USING FUNCTIOn update_seats_func;

--- Viết Procedure sp_add_passenger để thêm mới một hành khách.
CREATE OR REPLACE PROCEDURE sp_add_passenger(
	IN p_passenger_id VARCHAR(5),
	IN p_passenger_full_name VARCHAR(100),
	IN p_passenger_email VARCHAR(100),
	IN p_passenger_phone VARCHAR(15),
	IN p_passenger_cccd VARCHAR(20)
)
LANGUAGE plpgsql
AS $$
	BEGIN
		INSERT INTO Passengers(passenger_id,passenger_full_name,passenger_email,passenger_phone,passenger_cccd) VALUES
		(p_passenger_id,p_passenger_full_name,p_passenger_email,p_passenger_phone,p_passenger_cccd);
		RAISE NOTICE 'Tạo hành khách: % thành công !!',p_passenger_full_name;
		
		EXCEPTION
			WHEN OTHERS THEN
				RAISE EXCEPTION 'Lỗi: %',SQLERRM;
	END;
$$;

-- Gọi để thêm dữ liệu
CALL sp_add_passenger('P008','Pham Thi Nhu','nhu.pham@example.com','0912345312','001234564161');
-- Ví dụ bị lỗi
CALL sp_add_passenger('P008','Pham Thi Nhu','nhu.pham@example.com','0912345312','001234564161');


--- Viết Procedure sp_cancel_ticket nhận vào p_ticket_id, thực hiện xóa vé trong bảng Tickets và các giao dịch liên quan trong bảng Transactions.
CREATE OR REPLACE PROCEDURE sp_cancel_ticket(
	IN p_ticket_id VARCHAR(5)
)
LANGUAGE plpgsql
AS $$
	DECLARE
		is_ticket_exists BOOLEAN;
	BEGIN
		SELECT EXISTS (
			SELECT 1 FROM Tickets WHERE ticket_id = p_ticket_id
		) INTO is_ticket_exists;

		IF is_ticket_exists IS FALSE THEN
			RAISE EXCEPTION 'Vé % không tồn tại !',p_ticket_id;
		END IF;
		
		DELETE FROM Transactions
		WHERE ticket_id = p_ticket_id;
		
		DELETE FROM Tickets
		WHERE ticket_id = p_ticket_id;

		RAISE NOTICE 'Xoá vé % thành công và các dữ liệu liên quan!!',p_ticket_id;
		
		EXCEPTION
			WHEN OTHERS THEN
				RAISE EXCEPTION 'Lỗi: %',SQLERRM;
	END;
$$;

-- Gọi khi có lữ liệu
CALL sp_cancel_ticket('TK001');
SELECT * FROM Tickets;
SELECT * FROM Transactions;

-- Gọi khi không có lữ liệu
CALL sp_cancel_ticket('TK999');

