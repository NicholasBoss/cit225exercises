DROP TABLE IF EXISTS payment_backup;

CREATE TABLE payment_backup AS
SELECT payment_id
,	   customer_id
, 	   staff_id
, 	   rental_id
,	   amount
,      payment_date
,      last_update
FROM   payment
WHERE  customer_id =
	  (SELECT customer_id
	   FROM customer
       WHERE first_name = 'ELLA'
       AND   last_name = 'OLIVER');
       
DELETE FROM payment
WHERE customer_id = (SELECT customer_id
					 FROM customer
                     WHERE first_name = 'ELLA'
                     AND   last_name  = 'OLIVER');

-- 1
SELECT CONCAT(c.first_name, ' ', c.last_name) AS name, SUM(p.amount)
FROM   customer c LEFT JOIN payment p
ON     c.customer_id = p.customer_id
WHERE  c.customer_id IN (1,4,210)
GROUP BY name
ORDER BY name;

-- 2
SELECT CONCAT(c.first_name, ' ', c.last_name) AS name, SUM(p.amount)
FROM   payment p RIGHT JOIN customer c
ON     c.customer_id = p.customer_id
WHERE  c.customer_id IN (1,4,210)
GROUP BY name
ORDER BY name;

-- insert to recover data
INSERT INTO payment
(payment_id
, customer_id
, staff_id
, rental_id
, amount
, payment_date
, last_update )
( SELECT *
  FROM payment_backup
  WHERE customer_id = (SELECT customer_id
					  FROM customer
                      WHERE first_name = 'ELLA'
                      AND   last_name  = 'OLIVER'));

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS name
,      COUNT(p.payment_id) AS payments
,      SUM(p.amount)
FROM   customer c LEFT JOIN payment p
ON     c.customer_id = p.customer_id
WHERE  c.customer_id IN (1,4,210)
GROUP BY c.customer_id, name
ORDER BY name;

SELECT customer_id, COUNT(*), SUM(amount)
FROM payment
GROUP BY customer_id;

SELECT CONCAT(c.first_name, ' ', c.last_name) AS name, SUM(p.amount)
FROM customer c RIGHT JOIN payment p
ON c.customer_id = p.customer_id
WHERE c.customer_id IN (1,4,210)
GROUP BY name
ORDER BY name;

-- 3 
SELECT ones.x + tens.x + 1 AS counter
FROM
 (SELECT 0 AS x UNION ALL
  SELECT 1 AS x UNION ALL
  SELECT 2 AS x UNION ALL
  SELECT 3 AS x UNION ALL
  SELECT 4 AS x UNION ALL
  SELECT 5 AS x UNION ALL
  SELECT 6 AS x UNION ALL
  SELECT 7 AS x UNION ALL
  SELECT 8 AS x UNION ALL
  SELECT 9 AS x ) ones CROSS JOIN
 (SELECT 0 AS x UNION ALL
  SELECT 10 AS x UNION ALL
  SELECT 20 AS x UNION ALL
  SELECT 30 AS x UNION ALL
  SELECT 40 AS x UNION ALL
  SELECT 50 AS x UNION ALL
  SELECT 60 AS x UNION ALL
  SELECT 70 AS x UNION ALL
  SELECT 80 AS x UNION ALL
  SELECT 90 AS x ) tens
ORDER BY counter;

-- OR USE THIS
WITH ones AS
(SELECT 0 AS x UNION ALL
  SELECT 1 AS x UNION ALL
  SELECT 2 AS x UNION ALL
  SELECT 3 AS x UNION ALL
  SELECT 4 AS x UNION ALL
  SELECT 5 AS x UNION ALL
  SELECT 6 AS x UNION ALL
  SELECT 7 AS x UNION ALL
  SELECT 8 AS x UNION ALL
  SELECT 9 AS x )
, tens AS
(SELECT 0 AS x UNION ALL
  SELECT 10 AS x UNION ALL
  SELECT 20 AS x UNION ALL
  SELECT 30 AS x UNION ALL
  SELECT 40 AS x UNION ALL
  SELECT 50 AS x UNION ALL
  SELECT 60 AS x UNION ALL
  SELECT 70 AS x UNION ALL
  SELECT 80 AS x UNION ALL
  SELECT 90 AS x )
SELECT ones.x + tens.x + 1 AS counter
FROM ones CROSS JOIN tens
ORDER BY counter DESC;

-- 4
-- LEFT JOIN
SELECT   f.film_id, f.title, i.inventory_id
FROM     film f LEFT JOIN inventory i
ON       f.film_id = i.film_id
WHERE    f.title REGEXP '^RA(I|N).*$'
ORDER BY f.film_id, f.title, i.inventory_id;
-- RIGHT JOIN
SELECT   f.film_id, f.title, i.inventory_id
FROM     inventory i RIGHT JOIN film f
ON       f.film_id = i.film_id
WHERE    f.title REGEXP '^RA(I|N).*$'
ORDER BY f.film_id, f.title, i.inventory_id;

-- 5
-- begin here
SELECT   f.film_id, f.title, i.inventory_id
FROM     film f LEFT JOIN inventory i
ON       f.film_id = i.film_id
WHERE    f.title REGEXP '^RA(I|N).*$'
ORDER BY f.film_id, f.title, i.inventory_id;

-- Solution
SELECT   f.film_id, f.title, i.inventory_id
FROM     film f LEFT JOIN inventory i
ON       f.film_id = i.film_id
WHERE    f.title REGEXP '^RA(I|N).*$'
AND      i.film_id IS NULL
ORDER BY f.film_id, f.title, i.inventory_id;


