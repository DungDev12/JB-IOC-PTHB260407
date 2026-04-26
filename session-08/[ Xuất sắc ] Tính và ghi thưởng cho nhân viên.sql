CREATE SCHEMA company;

CREATE TABLE company.employees(
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	department VARCHAR(50),
	salary NUMERIC(10,2),
	bonus NUMERIC(10,2 ) DEFAULT 0
);

INSERT INTO company.employees(name,department,salary) VALUES
('Nguyen Van A','HR',4000),
('Tran Thi B','IT',6000),
('Le Van C','Finance',10500),
('Pham Thi D','IT',8000),
('Do Van E','HR',12000);

-- Dựa vào dữ liệu của bài tập trước hãy thực hiện các yêu cầu sau:

-- Tạo procedure calculate_bonus để:

-- Tham số vào:
-- p_emp_id INT — mã nhân viên
-- p_percent NUMERIC — phần trăm thưởng
-- Tham số ra:
-- p_bonus NUMERIC — giá trị thưởng tính được
 

-- Yêu cầu:

-- Nếu nhân viên không tồn tại → ném lỗi "Employee not found"
-- Nếu p_percent <= 0 → không tính, p_bonus = 0
-- Tính thưởng = salary * p_percent / 100 và lưu vào cột bonus trong bảng employees

CREATE OR REPLACE PROCEDURE calculate_bonus(
	IN p_emp_id INT,
	IN p_percent NUMERIC(5,2),
	OUT p_bonus NUMERIC(10,2)
)
LANGUAGE plpgsql
AS $$
	DECLARE
		v_salary NUMERIC(10,2);
	BEGIN
		SELECT salary
		INTO v_salary
		FROM company.employees
		WHERE id = p_emp_id;

		IF NOT FOUND THEN
			RAISE EXCEPTION 'Employee % not found', p_emp_id;
		END IF;

		IF p_percent <= 0 THEN
			p_bonus := 0;
		ELSE
			p_bonus := v_salary * p_percent / 100;
			UPDATE company.employees
			SET bonus = p_bonus
			WHERE id = p_emp_id;
		END IF;
	END;
$$;

CALL calculate_bonus(2,10,null);
CALL calculate_bonus(15,10,null);
SELECT * FROM company.employees;