-- 14 -1
-- create a view definition that can be used by the following query to generate the given results from this query:
-- SELECT title, category_name, first_name, last_name
-- FROM film_ctgry_actor
-- WHERE last_name = 'FAWCETT';

CREATE OR REPLACE VIEW film_ctgry_actor AS
SELECT f.title, c.name AS category_name, a.first_name, a.last_name
FROM film f 
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c 
ON fc.category_id = c.category_id
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id;

-- 14-2
-- film rental mngr needs report incl. country name, total payments for all customers in that country.
-- use correlated sub-query that calculates value for column named tot_payments
CREATE OR REPLACE VIEW country_payments AS
SELECT ctry.country,
	   (SELECT SUM(p.amount)
        FROM city c INNER JOIN address a
        ON   c.city_id = a.city_id INNER JOIN customer cus
        ON   a.address_id = cus.address_id INNER JOIN payment p
        ON   cus.customer_id = p.customer_id
        WHERE c.country_id = ctry.country_id) AS tot_payments
FROM country ctry;

SELECT * FROM country_payments;

-- 14-3
CREATE OR REPLACE VIEW film_actor_count AS
SELECT first_name, last_name, COUNT(*) AS films_by_actor
FROM film_ctgry_actor
WHERE last_name = 'FAWCETT'
GROUP BY first_name, last_name;

INSERT INTO film_actor_count
(first_name, last_name)
VALUES
('John','Doe');

-- 14-4
-- create updatable film_actor_v view that joins the film, film_actor, and actor tables. Describe the film_actor_v view.
CREATE OR REPLACE VIEW film_actor_v AS
SELECT a.actor_id, f.title, a.first_name, a.last_name,
	   a.last_update AS last_update_actor, f.film_id, description, release_year,
       language_id, original_language_id, rental_duration, rental_rate,
       length, replacement_cost, rating, special_features, f.last_update AS last_update_film
FROM   film f INNER JOIN film_actor fa ON f.film_id = fa.film_id
       INNER JOIN actor a ON fa.actor_id = a.actor_id;

DESCRIBE film_actor_v;
-- 14-5
-- create the needed views and tables first (found in exercises quiz)
-- Use sakila database.
USE sakila;
 
-- Add a prequel_id column to the sakila.film table.
ALTER TABLE film
ADD (series_name    varchar(20)),
ADD (series_number  int unsigned),
ADD (prequel_id     int unsigned);
 
-- Set primary to foreign key local variable.
SET @sv_film_id = 0;
 
-- Insert Harry Potter films in sakila.film table with classic values clause.
INSERT INTO film
( title
, description
, release_year
, language_id
, original_language_id
, rental_duration
, rental_rate
, length
, replacement_cost
, rating
, special_features
, last_update
, series_name
, series_number
, prequel_id )
VALUES
('Harry Potter and the Sorcerer''s Stone'
,'A film about a young boy who on his eleventh birthday discovers, he is the orphaned boy of two powerful wizards and has unique magical powers.'
, 2001
, 1
, NULL
, 3
, 0.99
, 152
, 19.99
,'PG'
,'Trailers'
,'2001-11-04'
,'Harry Potter'
, 1
, NULL );
 
-- Assign the last generated primary key value to the local variable.
SET @sv_film_id := last_insert_id();
 
-- Insert 2nd film in sakila.film table with classic values clause.
INSERT INTO film
( title
, description
, release_year
, language_id
, original_language_id
, rental_duration
, rental_rate
, length
, replacement_cost
, rating
, special_features
, last_update
, series_name
, series_number
, prequel_id )
VALUES
('Harry Potter and the Chamber of Secrets'
,'A film where Harry returning to Hogwarts, still famous and a hero, when strange things start to happen ... people are turning to stone and no-one knows what, or who, is doing it.'
, 2002
, 1
, NULL
, 3
, 0.99
, 160
, 19.99
,'PG'
,'Trailers'
,'2002-11-15'
,'Harry Potter'
, 2
, @sv_film_id );
 
-- Assign the last generated primary key value to the local variable.
SET @sv_film_id := last_insert_id();
 
-- Insert 3rd film in sakila.film table with classic values clause.
INSERT INTO film
( title
, description
, release_year
, language_id
, original_language_id
, rental_duration
, rental_rate
, length
, replacement_cost
, rating
, special_features
, last_update
, series_name
, series_number
, prequel_id )
VALUES
('Harry Potter and the Prisoner of Azkaban'
,'A film where Harry, Ron, and Hermione return for their third year at Hogwarts and are forced to face escaped prisoner, Sirius Black.'
, 2004
, 1
, NULL
, 3
, 0.99
, 141
, 19.99
,'PG'
,'Trailers'
,'2004-06-04'
,'Harry Potter'
, 3
, @sv_film_id );
 
