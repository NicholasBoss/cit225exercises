-- create 2 tables
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS transaction;
CREATE TABLE account (
	account_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    avail_balance DOUBLE NOT NULL,
    last_activity_date DATETIME NOT NULL);
CREATE TABLE transaction (
	txn_id INT UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    txn_date DATETIME,
    account_id INT UNSIGNED,
    txn_type_cd VARCHAR(1) NOT NULL,
    amount DOUBLE);
    
INSERT INTO account
(account_id, avail_balance, last_activity_date)
VALUES
(123, 500, '2019-07-10 20:53:27'),
(789, 75, '2019-06-22 15:18:35');

INSERT INTO transaction
VALUES
(1001, '2019-05-15 00:00:00', 123, 'C', 500),
(1002, '2019-06-01 00:00:00', 789, 'C', 75),
(1003, '2020-11-29 15:02:35', 123, 'D', 50),
(1004, '2019-05-15 15:03:04', 789, 'C', 50);
-- 12-1
SELECT account_id,
	   SUM(CASE WHEN txn_type_cd = 'C' THEN amount
			    WHEN txn_type_cd = 'D' THEN amount * -1
		   END) AS account_balance
FROM   transaction
WHERE account_id IN (123,789)
GROUP BY account_id;
-- 12-2
-- member and customer
-- 12-3
-- none of the above
-- 12-4
-- none of the above
-- 12-5
-- the withdrawal and deposit were not treated as a single transaction.