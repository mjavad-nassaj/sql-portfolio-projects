USE rossmann_sales_mysql;
DROP TABLE IF EXISTS promo_effectiveness_summary;
CREATE TABLE promo_effectiveness_summary
(
	store INT PRIMARY KEY NOT NULL,
	promo_sales DECIMAL(11,2) NOT NULL,
	non_promo_sales DECIMAL(11,2) NOT NULL,
	promo_customers INT NOT NULL,
	non_promo_customers INT NOT NULL,
	promo_average_sales DECIMAL(11,2) NOT NULL,
	non_promo_average_sales DECIMAL(11,2) NOT NULL,
	promo_sales_difference DECIMAL(11,2) NOT NULL,
	promo_average_sales_difference DECIMAL(11,2) NOT NULL,

	CONSTRAINT fk_promo_effectiveness_summary_store
		FOREIGN KEY(store) REFERENCES rossmann_sales_mysql.store(Store)
);

INSERT INTO promo_effectiveness_summary
(
	store,
	promo_sales,
	non_promo_sales,
	promo_customers,
	non_promo_customers,
	promo_average_sales,
	non_promo_average_sales,
	promo_sales_difference,
	promo_average_sales_difference
)
SELECT
	tsv.Store,
    SUM(
		CASE
			WHEN tsv.Promo=0 THEN 0
			ELSE 
				tsv.Sales
		END
    ),
    SUM(
		CASE
			WHEN tsv.Promo=1 THEN 0
			ELSE 
				tsv.Sales
		END
    ),
    SUM(
		CASE
			WHEN tsv.Promo=0 THEN 0
			ELSE 
				tsv.Customers
		END
    ),
	SUM(
		CASE
			WHEN tsv.Promo=1 THEN 0
			ELSE 
				tsv.Customers
		END
    ),
	COALESCE (AVG(
		CASE
			WHEN tsv.Promo=1 THEN tsv.Sales
        END
    ),0),
	COALESCE(AVG(
		CASE
			WHEN tsv.Promo=0 THEN tsv.Sales
        END
    ),0),
    (SUM(
		CASE
			WHEN tsv.Promo=0 THEN 0
			ELSE 
				tsv.Sales
		END
    ) - 
    SUM(
		CASE
			WHEN tsv.Promo=1 THEN 0
			ELSE 
				tsv.Sales
		END
    )),
    ((COALESCE(AVG(
		CASE
			WHEN tsv.Promo=1 THEN tsv.Sales
        END
    ),0))
    -
	(COALESCE(AVG(
		CASE
			WHEN tsv.Promo=0 THEN tsv.Sales
        END
    ),0)))

FROM train_store_enriched_view tsv
GROUP BY
	tsv.Store;