-- Assign the last generated primary key value to the local variable.
SET @sv_film_id := last_insert_id();
 
-- Insert 4th film in sakila.film table with classic values clause.
INSERT INTO film
( title
, description
, release_year
, language_id
, original_language_id
, rental_duration
, rental_rate
, length
, replacement_cost
, rating
, special_features
, last_update
, series_name
, series_number
, prequel_id )
VALUES
('Harry Potter and the Goblet of Fire'
,'A film where where Harry Potter''s name emerges from the Goblet of Fire, and he becomes a competitor in a grueling battle for glory among three wizarding schools - the Triwizard Tournament.'
, 2005
, 1
, NULL
, 3
, 0.99
, 157
, 19.99
,'PG'
,'Trailers'
,'2005-11-18'
,'Harry Potter'
, 4
, @sv_film_id );
 
-- Assign the last generated primary key value to the local variable.
SET @sv_film_id := last_insert_id();
 
-- Insert 5th film in sakila.film table with classic values clause.
INSERT INTO film
( title
, description
, release_year
, language_id
, original_language_id
, rental_duration
, rental_rate
, length
, replacement_cost
, rating
, special_features
, last_update
, series_name
, series_number
, prequel_id )
VALUES
('Harry Potter and the Order of the Phoenix'
,'A film where Lord Voldemort has returned, but the Ministry of Magic is doing everything it can to keep the wizarding world from knowing the truth.'
, 2007
, 1
, NULL
, 3
, 0.99
, 138
, 19.99
,'PG-13'
,'Trailers'
,'2007-07-12'
,'Harry Potter'
, 5
, @sv_film_id );
 
-- Assign the last generated primary key value to the local variable.
SET @sv_film_id := last_insert_id();
 
-- Insert 6th film in sakila.film table with classic values clause.
INSERT INTO film
( title
, description
, release_year
, language_id
, original_language_id
, rental_duration
, rental_rate
, length
, replacement_cost
, rating
, special_features
, last_update
, series_name
, series_number
, prequel_id )
VALUES
('Harry Potter and the Half Blood Prince'
,'A film where Voldemort is tightening his grip on Hogwarts and it is no longer the safe haven it once was. Harry and Dumbledore work to find the key to unlock the Dark Lord''s defenses.'
, 2009
, 1
, NULL
, 3
, 0.99
, 153
, 19.99
,'PG'
,'Trailers'
,'2009-07-15'
,'Harry Potter'
, 6
, @sv_film_id );
 
-- Assign the last generated primary key value to the local variable.
SET @sv_film_id := last_insert_id();
 
-- Insert 7th film in sakila.film table with classic values clause.
INSERT INTO film
( title
, description
, release_year
, language_id
, original_language_id
, rental_duration
, rental_rate
, length
, replacement_cost
, rating
, special_features
, last_update
, series_name
, series_number
, prequel_id )
VALUES
('Harry Potter and the Deathly Hallows: Part 1'
,'A film where Harry, Ron and Hermione set out on their perilous mission to track down and destroy the Horcruxes - the keys to Voldemort''s immortality.'
, 2010
, 1
, NULL
, 3
, 0.99
, 146
, 19.99
,'PG-13'
,'Trailers'
,'2010-11-19'
,'Harry Potter'
, 7
, @sv_film_id );
 
-- Assign the last generated primary key value to the local variable.
SET @sv_film_id := last_insert_id();
 
-- Insert 8th film in sakila.film table with classic values clause.
INSERT INTO film
( title
, description
, release_year
, language_id
, original_language_id
, rental_duration
, rental_rate
, length
, replacement_cost
, rating
, special_features
, last_update
, series_name
, series_number
, prequel_id )
VALUES
('Harry Potter and the Deathly Hallows: Part 2'
,'A film where Harry, Ron and Hermione set out on their perilous mission to track down and destroy the Horcruxes - the keys to Voldemort''s immortality.'
, 2011
, 1
, NULL
, 3
, 0.99
, 130
, 19.99
,'PG-13'
,'Trailers'
,'2011-07-15'
,'Harry Potter'
, 8
, @sv_film_id );

-- 12-5 answer
SELECT f.title AS film,
	   IFNULL(
			CASE
            WHEN NOT f.film_id = fp.film_id
            AND      f.prequel_id = fp.film_id THEN fp.title
            END, 'None') AS prequel
FROM film f LEFT JOIN film fp
ON   f.prequel_id = fp.film_id
WHERE f.series_name = 'Harry Potter'
ORDER BY f.series_number;
