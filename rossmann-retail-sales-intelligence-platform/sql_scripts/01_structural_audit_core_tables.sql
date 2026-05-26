USE rossmann_sales_mysql;
SELECT
	table_name,
    table_rows
FROM information_schema.tables
WHERE table_schema = 'rossmann_sales_mysql';

SELECT
    COUNT(*) AS number_of_tables
FROM information_schema.tables
WHERE table_schema = 'rossmann_sales_mysql';

SELECT
	COUNT(s.Store)
FROM store s;
SELECT
	COUNT(t.Store)
FROM train t;

SELECT
	COUNT(DISTINCT s.Store)
FROM store s;
SELECT
	COUNT(DISTINCT t.Store)
FROM train t;


DESCRIBE
	store;
DESCRIBE
	train;

SELECT
	MAX(t.date) AS last_date,
    MIN(t.date) AS first_date
FROM train t;