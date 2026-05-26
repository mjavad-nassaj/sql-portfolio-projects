USE rossmann_sales_mysql;

SELECT 
    GROUP_CONCAT(
        CONCAT(
            'SUM(CASE WHEN `', column_name, '` IS NULL THEN 1 ELSE 0 END) AS `missing_', column_name, '`'
        )
        SEPARATOR ', '
    ) AS sql_query
FROM information_schema.columns
WHERE table_schema = 'rossmann_sales_mysql'
  AND table_name = 'train';

SELECT
	SUM(CASE WHEN `Customers` IS NULL THEN 1 ELSE 0 END) AS `missing_Customers`, SUM(CASE WHEN `Date` IS NULL THEN 1 ELSE 0 END) AS `missing_Date`, SUM(CASE WHEN `DayOfWeek` IS NULL THEN 1 ELSE 0 END) AS `missing_DayOfWeek`, SUM(CASE WHEN `Open` IS NULL THEN 1 ELSE 0 END) AS `missing_Open`, SUM(CASE WHEN `Promo` IS NULL THEN 1 ELSE 0 END) AS `missing_Promo`, SUM(CASE WHEN `Sales` IS NULL THEN 1 ELSE 0 END) AS `missing_Sales`, SUM(CASE WHEN `SchoolHoliday` IS NULL THEN 1 ELSE 0 END) AS `missing_SchoolHoliday`, SUM(CASE WHEN `StateHoliday` IS NULL THEN 1 ELSE 0 END) AS `missing_StateHoliday`, SUM(CASE WHEN `Store` IS NULL THEN 1 ELSE 0 END) AS `missing_Store`

FROM train;



SELECT 
    GROUP_CONCAT(
        CONCAT(
            'SUM(CASE WHEN `', column_name, '` IS NULL THEN 1 ELSE 0 END) AS `missing_', column_name, '`'
        )
        SEPARATOR ', '
    ) AS sql_query
FROM information_schema.columns
WHERE table_schema = 'rossmann_sales_mysql'
  AND table_name = 'store';
  
SELECT
	SUM(CASE WHEN `Assortment` IS NULL THEN 1 ELSE 0 END) AS `missing_Assortment`, SUM(CASE WHEN `CompetitionDistance` IS NULL THEN 1 ELSE 0 END) AS `missing_CompetitionDistance`, SUM(CASE WHEN `CompetitionOpenSinceMonth` IS NULL THEN 1 ELSE 0 END) AS `missing_CompetitionOpenSinceMonth`, SUM(CASE WHEN `CompetitionOpenSinceYear` IS NULL THEN 1 ELSE 0 END) AS `missing_CompetitionOpenSinceYear`, SUM(CASE WHEN `Promo2` IS NULL THEN 1 ELSE 0 END) AS `missing_Promo2`, SUM(CASE WHEN `Promo2SinceWeek` IS NULL THEN 1 ELSE 0 END) AS `missing_Promo2SinceWeek`, SUM(CASE WHEN `Promo2SinceYear` IS NULL THEN 1 ELSE 0 END) AS `missing_Promo2SinceYear`, SUM(CASE WHEN `PromoInterval` IS NULL THEN 1 ELSE 0 END) AS `missing_PromoInterval`, SUM(CASE WHEN `Store` IS NULL THEN 1 ELSE 0 END) AS `missing_Store`, SUM(CASE WHEN `StoreType` IS NULL THEN 1 ELSE 0 END) AS `missing_StoreType`
FROM store;



-- Task 3: Prüfung fehlender Werte in store

-- Einige Spalten sind vollständig.
-- CompetitionDistance hat nur wenige fehlende Werte.
-- CompetitionOpenSinceMonth und CompetitionOpenSinceYear haben mehrere fehlende Werte.
-- Promo2SinceWeek, Promo2SinceYear und PromoInterval haben viele fehlende Werte.
-- Diese fehlenden Werte sind wahrscheinlich mit Promo2 = 0 verbunden.



SELECT
    Promo2,
    COUNT(*) AS row_count,
    SUM(CASE 
			WHEN Promo2SinceWeek IS NULL THEN 1 
			ELSE 0 
		END) AS missing_Promo2SinceWeek,
    SUM(CASE 
			WHEN Promo2SinceYear IS NULL THEN 1 
            ELSE 0 
		END) AS missing_Promo2SinceYear,
    SUM(CASE 
			WHEN PromoInterval IS NULL THEN 1 
            ELSE 0
		END) AS missing_PromoInterval
FROM store
GROUP BY Promo2;



SELECT
    COUNT(*) AS total_rows,
    SUM(CASE 
			WHEN CompetitionOpenSinceMonth IS NULL THEN 1 
            ELSE 0 
		END) AS missing_month,
    SUM(CASE 
			WHEN CompetitionOpenSinceYear IS NULL THEN 1 
            ELSE 0 
		END) AS missing_year,
    SUM(CASE 
			WHEN CompetitionOpenSinceMonth IS NULL AND CompetitionOpenSinceYear IS NULL THEN 1 
            ELSE 0 
		END) AS missing_both,
    SUM(CASE 
			WHEN CompetitionOpenSinceMonth IS NULL AND CompetitionOpenSinceYear IS NOT NULL THEN 1 
            ELSE 0 
		END) AS missing_month_only,
    SUM(CASE 
			WHEN CompetitionOpenSinceMonth IS NOT NULL AND CompetitionOpenSinceYear IS NULL THEN 1 
            ELSE 0 
		END) AS missing_year_only
FROM store;