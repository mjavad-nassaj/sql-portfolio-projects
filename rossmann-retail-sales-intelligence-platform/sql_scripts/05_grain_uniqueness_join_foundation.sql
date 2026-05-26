USE rossmann_sales_mysql;
SELECT
    COUNT(*) AS total_train_rows,
    COUNT(DISTINCT CONCAT(Store, '_', Date)) AS distinct_store_date_rows
FROM train;

SELECT
    COUNT(*) AS total_store_rows,
    COUNT(DISTINCT Store) AS distinct_store_ids
FROM store;

SELECT
    COUNT(*) AS train_row_count
FROM train;

SELECT
    COUNT(*) AS joined_row_count
FROM train t
JOIN store s
    ON t.Store = s.Store;