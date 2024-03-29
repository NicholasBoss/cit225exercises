CALL set_full_group_by();
-- Rewrite the following query, which uses a simple case expression, 
-- so that the same results are achieved using a searched case expression. 
-- Try to use as few when clauses as possible.
-- 11-1
SELECT name,
	CASE
		WHEN name IN ('English','Italian','French','German')
        THEN 'latin1'
        WHEN name IN ('Japanese','Mandarin')
        THEN 'utf8'
        ELSE 'unknown'
	END character_set
FROM language;

-- 	Rewrite the following query so that the result set contains a single row with five columns (one for each rating). 

-- Name the five columns G, PG, PG_13, R, and NC_17.
-- 11-2
-- SELECT rating, count(*)
-- FROM film 
-- GROUP BY rating;
SELECT 
	SUM(CASE WHEN rating = 'G' THEN 1 ELSE 0 END) G,
    SUM(CASE WHEN rating = 'PG' THEN 1 ELSE 0 END) PG,
    SUM(CASE WHEN rating = 'PG-13' THEN 1 ELSE 0 END) 'PG-13',
    SUM(CASE WHEN rating = 'R' THEN 1 ELSE 0 END) R,
    SUM(CASE WHEN rating = 'NC-17' THEN 1 ELSE 0 END) 'NC-17'
FROM film;

-- 11-3
SELECT SUBSTR(last_name, 1,1) AS starts_with
,	   SUM(CASE WHEN active = 1 THEN 1 ELSE 0 END) AS active_count
,      SUM(CASE WHEN active = 0 THEN 1 ELSE 0 END) AS inactive_count
FROM   customer
GROUP BY SUBSTR(last_name,1,1)
ORDER BY 1;

-- 11-4
WITH letters AS
(SELECT 'A' AS letter
 UNION ALL
 SELECT 'B' AS letter
 UNION ALL
 SELECT 'C' AS letter
 UNION ALL
 SELECT 'D' AS letter
 UNION ALL
 SELECT 'E' AS letter
 UNION ALL
 SELECT 'F' AS letter
 UNION ALL
 SELECT 'G' AS letter
 UNION ALL
 SELECT 'H' AS letter
 UNION ALL
 SELECT 'I' AS letter
 UNION ALL
 SELECT 'J' AS letter
 UNION ALL
 SELECT 'K' AS letter
 UNION ALL
 SELECT 'L' AS letter
 UNION ALL
 SELECT 'M' AS letter
 UNION ALL
 SELECT 'N' AS letter
 UNION ALL
 SELECT 'O' AS letter
 UNION ALL
 SELECT 'P' AS letter
 UNION ALL
 SELECT 'Q' AS letter
 UNION ALL
 SELECT 'R' AS letter
 UNION ALL
 SELECT 'S' AS letter
 UNION ALL
 SELECT 'T' AS letter
 UNION ALL
 SELECT 'U' AS letter
 UNION ALL
 SELECT 'V' AS letter
 UNION ALL
 SELECT 'W' AS letter
 UNION ALL
 SELECT 'X' AS letter
 UNION ALL
 SELECT 'Y' AS letter
 UNION ALL
 SELECT 'Z' AS letter)
SELECT l.letter AS starts_with
,	   SUM(CASE WHEN active = 1 THEN 1 ELSE 0 END) AS active_count
,      SUM(CASE WHEN active = 0 THEN 1 ELSE 0 END) AS inactive_count
FROM   customer c RIGHT JOIN letters l
ON     SUBSTR(c.last_name,1,1) = l.letter
GROUP BY l.letter
ORDER BY 1;

-- 11-5
SELECT SUBSTR(last_name, 1,1) AS starts_with
,	   SUM(CASE WHEN active = 1 THEN 1 ELSE 0 END) AS active_count
,      SUM(CASE WHEN active = 0 THEN 1 ELSE 0 END) AS inactive_count
FROM   customer
GROUP BY SUBSTR(last_name,1,1)
HAVING SUM(CASE WHEN active = 1 THEN 1 ELSE 0 END) > 30
ORDER BY 1;