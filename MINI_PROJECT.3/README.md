# Client 360 Revenue, Collections & Portfolio Intelligence Platform

## Overview

This project is a multi-database SQL analytics and operations platform built on top of three sample databases:

- `sql_store`
- `sql_invoicing`
- `sql_hr`

The goal of the project is to integrate customer sales activity, invoice and payment behaviour, and manager ownership into a single reusable reporting and monitoring system.

The project goes beyond basic querying by combining:

- cross-database integration
- analytical views
- reusable SQL functions
- summary tables
- correlated subqueries
- rollup reporting
- audit logging
- validation triggers
- operational procedures
- a management dashboard procedure

---

## Business Goal

The system answers questions such as:

- Which customers generate the most sales?
- Which clients have the highest outstanding balances?
- Which clients are riskier than others in their state or manager portfolio?
- Which managers own more problematic portfolios?
- Which cases should enter a collections alert queue?
- How can payment activity and risk changes be audited automatically?

---

## Databases Used

### 1. `sql_store`
Used for:
- customers
- orders
- order items
- sales-side summaries
- client-level integrated reporting

### 2. `sql_invoicing`
Used for:
- clients
- invoices
- payments
- payment methods
- invoice and collections logic

### 3. `sql_hr`
Used for:
- employees
- offices
- manager-level portfolio ownership and performance reporting

---

## Core Project Idea

The platform creates a **Client 360 view** by integrating:

- customer sales performance from `sql_store`
- invoice and payment status from `sql_invoicing`
- account ownership and office structure from `sql_hr`

This is then extended into:

- client summary tables
- manager portfolio summary tables
- collections alert queues
- automatic payment logging
- automatic risk change logging
- dashboard procedures

---

## Project Architecture

### Integration Layer
- `customer_client_map`
- `client_manager_map`

### View Layer
- `store_customer_sales_summary`
- `invoice_status_summary`
- `client_360_base_view`

### Function Layer
- `fn_loyalty_level`
- `fn_payment_risk`
- `fn_collection_priority`

### Summary Layer
- `client_360_summary`
- `manager_portfolio_summary`

### Audit Layer
- `payment_audit_log`
- `risk_change_audit_log`

### Queue Layer
- `collection_alert_queue`

### Automation Layer
- payment audit trigger
- payment validation trigger
- advanced payment validation trigger
- risk change trigger
- refresh procedures
- management dashboard procedure

---

## Main Business Rules

### Loyalty segmentation
Clients are classified into:
- Bronze
- Silver
- Gold
- Platinum

based on total sales.

### Payment risk classification
Clients are classified into:
- Low Risk
- Medium Risk
- High Risk
- Critical

based on:
- outstanding balance
- overdue invoice count
- payment ratio

### Collection priority classification
Clients are classified into:
- Low
- Normal
- High
- Urgent

based on:
- payment risk
- outstanding balance
- overdue volume

---

## Portfolio Ownership Assumption

The sample datasets do not contain a real ownership relationship between clients and employees.  
To make manager-level reporting possible, a simple **region-based portfolio ownership rule** was defined for this project.

Clients were assigned to managers according to state groupings so that manager and office performance analysis could be implemented in a consistent and explainable way.

---

## Key Features

### 1. Cross-database integration
The project connects data across three different databases and resolves missing native relationships through mapping tables.

### 2. Customer and client summarisation
Raw transactional data is transformed into reusable business summaries.

### 3. Reusable business logic
Key rules are wrapped into SQL functions so they can be reused across queries, summary tables, and procedures.

### 4. Analytical reporting
The project includes:
- subqueries
- correlated subqueries
- rollup reports
- manager and state comparisons

### 5. Auditability
The system automatically logs:
- new payments
- risk changes

### 6. Data validation
Business rules are enforced at database level using triggers, including overpayment prevention and advanced payment validation.

### 7. Operational workflow support
A collections queue is generated automatically for higher-priority cases.

---

## File Structure

```text
01_create_customer_client_map.sql
02_create_client_manager_map.sql
03_create_store_customer_sales_summary_view.sql
04_create_invoice_status_summary_view.sql
05_create_client_360_base_view.sql
06_create_loyalty_level_function.sql
07_create_payment_risk_function.sql
08_create_collection_priority_function.sql
09_create_client_360_summary_table.sql
10_insert_client_360_summary.sql
11_create_manager_portfolio_summary_table.sql
12_insert_manager_portfolio_summary.sql
13_clients_above_average_sales.sql
14_clients_above_state_average_balance.sql
15_clients_above_manager_average_overdue.sql
16_clients_with_multiple_overdues.sql
17_rollup_risk_by_state.sql
18_rollup_office_manager_performance.sql
19_create_payment_audit_log.sql
20_create_risk_change_audit_log.sql
21_create_payment_audit_trigger.sql
22_create_overpayment_validation_trigger.sql
22b_create_advanced_payment_validation_trigger.sql
23_create_risk_change_trigger.sql
24_create_collection_alert_queue.sql
25_create_refresh_client_360_summary_procedure.sql
26_create_refresh_manager_portfolio_summary_procedure.sql
27_create_rebuild_alert_queue_procedure.sql
28_create_management_dashboard_procedure.sql
README.md
```

---

## Execution Order

Run the files in the following order:

### Phase 1 — Integration
1. `01_create_customer_client_map.sql`
2. `02_create_client_manager_map.sql`

### Phase 2 — Views
3. `03_create_store_customer_sales_summary_view.sql`
4. `04_create_invoice_status_summary_view.sql`
5. `05_create_client_360_base_view.sql`

