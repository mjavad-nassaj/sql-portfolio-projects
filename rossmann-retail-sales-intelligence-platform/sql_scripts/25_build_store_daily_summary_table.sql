USE rossmann_sales_mysql;

DROP TABLE IF EXISTS store_daily_summary;

CREATE TABLE store_daily_summary
(
  store INT NOT NULL,
  date DATE NOT NULL,
  day_of_week TINYINT NOT NULL,
  sales DECIMAL(11,2) NOT NULL,
  customers INT NOT NULL,
  open TINYINT NOT NULL,
  promo TINYINT NOT NULL,
  state_holiday VARCHAR(10) NOT NULL,
  school_holiday TINYINT NOT NULL,
  store_type VARCHAR(10) NOT NULL,
  assortment VARCHAR(10) NOT NULL,
  competition_distance INT NULL,
  promo2 TINYINT NOT NULL,
  sales_year SMALLINT NOT NULL,
  sales_month TINYINT NOT NULL,
  sales_quarter TINYINT NOT NULL,

  CONSTRAINT pk_store_daily_summary
    PRIMARY KEY (store, date),

  CONSTRAINT fk_store_daily_summary_store
    FOREIGN KEY (store) REFERENCES rossmann_sales_mysql.store(Store)
);

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
    YEAR(tsv.Date),
    MONTH(tsv.Date), 
    QUARTER(tsv.Date)
FROM train_store_enriched_view tsv;