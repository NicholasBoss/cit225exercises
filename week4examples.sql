-- 5-1
-- fill in the blanks
SELECT c.first_name, c.last_name, a.address, ct.city
FROM customer c INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id
WHERE a.district = 'California';
-- 5-2
-- Write a query that returns the title of every film in which an actor with the first name JOHN appeared.
SELECT f.title
FROM film f INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
WHERE a.first_name = 'John';
-- 5-3
-- Construct a query that returns all addresses that are in the same city. 
-- You will need to join the address table to itself, and each row should include two different addresses.
SELECT a1.address AS addr1, a2.address AS addr2, c.city
FROM address a1 INNER JOIN address a2
ON a1.city_id = a2.city_id
INNER JOIN city c
ON a1.city_id = c.city_id
WHERE NOT a1.address = a2.address;
-- 5-4
-- All films starring Joe Swank with length between 90 and 120 min. display title and length
SELECT f.title, f.length
FROM film f INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
WHERE f.length BETWEEN 90 AND 120
AND a.first_name = 'Joe' AND a.last_name = 'Swank';
-- 5-5
-- Staff members who rented items
SELECT DISTINCT s.first_name, s.last_name
FROM staff s INNER JOIN rental r
ON s.staff_id = r.staff_id;
-- OR
SELECT s.first_name, s.last_name
FROM staff s INNER JOIN rental r
ON s.staff_id = r.staff_id
GROUP BY s.first_name, s.last_name;