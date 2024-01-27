-- 4-1
-- customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23')
SELECT payment_id, customer_id, amount, DATE(payment_date) AS 'Payment Date'
FROM payment
WHERE payment_id BETWEEN 101 AND 120
AND customer_id <> 5 AND (amount > 8 OR DATE(payment_date) = '2005-08-23');

-- 4-2
-- customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '2005-06-19')
SELECT payment_id, customer_id, amount, DATE(payment_date) AS 'Payment Date'
FROM payment
WHERE payment_id BETWEEN 101 AND 120
AND customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '2005-06-19');

-- 4-3
-- Construct a query that retrieves all rows from the payments table where the amount is either 1.98, 7.98, or 9.98.
SELECT payment_id
FROM payment
WHERE amount IN (1.98, 7.98, 9.98);

-- 4-4
-- Construct a query that finds all customers whose last name contains an A in the second position and a W anywhere after the A.
SELECT last_name
FROM customer
WHERE last_name LIKE '_A%W%';

-- 4-5
-- Construct a query that finds all customers whose last name contains an E in the second position.
SELECT last_name
FROM customer
WHERE last_name LIKE '_E%';