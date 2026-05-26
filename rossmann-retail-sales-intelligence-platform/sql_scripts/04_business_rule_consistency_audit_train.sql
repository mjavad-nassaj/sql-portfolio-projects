USE rossmann_sales_mysql;
SELECT
	SUM(
		CASE
			WHEN open=0 AND Sales>0 THEN 1
			ELSE 0
		END
    ) AS relation_ship_between_sale_and_open,
    SUM(
		CASE
			WHEN open=0 AND customers>0 THEN 1
            ELSE 0
        END
    ) AS relation_ship_between_open_and_customers,
    SUM(
		CASE
			WHEN Sales>0 AND customers=0 THEN 1
            WHEN Sales=0 AND customers>0 THEN 1
            ELSE 0
        END
    ) AS relation_ship_between_sales_and_customers
FROM train;


SELECT
    Store,
    Date,
    Open,
    Sales,
    Customers
FROM train
WHERE
      (Sales > 0 AND Customers = 0)
   OR (Sales = 0 AND Customers > 0);