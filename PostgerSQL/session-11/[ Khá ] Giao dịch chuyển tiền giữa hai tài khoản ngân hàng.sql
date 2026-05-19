CREATE TABLE accounts(
	account_id SERIAL PRIMARY KEY,
	owner_name VARCHAR(100),
	balance NUMERIC(10,2)
);

INSERT INTO accounts (owner_name, balance) VALUES
('A', 500.00),
('B', 300.00);


CREATE OR REPLACE PROCEDURE transfer_money()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE accounts
    SET balance = balance - 10
    WHERE account_id = 1;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Account 1 không tồn tại';
    END IF;

    UPDATE accounts
    SET balance = balance + 10
    WHERE account_id = null;
	  IF NOT FOUND THEN
	        RAISE EXCEPTION 'Account 2 không tồn tại';
	    END IF;
	EXCEPTION 
		WHEN OTHERS THEN
			ROLLBACK;
END;
$$;

CALL transfer_money();
SELECT * FROM accounts;