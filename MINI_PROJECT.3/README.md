# Client 360 Revenue, Collections & Portfolio Intelligence Platform

## English Version

## Project Overview

This project is a multi-database SQL portfolio project built by integrating three sample databases:

- `sql_store`
- `sql_invoicing`
- `sql_hr`

The main purpose of the project is to combine customer sales activity, invoice and payment behaviour, and manager ownership into one integrated reporting and monitoring system.

The project includes:

- cross-database integration
- analytical views
- reusable SQL functions
- summary tables
- correlated subqueries
- rollup reporting
- audit logs
- validation triggers
- stored procedures
- a reusable management dashboard procedure

---

## Project Goals

The goals of this project are:

- to practise SQL in a structured and practical way
- to integrate data across multiple databases
- to create reusable client and manager summary systems
- to automate reporting and monitoring tasks
- to apply intermediate and advanced SQL concepts in one complete project

---

## Databases Used

- `sql_store`
- `sql_invoicing`
- `sql_hr`

---

## Core Project Idea

The system creates a **Client 360** reporting layer by combining:

- customer sales performance from `sql_store`
- invoice and payment status from `sql_invoicing`
- manager and office ownership from `sql_hr`

This is then extended into:

- `client_360_summary`
- `manager_portfolio_summary`
- `collection_alert_queue`
- `payment_audit_log`
- `risk_change_audit_log`

---

## Main Components

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

## Project Files

- `01_create_customer_client_map.sql`
- `02_create_client_manager_map.sql`
- `03_create_store_customer_sales_summary_view.sql`
- `04_create_invoice_status_summary_view.sql`
- `05_create_client_360_base_view.sql`
- `06_create_loyalty_level_function.sql`
- `07_create_payment_risk_function.sql`
- `08_create_collection_priority_function.sql`
- `09_create_client_360_summary_table.sql`
- `10_insert_client_360_summary.sql`
- `11_create_manager_portfolio_summary_table.sql`
- `12_insert_manager_portfolio_summary.sql`
- `13_clients_above_average_sales.sql`
- `14_clients_above_state_average_balance.sql`
- `15_clients_above_manager_average_overdue.sql`
- `16_clients_with_multiple_overdues.sql`
- `17_rollup_risk_by_state.sql`
- `18_rollup_office_manager_performance.sql`
- `19_create_payment_audit_log.sql`
- `20_create_risk_change_audit_log.sql`
- `21_create_payment_audit_trigger.sql`
- `22_create_overpayment_validation_trigger.sql`
- `22b_create_advanced_payment_validation_trigger.sql`
- `23_create_risk_change_trigger.sql`
- `24_create_collection_alert_queue.sql`
- `25_create_refresh_client_360_summary_procedure.sql`
- `26_create_refresh_manager_portfolio_summary_procedure.sql`
- `27_create_rebuild_alert_queue_procedure.sql`
- `28_create_management_dashboard_procedure.sql`

---

## Execution Order

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

### Phase 4 — Summary Tables
9. `09_create_client_360_summary_table.sql`
10. `10_insert_client_360_summary.sql`
11. `11_create_manager_portfolio_summary_table.sql`
12. `12_insert_manager_portfolio_summary.sql`

### Phase 5 — Analytical Reports
13. `13_clients_above_average_sales.sql`
14. `14_clients_above_state_average_balance.sql`
15. `15_clients_above_manager_average_overdue.sql`
16. `16_clients_with_multiple_overdues.sql`
17. `17_rollup_risk_by_state.sql`
18. `18_rollup_office_manager_performance.sql`

### Phase 6 — Audit Tables
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

## Procedures

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

## Project Value

This project demonstrates practical SQL skills beyond basic querying.

It includes data integration, reporting logic, reusable business rules, summary table design, triggers, procedures, validation logic, and operational queue generation in one integrated project.

---

## Possible Future Improvements

- add refresh log tracking for procedures
- add alert lifecycle timestamps
- add manager ranking reports
- add office-level dashboard extensions
- add scheduled refresh logic outside the database

---

## Final Note

This project was built as a complete SQL portfolio project intended to demonstrate practical, interview-relevant database skills in a structured and professional way.

---

## Deutsche Version

## Projektüberblick

Dieses Projekt ist ein SQL-Portfolio-Projekt auf Basis von drei Beispiel-Datenbanken:

- `sql_store`
- `sql_invoicing`
- `sql_hr`

Ziel des Projekts ist es, Kundensales, Rechnungs- und Zahlungsstatus sowie Manager-Zuordnung in einem integrierten Reporting- und Monitoring-System zusammenzuführen.

---

## Projektziele

Die Ziele dieses Projekts sind:

- SQL strukturiert und praxisnah anzuwenden
- Daten aus mehreren Datenbanken zu integrieren
- wiederverwendbare Zusammenfassungen auf Kunden- und Manager-Ebene zu erstellen
- Reporting- und Monitoring-Prozesse zu automatisieren
- fortgeschrittene SQL-Konzepte in einem vollständigen Projekt umzusetzen

---

## Verwendete Datenbanken

- `sql_store`
- `sql_invoicing`
- `sql_hr`

---

## Projektwert

Dieses Projekt zeigt praktische SQL-Fähigkeiten, die über einfache Abfragen hinausgehen.

Es umfasst Datenintegration, Reporting-Logik, wiederverwendbare Business-Regeln, Summary-Tabellen, Trigger, Procedures, Validierungslogik und eine operative Alert-Queue in einem integrierten Projekt.

---

## Mögliche Erweiterungen

- Refresh-Log für Procedures ergänzen
- Zeitstempel für den Lebenszyklus von Alerts ergänzen
- Manager-Ranking-Reports hinzufügen
- Office-basierte Dashboard-Erweiterungen hinzufügen
- geplante externe Refresh-Automatisierung ergänzen

---

## Schlussbemerkung

Dieses Projekt wurde als vollständiges SQL-Portfolio-Projekt aufgebaut, um praktische und bewerbungsrelevante Datenbankfähigkeiten strukturiert und professionell zu demonstrieren.

---

## Author

Mohammad
