# Rossmann Retail Sales Intelligence & Performance Management Platform

A SQL-first analytics project built on the Rossmann Store Sales dataset to analyse store performance, promotion impact, temporal behaviour, peer-group differences, and management-level KPIs.

This project is intentionally positioned as an **analytical database project**, not as a production OLTP system or a machine-learning project. The goal is to show practical SQL problem solving, business thinking, and structured database design in a way that is realistic, defensible, and useful for Data Analyst / Business Intelligence / SQL-heavy roles.

---

## 1. Project objective

The project answers a simple but important business question:

> How can raw store-level sales data be transformed into a structured analytical layer that supports KPI reporting, performance benchmarking, promotion analysis, and management dashboards?

To answer that, the project builds a small but complete SQL analytics workflow:

- source data understanding and validation
- enriched analytical views
- time-feature extraction and business flags
- store/store-type/assortment analysis
- promotion and holiday analysis
- ranking and efficiency analysis
- peer-group benchmarking with correlated subqueries
- summary tables for faster downstream analysis
- reusable functions and refresh procedures
- executive dashboard outputs
- audit logging with update/delete triggers

---

## 2. Dataset

The project uses the Rossmann Store Sales data included in the repository under `database_source/`.

### Core source tables

- `train`
- `store`

### Raw source files included

- `train.csv`
- `store.csv`
- `test.csv`
- `sample_submission.csv`
- SQL dump / zipped source exports

The main analytical work in this project is based on the `train` and `store` tables.

---

## 3. Scope of the project

This repository focuses on **descriptive and diagnostic analytics in SQL**.

It does **not** try to claim the following:

- real-time production data engineering
- machine learning forecasting
- enterprise-grade transaction orchestration
- highly normalised dimensional modelling with many dimension tables

Instead, it aims to do a smaller set of things **well and clearly**:

- build a clean analytical layer
- answer meaningful business questions
- use advanced SQL features where they add value
- keep the final solution runnable and explainable in an interview

---

## 4. Project architecture

### Source layer

- `train`
- `store`

### Analytical views

1. `train_store_enriched_view`
2. `store_total_sales_summary_view`
3. `store_total_sales_by_assortment_summary_view`

### Summary tables

1. `store_daily_summary`
2. `store_monthly_summary`
3. `promo_effectiveness_summary`

### Functions

1. `sales_band_function`
2. `promo_effectiveness_band_function`

### Procedures

1. `refresh_store_daily_summary`
2. `refresh_store_monthly_summary`
3. `executive_dashboard_summary_procedure`

### Audit layer

- `audit_table`
- update trigger on `store_monthly_summary`
- delete trigger on `store_monthly_summary`

---

## 5. Main business questions answered

The project is organised around questions such as:

- What is the overall sales and customer picture of the business?
- Which stores perform best and worst?
- How do store type and assortment affect performance?
- Are promotions meaningful revenue drivers?
- How do state holidays and school holidays affect sales?
- Are there strong weekday and monthly patterns?
- Which stores are efficient in sales-per-customer terms?
- Does competition distance appear to matter?
- Which stores are above or below their peer-group average?
- Which stores underperform relative to their structural group?

---

## 6. Implemented SQL work

### 6.1 Data audit and validation

The project starts with foundational checks rather than jumping directly into dashboards.

Implemented checks include:

- structural audit of core tables
- business meaning audit of important columns
- missing-value analysis
- business-rule consistency checks
- grain and uniqueness validation
- join-foundation validation

This matters because later KPIs and summary tables are only meaningful if the data grain is correctly understood.

---

### 6.2 Enrichment layer

A reusable enriched analytical view was built:

- `train_store_enriched_view`

This view combines sales-day information from `train` with structural store attributes from `store`, creating a reusable base for most later analysis.

Additional enrichment work includes:

- year / month / quarter / week-number extraction
- business flags for open day, promo day, holiday status, competition info, and promo2

---

### 6.3 Core business analysis

The repository includes SQL analyses for:

- overall sales analysis
- sales by store
- sales by store type
- sales by assortment
- promo effect analysis
- state holiday effect analysis
- school holiday effect analysis
- weekday performance analysis
- monthly trend analysis

