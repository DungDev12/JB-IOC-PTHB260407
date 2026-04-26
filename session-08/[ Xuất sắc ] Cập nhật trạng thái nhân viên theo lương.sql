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

-- Tạo procedure update_employee_status với yêu cầu sau:

-- Tham số vào:
-- p_emp_id INT — mã nhân viên
-- Tham số ra:
-- p_status TEXT — trạng thái sau khi cập nhật
-- Yêu cầu xử lý:

-- Nếu nhân viên không tồn tại, ném lỗi "Employee not found"
-- Nếu lương < 5000 → cập nhật status = 'Junior'
-- Nếu lương từ 5000–10000 → cập nhật status = 'Mid-level'
-- Nếu lương > 10000 → cập nhật status = 'Senior’
-- Trả ra p_status sau khi cập nhật

CREATE OR REPLACE PROCEDURE update_employee_status(
	IN p_emp_id INT,
	OUT p_status TEXT
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
			RAISE EXCEPTION 'Employee % not found',p_emp_id;
		END IF;
		 p_status :=
			 CASE
	            WHEN v_salary > 10000 THEN 'Senior'
	            WHEN v_salary BETWEEN 5000 AND 10000 THEN 'Mid-level'
	            ELSE 'Junior'
       		 END;
		ALTER TABLE company.employees
		ADD COLUMN IF NOT EXISTS status TEXT;
		UPDATE company.employees
		SET status = p_status
		WHERE id = p_emp_id;
	END;
$$;

CALL update_employee_status(2,null);
SELECT * FROM company.employees;