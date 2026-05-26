USE rossmann_sales_mysql;
SELECT
	x.store,
	x.store_type,
	x.total_sales,
	x.peer_group_average_sales,
	x.total_sales - x.peer_group_average_sales AS difference_from_peer_average
FROM 
(
	SELECT
		sv_1.store,
		sv_1.store_type,
		sv_1.total_sales,
        (
			SELECT
				AVG(sv_2.total_sales)
			FROM store_total_sales_summary_view sv_2
            WHERE sv_2.store_type= sv_1.store_type
        ) AS peer_group_average_sales
	FROM store_total_sales_summary_view sv_1
) AS x
ORDER BY
    x.store_type,
    difference_from_peer_average DESC;