These are not just technical exercises; they are the bridge between raw data and actual business interpretation.

---

### 6.4 Ranking, efficiency, and benchmarking

The project also goes beyond simple aggregation.

Implemented advanced analytical logic includes:

- store ranking with window functions
- sales-per-customer efficiency analysis
- promo effectiveness by store
- competition impact analysis via competition-distance bands
- peer comparison by store type
- peer comparison by assortment
- underperforming store detection

A notable design choice is the use of **correlated subqueries** for peer-group benchmarking. This was included intentionally to practice and demonstrate SQL logic beyond basic joins and groupings.

---

### 6.5 Summary tables

To avoid repeatedly aggregating large raw daily data, the project builds reusable summary tables:

#### `store_daily_summary`
Daily analytical base at `store + date` grain.

#### `store_monthly_summary`
Monthly analytical base at `store + year + month` grain.

#### `promo_effectiveness_summary`
Store-level summary comparing promo vs non-promo performance.

This design makes later procedures, dashboard queries, and audit logic cleaner and more practical.

---

### 6.6 Functions

Two reusable SQL functions were implemented:

#### `sales_band_function`
Classifies a sales value into:
- `low`
- `medium`
- `high`
- `top`

#### `promo_effectiveness_band_function`
Classifies promo effect into:
- `weak`
- `moderate`
- `strong`

These functions keep repeated business logic out of large dashboard queries.

---

### 6.7 Procedures

Three stored procedures were built:

#### `refresh_store_daily_summary`
Refreshes the daily summary table.

#### `refresh_store_monthly_summary`
Refreshes the monthly summary table from the daily summary layer.

#### `executive_dashboard_summary_procedure`
Returns executive-level KPI outputs including:
- overall KPIs
- best month
- worst month
- best store
- weakest store

---

### 6.8 Audit and triggers

To move the project beyond pure reporting, an audit layer was added.

#### `audit_table`
Stores change logs for selected operations.

#### Triggers
Two triggers on `store_monthly_summary` write audit entries for:
- `UPDATE`
- `DELETE`

This is intentionally lightweight, but it shows that the project also addresses basic traceability and change logging.

---

## 7. Key technical SQL concepts demonstrated

This project uses a broad range of SQL techniques, including:

- joins
- grouped aggregation
- CASE-based feature engineering
- missing-value diagnostics
- grain validation
- window functions (`RANK()`)
- scalar subqueries
- correlated subqueries
- derived tables / helper views
- summary-table design
- user-defined functions
- stored procedures
- triggers
- audit logging

This combination is one of the main strengths of the repository.

---

## 8. Selected findings

The detailed bilingual insight file is stored separately in:

- `task_35_final_business_insights/task_35_final_business_insights.md`

A few high-level findings are:

- promotions were a major sales driver
- the business showed clear monthly seasonality
- weekday performance was uneven and operationally relevant
- store performance dispersion was large across the network
- high total sales did not always imply high customer-value efficiency
- peer-group benchmarking added more decision value than raw ranking alone

This helps show that the project is not only about SQL syntax, but also about business interpretation.

---

## 9. Representative repository structure

