USE rossmann_sales_mysql;
SELECT
	competition_distance_band,
    COUNT(DISTINCT Store ) AS store_count,
	SUM(Sales) AS total_sales,
	SUM(Customers) AS total_customers,
	AVG(Sales) AS average_sales,
	AVG(Customers) AS average_customers
FROM 
(
	SELECT
		tv.Store,
		tv.Sales,
		tv.Customers,
		(CASE
			WHEN CompetitionDistance IS NULL THEN 'no_competition_info'
			WHEN CompetitionDistance>0 AND CompetitionDistance<= 500 THEN 'very_near'
			WHEN CompetitionDistance>500 AND CompetitionDistance<= 2000 THEN 'near'
			WHEN CompetitionDistance>2000 AND CompetitionDistance<= 5000 THEN 'medium'
			ELSE 'far'
		END ) AS competition_distance_band
	FROM train_store_enriched_view tv
) AS x
GROUP BY
	competition_distance_band;