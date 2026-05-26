USE rossmann_sales_mysql;
SELECT
	x.store,
	x.total_sales,
	x.assortment,
    x.peer_group_average_sales,
    x.difference_from_peer_average
FROM 
(
	SELECT
		sv.store,
        sv.total_sales,
        sv.assortment,
        (
			SELECT
				AVG(ssv.total_sales)
            FROM store_total_sales_by_assortment_summary_view ssv
            WHERE ssv.assortment= sv.assortment
        ) AS peer_group_average_sales,
        (
			SELECT
				sv.total_sales-AVG(ssv.total_sales)
            FROM store_total_sales_by_assortment_summary_view ssv
            WHERE ssv.assortment= sv.assortment
        ) AS difference_from_peer_average
    FROM store_total_sales_by_assortment_summary_view sv
) AS x
WHERE x.difference_from_peer_average<0
ORDER BY
	x.assortment,
    x.difference_from_peer_average;
    
SELECT
	x.store,
	x.total_sales,
	x.store_type,
    x.peer_group_average_sales,
    x.difference_from_peer_average
FROM 
(
	SELECT
		sv.store,
        sv.total_sales,
        sv.store_type,
        (
			SELECT
				AVG(ssv.total_sales)
            FROM store_total_sales_summary_view ssv
            WHERE ssv.store_type= sv.store_type
        ) AS peer_group_average_sales,
        (
			SELECT
				sv.total_sales-AVG(ssv.total_sales)
            FROM store_total_sales_summary_view ssv
            WHERE ssv.store_type= sv.store_type
        ) AS difference_from_peer_average
    FROM store_total_sales_summary_view sv
) AS x
WHERE x.difference_from_peer_average<0
ORDER BY
	x.store_type,
    x.difference_from_peer_average;