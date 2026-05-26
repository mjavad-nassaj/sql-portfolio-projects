USE rossmann_sales_mysql;
DELIMITER $$
DROP PROCEDURE IF EXISTS refresh_store_daily_summary $$
CREATE PROCEDURE refresh_store_daily_summary()
BEGIN
	DELETE FROM store_daily_summary;
    INSERT INTO store_daily_summary
    (
		store,
		date,
		day_of_week,
		sales,
		customers,
		open,
		promo,
		state_holiday,
		school_holiday,
		store_type,
		assortment,
		competition_distance,
		promo2,
		sales_year,
		sales_month,
		sales_quarter
    )
	SELECT
		tsv.Store,
		tsv.Date,
		tsv.DayOfWeek,
		tsv.Sales,
		tsv.Customers,
		tsv.Open,
		tsv.Promo,
		tsv.StateHoliday,
		tsv.SchoolHoliday,
		tsv.StoreType,
		tsv.Assortment,
		tsv.CompetitionDistance,
		tsv.Promo2,
		YEAR(tsv.Date) AS sales_year,
		MONTH(tsv.Date) AS sales_month,
		QUARTER(tsv.Date) AS sales_quarter
    FROM train_store_enriched_view tsv;
END $$
DELIMITER ;