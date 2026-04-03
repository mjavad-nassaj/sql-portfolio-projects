USE sql_store;

DROP PROCEDURE IF EXISTS generate_customer_sales_summary;
DELIMITER $$

CREATE PROCEDURE generate_customer_sales_summary()
BEGIN

    TRUNCATE TABLE customer_sales_summary;

    INSERT INTO customer_sales_summary (
        customer_id,
        full_name,
        city,
        total_orders,
        first_order_date,
        last_order_date,
        total_spent,
        avg_order_value,
        customer_level
    )
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS full_name,
        c.city,
        COUNT(ofs.order_id) AS total_orders,
        MIN(ofs.order_date) AS first_order_date,
        MAX(ofs.order_date) AS last_order_date,
        ROUND(SUM(ofs.total_order_amount), 2) AS total_spent,
        ROUND(AVG(ofs.total_order_amount), 2) AS avg_order_value,
        CASE
            WHEN SUM(ofs.total_order_amount) > 150 THEN 'Gold'
            WHEN SUM(ofs.total_order_amount) BETWEEN 80 AND 150 THEN 'Silver'
            ELSE 'Bronze'
        END AS customer_level
    FROM customers c
    JOIN order_financial_summary ofs
        USING (customer_id)
    WHERE c.customer_id IN (
        SELECT DISTINCT customer_id
        FROM orders
    )
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.city;

    UPDATE customers c
    JOIN customer_sales_summary css
        ON c.customer_id = css.customer_id
    SET c.points = c.points +
        CASE
            WHEN css.customer_level = 'Gold' THEN 500
            WHEN css.customer_level = 'Silver' THEN 200
            ELSE 0
        END;

    SELECT
        css.customer_id,
        css.full_name,
        css.city,
        css.total_spent
    FROM customer_sales_summary css
    WHERE css.total_spent > (
        SELECT AVG(css2.total_spent)
        FROM customer_sales_summary css2
        WHERE css2.city = css.city
    )
    ORDER BY css.customer_id DESC;

    SELECT
        city,
        customer_level,
        COUNT(*) AS number_of_customers,
        ROUND(SUM(total_spent), 2) AS total_spent
    FROM customer_sales_summary
    GROUP BY city, customer_level WITH ROLLUP;

END $$

DELIMITER ;