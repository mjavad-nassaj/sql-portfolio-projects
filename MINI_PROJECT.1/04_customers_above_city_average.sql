USE sql_store;
SELECT
    customer_id,
    full_name,
    city,
    total_spent
FROM customer_sales_summary css
WHERE total_spent > (
    SELECT AVG(total_spent)
    FROM customer_sales_summary
    WHERE city = css.city
)
ORDER BY customer_id DESC;


-- WITH JOIN

-- SELECT
	-- css.customer_id,
   --  css.full_name,
   -- css.city,
   -- css.total_spend
-- FROM customer_sales_summary css
-- JOIN (
-- 	SELECT
-- 	city,
  --   AVG(total_spend) AS avg_spend
	-- FROM customer_sales_summary
	-- GROUP BY 
	-- 	city
-- ) avg_table
-- 	ON css.city=avg_table.city
-- WHERE css.total_spend>avg_table.avg_spend