```text
database_source/
├── rossmann_sales_mysql_full.sql
├── rossmann_sales_mysql_full.zip
├── rossmann-store-sales.zip
├── train.csv
├── store.csv
├── test.csv
└── sample_submission.csv

sql_scripts/
├── 01_structural_audit_core_tables.sql
├── 02_business_meaning_audit_core_columns.sql
├── 03_missing_value_and_data_completeness_audit_store.sql
├── 04_business_rule_consistency_audit_train.sql
├── 05_grain_uniqueness_join_foundation.sql
├── 06_build_main_project_view.sql
├── 07_extract_time_features.sql
├── 08_build_business_flags.sql
├── 09_overall_sales_analysis.sql
├── 10_sales_analysis_by_store.sql
├── 11_sales_analysis_by_store_type.sql
├── 12_sales_analysis_by_assortment.sql
├── 13_promo_effect_analysis.sql
├── 14_state_holiday_effect_analysis.sql
├── 15_school_holiday_effect_analysis.sql
├── 16_weekday_performance_analysis.sql
├── 17_monthly_sales_customer_trend_analysis.sql
├── 18_store_ranking_analysis.sql
├── 19_sales_per_customer_efficiency_analysis.sql
├── 20_promo_effectiveness_analysis_by_store.sql
├── 21_competition_impact_analysis.sql
├── 22_helper_store_total_sales_summary_view.sql
├── 22_peer_comparison_by_store_type.sql
├── 23_helper_store_total_sales_by_assortment_view.sql
├── 23_peer_comparison_by_assortment.sql
├── 24_underperforming_store_detection.sql
├── 25_build_store_daily_summary_table.sql
├── 26_build_store_monthly_summary_table.sql
├── 27_build_promo_effectiveness_summary_table.sql
├── 28_build_sales_band_function.sql
├── 29_build_promo_effectiveness_band_function.sql
├── 30_build_refresh_store_daily_summary_procedure.sql
├── 31_build_refresh_store_monthly_summary_procedure.sql
├── 32_build_executive_dashboard_summary_procedure.sql
├── 33_build_executive_dashboard_query.sql
├── 34_build_store_performance_dashboard.sql
├── 36_build_audit_table_for_change_logging.sql
└── 37_build_update_and_delete_triggers.sql

task_35_final_business_insights/
└── task_35_final_business_insights.md

tset_tables/
└── PROJECT_5_TEST(18_store_ranking_analysis).csv
```

The main implementation files are kept under `sql_scripts/`, while the bilingual interpretation file is stored separately under `task_35_final_business_insights/`.

---

## 10. How to run the project

### Recommended execution order

1. Load the Rossmann database from the source SQL / raw source files.
2. Run the numbered SQL files in order.
3. Create the enriched view and helper views.
4. Build the summary tables.
5. Create the functions.
6. Create the procedures.
7. Create the audit table and triggers.
8. Run the executive dashboard query and store performance dashboard queries.

### Practical note

For reproducibility, the project is structured so that later objects depend on earlier ones. The summary-table layer is especially important because it makes later procedures and dashboard queries lighter and easier to explain.

---

## 11. Design decisions worth explaining in an interview

### Why build summary tables instead of querying raw daily data every time?
Because repeated aggregation on raw data makes later logic heavier, harder to read, and less reusable. Summary tables also make procedures and dashboards cleaner.

### Why use helper views before correlated subqueries?
Because correlated subqueries directly on the full enriched daily view were logically correct but unnecessarily heavy. Helper views reduced complexity while keeping the benchmarking logic intact.

### Why include triggers in an analytics project?
Not to pretend this is a full production logging system, but to show awareness of change tracking and database-side automation.

### Why keep the project SQL-first?
Because the main purpose of this repository is to demonstrate analytical SQL design, structured reasoning, and business-oriented querying rather than forecasting or modelling.

---

## 12. Limitations

To keep the project realistic and defensible, it is important to state its limits clearly.

- This is not a predictive modelling project.
- Promotion-effect measurement here is descriptive, not causal inference.
- Competition impact is analysed through grouped business bands, not formal econometric modelling.
- The audit layer is deliberately lightweight.
- The project prioritises clarity and explanation over highly compressed “clever” SQL.

These limitations are not weaknesses to hide; they are part of keeping the project honest and interview-safe.

---

## 13. Future improvements

Reasonable next steps for a future version would be:

- add a second promo-effect function using average promo uplift
- build a dedicated date dimension
- add parameterised dashboard procedures
- extend audit logging to more fields than total sales
- add visual dashboards in Power BI or Tableau on top of the SQL layer
- pair the SQL layer with a Pandas validation notebook

---

## 14. Final project assessment

This project is strong because it combines:

- sound SQL fundamentals
- intermediate-to-advanced querying
- business-focused analysis
- reusable analytical objects
- modest but meaningful database automation

It does **not** claim to be more than it is.
That is intentional.

The repository is best described as a **well-structured SQL analytics portfolio project** with enough depth to be discussed seriously in interviews, while still remaining practical, readable, and defensible.
