USE rossmann_sales_mysql;
DROP TABLE IF EXISTS store_monthly_summary;
CREATE TABLE store_monthly_summary
(
	store INT NOT NULL,
    store_type VARCHAR(10) NOT NULL,
	assortment VARCHAR(10) NOT NULL,
	sales_year SMALLINT NOT NULL,
	sales_month TINYINT NOT NULL,
	total_sales DECIMAL(11,2) NOT NULL,
	total_customers INT NOT NULL,
	average_sales DECIMAL(11,2) NOT NULL,
	average_customers DECIMAL(11,2) NOT NULL,
	open_days TINYINT NOT NULL,
	promo_days TINYINT NOT NULL,

	CONSTRAINT PK_store_monthly_summary
		PRIMARY KEY (store,sales_year,sales_month),
        
	CONSTRAINT FK_store_monthly_summary_store
		FOREIGN KEY (store) REFERENCES rossmann_sales_mysql.store(Store)
);

INSERT INTO store_monthly_summary
(
	store,
    store_type,
	assortment,
	sales_year,
	sales_month,
	total_sales,
	total_customers,
	average_sales,
	average_customers,
	open_days,
	promo_days
)
SELECT
	sds.store,
    sds.store_type,
    sds.assortment,
    sds.sales_year,
    sds.sales_month,
    SUM(sds.sales),
    SUM(sds.customers),
    AVG(sds.sales),
    AVG(sds.customers),
    SUM(sds.open),
    SUM(sds.promo)
FROM store_daily_summary sds
GROUP BY
	sds.store,
    sds.store_type,
    sds.assortment,
    sds.sales_year,
    sds.sales_month;