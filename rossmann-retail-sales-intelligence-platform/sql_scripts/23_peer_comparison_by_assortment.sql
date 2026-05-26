USE rossmann_sales_mysql;
SELECT
	x.store,
	x.assortment,
	x.total_sales,
	x.peer_group_average_sales,
	x.difference_from_peer_average
FROM 
(
	SELECT
		sv.store,
		sv.assortment,
		sv.total_sales,
        (
			SELECT
				AVG(ssv.total_sales) 
            FROM store_total_sales_by_assortment_summary_view ssv
            WHERE ssv.assortment=sv.assortment
            GROUP BY
				ssv.assortment
        ) AS peer_group_average_sales,
        (
			SELECT
				sv.total_sales-AVG(ssv.total_sales) 
            FROM store_total_sales_by_assortment_summary_view ssv
            WHERE ssv.assortment=sv.assortment
            GROUP BY
				ssv.assortment
        ) AS difference_from_peer_average
    FROM store_total_sales_by_assortment_summary_view sv
) AS x
ORDER BY
    x.assortment,
    x.difference_from_peer_average DESC;