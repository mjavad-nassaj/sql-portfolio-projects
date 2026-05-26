USE rossmann_sales_mysql;
SELECT
	tv.Store,
	tv.Date,
	tv.Open,
	tv.Promo,
	tv.StateHoliday,
	tv.SchoolHoliday,
	tv.CompetitionDistance,
	tv.Promo2,
    (CASE
		WHEN tv.Open=1 THEN 'yes'
        ELSE 'no'
    END) AS open_day_flag,
	(CASE
		WHEN tv.Promo=1 THEN 'yes'
        ELSE 'no'
    END) AS promo_day_flag,
	(CASE
		WHEN tv.StateHoliday='0' THEN 'no'
        ELSE 'yes'
    END) AS state_holiday_flag,
	(CASE
		WHEN tv.SchoolHoliday=1 THEN 'yes'
        ELSE 'no'
    END) AS school_holiday_flag,
	(CASE
		WHEN tv.CompetitionDistance IS NOT NULL THEN 'yes'
        ELSE 'no'
    END) AS has_competition_info_flag,
	(CASE
		WHEN tv.Promo2=1 THEN 'yes'
        ELSE 'no'
    END) AS promo2_flag
FROM train_store_enriched_view tv;