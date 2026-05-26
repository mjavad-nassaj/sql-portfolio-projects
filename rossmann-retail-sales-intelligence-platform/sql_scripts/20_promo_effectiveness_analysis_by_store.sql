USE rossmann_sales_mysql;
SELECT
	tv.Store,
    SUM(
		CASE
			WHEN tv.Promo = 1 THEN tv.Sales
			ELSE 0
		END
    ) AS promo_sales,
    SUM(
		CASE
			WHEN tv.Promo = 0 THEN tv.Sales
			ELSE 0
		END
    ) AS non_promo_sales,
    SUM(
		CASE
			WHEN tv.Promo = 1 THEN tv.Customers
			ELSE 0
		END
    ) AS promo_customers,
    SUM(
		CASE
			WHEN tv.Promo = 0 THEN tv.Customers
			ELSE 0
		END
    ) AS non_promo_customers,
    AVG(
		CASE
			WHEN tv.Promo = 1 THEN tv.Sales
			ELSE NULL
		END
    ) AS promo_average_sales,
    AVG(
		CASE
			WHEN tv.Promo = 0 THEN tv.Sales
			ELSE NULL
		END
    ) AS non_promo_average_sales,
    SUM(
		CASE
			WHEN tv.Promo = 1 THEN tv.Sales
			ELSE 0
		END
    ) 
    -
    SUM(
		CASE
			WHEN tv.Promo = 0 THEN tv.Sales
			ELSE 0
		END
    ) AS promo_sales_difference
FROM train_store_enriched_view tv
GROUP BY
	tv.Store
ORDER BY
	promo_sales_difference DESC;