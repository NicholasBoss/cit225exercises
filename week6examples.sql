-- 7-1
DROP TABLE IF EXISTS exercise7_1;
CREATE TABLE exercise7_1
( text VARCHAR(100) );

INSERT INTO exercise7_1
( text )
VALUES
('Please find the substring in this string');

WITH context AS
(SELECT 'substring' AS needle)
SELECT SUBSTR(text,INSTR(text,context.needle),LENGTH(context.needle)) AS parsed
FROM exercise7_1 CROSS JOIN context;

-- 7-2
DROP TABLE IF EXISTS exercise7_2;
CREATE TABLE exercise7_2
( double_number DOUBLE);


INSERT INTO exercise7_2
( double_number )
VALUES
( -25.76823);

SELECT ABS(double_number) AS 'ABS'
,      SIGN(double_number) AS 'SIGN'
,      ROUND(double_number,2) AS 'ROUND'
FROM   exercise7_2;

-- 7-3
DROP TABLE IF EXISTS exercise7_3;
CREATE TABLE exercise7_3
( date_value DATE);

INSERT INTO exercise7_3
( date_value )
VALUES
('2021-01-01'),
('2021-02-01'),
('2021-03-01'),
('2021-04-01'),
('2021-05-01'),
('2021-06-01'),
('2021-07-01'),
('2021-08-01'),
('2021-09-01'),
('2021-10-01'),
('2021-11-01'),
('2021-12-01');

SELECT EXTRACT(MONTH FROM date_value) AS 'Month'
FROM exercise7_3
WHERE EXTRACT(MONTH FROM date_value) = 11;

-- 7-4
SET @string := 'Sorcer''s Stone';

SELECT @string;

SELECT REPLACE(@string, 'er','erer') AS title;

-- 7-5
SET @string := '29-FEB-2024';

SELECT @string;

SET @string := '2024-02-29';

SELECT DATE(@string) AS 'Date';

SElECT DATE_FORMAT(DATE(@string), '%d-%b-%Y') AS 'Date';