
-- 1
-- SELECT actor_id, first_name, last_name
-- FROM actor
-- ORDER BY last_name, first_name;

-- 2
-- SELECT actor_id, first_name, last_name
-- FROM actor
-- -- WHERE last_name IN ('DAVIS', 'WILLIAMS');
-- WHERE last_name = 'WILLIAMS' OR last_name = 'DAVIS';

-- 3
-- SELECT DISTINCT customer_id, date(rental_date) as rental_date
-- FROM rental
-- WHERE date(rental_date) = '2005-07-05';

-- 4
-- SELECT c.email, r.return_date
-- FROM customer c INNER JOIN rental r
-- ON c.customer_id = r.customer_id
-- WHERE date(r.rental_date) = '2005-06-14'
-- ORDER BY r.return_date desc;

-- 5
-- SELECT DISTINCT last_name
-- FROM actor
-- ORDER BY last_name;

