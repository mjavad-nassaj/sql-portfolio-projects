USE sql_store;
UPDATE customers c
SET points = points + (
    CASE 
        WHEN (
            SELECT customer_level
            FROM customer_sales_summary css
            WHERE css.customer_id = c.customer_id
        ) = 'Gold' THEN 500

        WHEN (
            SELECT customer_level
            FROM customer_sales_summary css
            WHERE css.customer_id = c.customer_id
        ) = 'Silver' THEN 200

        ELSE 0
    END
);