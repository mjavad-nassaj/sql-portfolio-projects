USE rossmann_sales_mysql;
DROP VIEW IF EXISTS train_store_enriched_view;
CREATE VIEW train_store_enriched_view AS
SELECT
	t.Store,
	t.DayOfWeek,
	t.Date,
	t.Sales,
	t.Customers,
	t.Open,
	t.Promo,
	t.StateHoliday,
	t.SchoolHoliday,
	s.StoreType,
	s.Assortment,
	s.CompetitionDistance,
	s.CompetitionOpenSinceMonth,
	s.CompetitionOpenSinceYear,
	s.Promo2,
	s.Promo2SinceWeek,
	s.Promo2SinceYear,
	s.PromoInterval
FROM train t
LEFT JOIN store s
	USING(Store);