CALL set_full_group_by();
-- 8-1 Construct a query that counts the number of rows in the payment table.
SELECT COUNT(*) AS 'Number of Rows'
FROM payment;
-- 8-2 Modify your query from Exercise 8-1 to count the number of payments made by each customer. 
--     Show the customer ID and the total amount paid for each customer.
SELECT customer_id, COUNT(*) AS '# of Customer Payments',  SUM(amount) AS 'Total amount paid'
FROM payment
GROUP BY customer_id;

-- 8-3 Modify your query from Exercise 8-2 to include only those customers who have made at least 40 payments.
SELECT customer_id, COUNT(*) AS '# of Customer Payments',  SUM(amount) AS 'Total amount paid'
FROM payment
GROUP BY customer_id
HAVING COUNT(*) >= 40;

-- 8-4 Construct a query that displays the following results from a query against the film, 
-- film_actor, and actor tables where the film's rating is either 'G', 'PG', or 'PG-13' 
-- with a row count between 9 and 12 rows and order the results by ascending order of title.
SELECT title, rating, COUNT(*) AS 'row count'
FROM film f INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
WHERE rating IN('G','PG','PG-13')
GROUP BY title, rating
HAVING COUNT(*) BETWEEN 9 AND 12
ORDER BY title;

-- 8-5 Construct a query that displays the following results from a query against the film, 
-- inventory, rental, and customer tables where the film's title starts with 'C' 
-- and the film has been rented at least twice; and order the results by ascending order of title.
SELECT title, rating, COUNT(*) AS 'row count'
FROM film f INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
INNER JOIN customer c
ON r.customer_id = c.customer_id
WHERE title LIKE 'C%'
GROUP BY title, rating
HAVING COUNT(return_date) >= 2
ORDER by title;