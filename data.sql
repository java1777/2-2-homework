CREATE DATABASE IF NOT EXISTS transfer_money;
USE transfer_money;

CREATE TABLE IF NOT EXISTS accounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    balance DECIMAL(10,2) CHECK (balance > 0)
);

INSERT INTO accounts (name, balance) VALUES
('Javohir', 1000),
('Komol', 500);

DELIMITER //
CREATE PROCEDURE transfer (IN money DECIMAL(10,2))
BEGIN
DECLARE current_balance DECIMAL(10,2);

START TRANSACTION;

UPDATE accounts
SET balance = balance-money
WHERE name = 'Javohir';

SAVEPOINT add_money;

SELECT balance INTO current_balance
FROM accounts
WHERE name = 'Javohir';

IF current_balance < 0 THEN
    ROLLBACK to add_money;

ELSE
    UPDATE accounts
    SET balance = balance + money
    WHERE name = 'Komol';

    COMMIT;

END IF;

END //
DELIMITER;

SET @x = 200;
CALL transfer(@x);

SELECT * FROM accounts
SHOW PROCEDURE STATUS WHERE DATABASE = 'transfer_money'