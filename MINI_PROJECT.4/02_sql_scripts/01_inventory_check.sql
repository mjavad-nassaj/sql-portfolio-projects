USE gtfs_berlin;
SELECT
    table_name,
    table_rows
FROM information_schema.tables
WHERE table_schema = 'gtfs_berlin'
ORDER BY 
    table_name;
SELECT
    COUNT(*) AS total_tables
FROM information_schema.tables
WHERE table_schema = 'gtfs_berlin';