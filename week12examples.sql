-- 13-1
ALTER TABLE rental
ADD CONSTRAINT fk_rental_customer_id FOREIGN KEY (customer_id)
REFERENCES customer (customer_id) ON DELETE RESTRICT;

-- 13-2
CREATE INDEX idx_payment01
ON payment (payment_date, amount);

-- 13-3
DROP TABLE IF EXISTS vehicle;

CREATE TABLE vehicle (
vehicle_id   INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
vin          VARCHAR(17) UNIQUE,
vehicle_name VARCHAR(64));

-- This works after 4 is complete but it doesn't show the Index_Type:
SELECT CONCAT(s.table_schema,'.',s.table_name,'.',s.index_name,'.',s.column_name) AS 'Unique Index'
FROM information_schema.statistics s
WHERE s.table_schema = database()
AND   s.table_name = 'vehicle'
AND   s.column_name = 'vin';


-- this works to show all the index information:
SHOW INDEX FROM vehicle;

-- THIS IS THE RIGHT ANSWER!
SELECT s.index_type
FROM information_schema.statistics s
WHERE s.table_schema = database()
AND   s.table_name = 'vehicle'
AND   s.column_name = 'vin';

-- 13-4
CREATE UNIQUE INDEX idx_vehicle_vin ON vehicle(vin);

SELECT s.table_name, s.index_name, s.seq_in_index, s.column_name
FROM information_schema.statistics s
WHERE s.table_name = 'vehicle'
AND   s.index_name = 'idx_vehicle_vin'
AND   s.non_unique = FALSE
AND   EXISTS 
	  (SELECT NULL
       FROM information_schema.table_constraints tc
       WHERE s.table_name = tc.table_name
       AND   s.index_name = tc.constraint_name)
ORDER BY s.table_name, s.seq_in_index;

-- 13-5
CREATE UNIQUE INDEX idx_vehicle_combo ON vehicle(vin, vehicle_name);

SELECT s.table_name, s.index_name, s.seq_in_index, s.column_name
FROM information_schema.statistics s
WHERE s.table_name = 'vehicle'
AND   s.index_name = 'idx_vehicle_combo'
AND   s.non_unique = FALSE
AND   EXISTS 
	  (SELECT NULL
       FROM information_schema.table_constraints tc
       WHERE s.table_name = tc.table_name
       AND   s.index_name = tc.constraint_name)
ORDER BY s.table_name, s.seq_in_index;