### Phase 3 — Functions
6. `06_create_loyalty_level_function.sql`
7. `07_create_payment_risk_function.sql`
8. `08_create_collection_priority_function.sql`

### Phase 4 — Summary tables
9. `09_create_client_360_summary_table.sql`
10. `10_insert_client_360_summary.sql`
11. `11_create_manager_portfolio_summary_table.sql`
12. `12_insert_manager_portfolio_summary.sql`

### Phase 5 — Analytical reports
13. `13_clients_above_average_sales.sql`
14. `14_clients_above_state_average_balance.sql`
15. `15_clients_above_manager_average_overdue.sql`
16. `16_clients_with_multiple_overdues.sql`
17. `17_rollup_risk_by_state.sql`
18. `18_rollup_office_manager_performance.sql`

### Phase 6 — Audit tables
19. `19_create_payment_audit_log.sql`
20. `20_create_risk_change_audit_log.sql`

### Phase 7 — Triggers
21. `21_create_payment_audit_trigger.sql`
22. `22_create_overpayment_validation_trigger.sql`
23. `22b_create_advanced_payment_validation_trigger.sql`
24. `23_create_risk_change_trigger.sql`

### Phase 8 — Queue
25. `24_create_collection_alert_queue.sql`

### Phase 9 — Procedures
26. `25_create_refresh_client_360_summary_procedure.sql`
27. `26_create_refresh_manager_portfolio_summary_procedure.sql`
28. `27_create_rebuild_alert_queue_procedure.sql`
29. `28_create_management_dashboard_procedure.sql`

---

## Important Objects

### Views
- `store_customer_sales_summary`  
  Customer-level sales summary from `sql_store`

- `invoice_status_summary`  
  Invoice-level payment and balance status from `sql_invoicing`

- `client_360_base_view`  
  Cross-database integrated base view combining sales, invoicing, and HR ownership

### Functions
- `fn_loyalty_level(total_sales)`  
  Returns loyalty category based on total sales

- `fn_payment_risk(outstanding_balance, overdue_invoices, payment_ratio)`  
  Returns risk level based on collections profile

- `fn_collection_priority(payment_risk, outstanding_balance, overdue_invoices)`  
  Returns queue priority for operational follow-up

### Triggers
- `trg_after_insert_payment`  
  Automatically writes payment audit records

- `trg_before_insert_payment_validation`  
  Prevents overpayments

- `trg_before_insert_payment_advanced_validation`  
  Validates amount, client consistency, payment date, and remaining invoice balance

- `trg_after_update_payment_risk`  
  Writes audit records when a client's payment risk changes

### Procedures
- `sp_refresh_client_360_summary()`
- `sp_refresh_manager_portfolio_summary()`
- `sp_rebuild_collection_alert_queue()`
- `sp_generate_management_dashboard()`

---

## How to Run the Main Procedures

### Refresh client-level summary
```sql
CALL sql_store.sp_refresh_client_360_summary();
```

### Refresh manager-level summary
```sql
CALL sql_hr.sp_refresh_manager_portfolio_summary();
```

### Rebuild the collection queue
```sql
CALL sql_store.sp_rebuild_collection_alert_queue();
```

### Run the management dashboard
```sql
CALL sql_store.sp_generate_management_dashboard();
```

---

## Suggested Validation Queries

### View client summary
```sql
SELECT *
FROM sql_store.client_360_summary;
```

### View manager portfolio summary
```sql
SELECT *
FROM sql_hr.manager_portfolio_summary;
```

### View collection queue
```sql
SELECT *
FROM sql_store.collection_alert_queue;
```

### View payment audit log
```sql
SELECT *
FROM sql_store.payment_audit_log
ORDER BY log_id DESC;
```

### View risk change audit log
```sql
SELECT *
FROM sql_store.risk_change_audit_log
ORDER BY log_id DESC;
```

---

## Trigger Testing Suggestions

### Payment audit trigger test
Insert a valid payment into `sql_invoicing.payments`, then check:

```sql
SELECT *
FROM sql_store.payment_audit_log
ORDER BY log_id DESC;
```

### Overpayment validation test
Attempt to insert a payment larger than the remaining invoice balance.  
Expected result: the insert is rejected with an error.

### Advanced payment validation test
Try invalid inserts such as:
- non-positive payment amount
- payment client not matching invoice client
- payment date earlier than invoice date
- payment amount greater than remaining balance

### Risk change trigger test
Update a client’s `payment_risk` in `sql_store.client_360_summary`, then check:

```sql
SELECT *
FROM sql_store.risk_change_audit_log
ORDER BY log_id DESC;
```

---

## Skills Demonstrated

This project demonstrates:

- advanced SQL querying
- joins across multiple databases
- view design
- summary table design
- reusable SQL function design
- subqueries
- correlated subqueries
- rollup reporting
- trigger design
- audit logging
- procedural SQL
- data validation at database level
- workflow-oriented queue generation

---

## Why This Project Is Strong for a Full-Time Application

This project shows more than basic SQL usage.  
It demonstrates the ability to:

- integrate multiple datasets
- transform raw transactions into business summaries
- formalise business rules in reusable logic
- automate refresh processes
- enforce data integrity with triggers
- produce operational outputs, not only analytical outputs

In other words, it shows both **analytical thinking** and **database engineering discipline**.

---

## Possible Future Improvements

Potential future extensions include:

- adding a refresh log table for procedures
- adding alert lifecycle timestamps
- adding separate critical queue routing
- adding manager performance ranking views
- adding office-level dashboard procedures
- adding scheduled refresh logic outside the database

---

## Final Note

This project was built as a complete SQL portfolio project intended to demonstrate practical, interview-relevant database skills in a structured and professional way.
