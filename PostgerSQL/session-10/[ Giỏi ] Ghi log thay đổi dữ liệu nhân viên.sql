CREATE TABLE employees(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	position VARCHAR(100),
	salary INT
);

CREATE TABLE employees_log(
	employee_id INT,
	operation VARCHAR(6), -- INSERT/UPDATE/DELETE (6)
	old_data TEXT,
	new_data TEXT,
	change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION insert_log()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
	BEGIN
		 IF TG_OP = 'INSERT' THEN
	        INSERT INTO employees_log(employee_id, operation, old_data, new_data)
	        VALUES (
	            NEW.id,
	            'INSERT',
	            NULL,
	            row_to_json(NEW)::TEXT
	        );
        	RETURN NEW;

    	ELSIF TG_OP = 'UPDATE' THEN
	        INSERT INTO employees_log(employee_id, operation, old_data, new_data)
	        VALUES (
	            NEW.id,
	            'UPDATE',
	            row_to_json(OLD)::TEXT,
	            row_to_json(NEW)::TEXT
	        );
        	RETURN NEW;

	    ELSIF TG_OP = 'DELETE' THEN
	        INSERT INTO employees_log(employee_id, operation, old_data, new_data)
	        VALUES (
	            OLD.id,
	            'DELETE',
	            row_to_json(OLD)::TEXT,
	            NULL
	        );
	        RETURN OLD;
		END IF;
	END;
$$;

CREATE TRIGGER  trg_insert_log
	AFTER INSERT OR UPDATE OR DELETE
	ON employees
	FOR EACH ROW
	EXECUTE FUNCTION insert_log();


INSERT INTO employees(name, position, salary) VALUES ('An', 'Dev', 1000);
UPDATE employees
SET salary = 1200
WHERE id = 1;
DELETE FROM employees
WHERE id = 1;
SELECT * FROM employees;
SELECT * FROM employees_log;