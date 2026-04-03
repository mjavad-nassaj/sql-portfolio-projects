# Client Payment Monitoring and Collection Reporting System

## English Version

### Project Overview
This project is an SQL reporting and monitoring project based on the `sql_invoicing` database.

The main purpose of this project is to analyse invoice status, monitor client payments, track outstanding balances, classify clients by financial risk, log payment activity automatically, and generate final management reports.

### Project Goals
The goals of this project are:

- to practise SQL in a structured and practical way
- to work with invoice, client, and payment data
- to build summary reports based on financial records
- to apply intermediate SQL concepts in one integrated project
- to automate reporting tasks with a stored procedure
- to log payment activity automatically with a trigger

### Database Used
- `sql_invoicing`

### Main Tables Used
- `clients`
- `invoices`
- `payments`
- `payment_methods`

### Objects Created in the Project
This project includes the creation and use of the following SQL objects:

- a `VIEW`
- a summary `TABLE`
- `INSERT INTO ... SELECT`
- `Subquery`
- `HAVING`
- `CASE`
- `ROLLUP`
- a logging table
- a `TRIGGER`
- a `PROCEDURE`

### Project Workflow
The project was completed in several tasks:

#### Task 1 - Create Invoice Status View
A view named `invoice_status_summary` was created to summarise the financial status of each invoice.

It includes:
- invoice ID
- client ID
- client name
- invoice date
- due date
- invoice total
- total registered payments
- debt balance
- payment count
- invoice status

The invoice status was classified with `CASE` into:
- `Paid`
- `Partially Paid`
- `Unpaid`
- `Overdue`

#### Task 2 - Create Client Collection Summary Table
A new table named `client_collection_summary` was created to store client-level financial summaries.

It includes:
- client ID
- client name
- city
- state
- total invoices
- total invoice amount
- total paid amount
- total outstanding balance
- paid invoices
- partially paid invoices
- overdue invoices
- risk level
- last refresh timestamp

#### Task 3 - Insert Client Summary Data
The summary table was filled using `INSERT INTO ... SELECT`.

For each client, the query calculates:
- number of invoices
- total invoice amount
- total paid amount
- total outstanding balance
- number of paid invoices
- number of partially paid invoices
- number of overdue invoices
- risk level

Risk levels were defined as:
- `High Risk`
- `Medium Risk`
- `Low Risk`

#### Task 4 - Subquery Report
A subquery was written to identify clients whose total outstanding balance is above the average outstanding balance of all clients.

This step was designed to practise comparison with an aggregate value from the whole dataset.

#### Task 5 - HAVING Report
A grouped report was written to find clients who:
- have at least 2 overdue invoices
- and have a total outstanding balance greater than 100

This step was designed to practise `GROUP BY` and `HAVING`.

#### Task 6 - Create Payment Audit Log Table
A separate table named `payment_audit_log` was created to store payment log records.

It includes:
- log ID
- payment ID
- invoice ID
- client ID
- payment date
- payment amount
- payment method
- log timestamp

#### Task 7 - Create Trigger
A trigger named `trg_after_insert_payment` was created on the `payments` table.

This trigger automatically inserts a log record into `payment_audit_log` every time a new payment is inserted.

This means payment activity is tracked automatically without manual logging.

#### Task 8 - Final Report with ROLLUP
A final management report was created using `GROUP BY ... WITH ROLLUP`.

The report shows:
- state
- risk level
- number of clients
- total outstanding balance
- total invoice amount

It also includes:
- subtotal per state
- grand total for all states

#### Task 9 - Stored Procedure
A stored procedure named `generate_collection_report` was created to automate the main workflow.

The procedure performs the following actions:
1. clears previous summary data
2. rebuilds the client summary table
3. shows clients above average outstanding balance
4. shows clients with multiple overdue invoices
5. shows the final rollup report

### SQL Concepts Practised
This project helped practise the following SQL concepts:

- `SELECT`
- `JOIN`
- `LEFT JOIN`
- `GROUP BY`
- `COUNT()`
- `SUM()`
- `AVG()`
- `HAVING`
- `CASE`
- `INSERT INTO ... SELECT`
- `Subquery`
- `VIEW`
- `ROLLUP`
- `TRIGGER`
- `PROCEDURE`

### Suggested File Structure
Recommended files for this repository:

- `01_create_invoice_status_view.sql`
- `02_create_client_collection_summary_table.sql`
- `03_insert_client_collection_summary.sql`
- `04_clients_above_average_outstanding.sql`
- `05_clients_with_multiple_overdues.sql`
- `06_create_payment_audit_log_table.sql`
- `07_create_payment_audit_trigger.sql`
- `08_rollup_collection_report.sql`
- `09_generate_collection_report_procedure.sql`
- `README.md`

### Project Value
This is a beginner-to-intermediate SQL portfolio project.

Although it is not a full production system, it demonstrates:
- understanding of relational database structures
- financial reporting logic
- practical use of aggregation and classification
- trigger-based logging
- automated reporting with a stored procedure

This project is suitable for learning, GitHub portfolio presentation, and student job applications.

---

## Deutsche Version

### Projektübersicht
Dieses Projekt ist ein SQL-Reporting- und Monitoring-Projekt auf Grundlage der Datenbank `sql_invoicing`.

Das Hauptziel dieses Projekts besteht darin, den Status von Rechnungen zu analysieren, Kundenzahlungen zu überwachen, offene Salden zu verfolgen, Kunden nach finanziellem Risiko zu klassifizieren, Zahlungsaktivitäten automatisch zu protokollieren und abschließende Managementberichte zu erzeugen.

### Projektziele
Die Ziele dieses Projekts sind:

- SQL auf strukturierte und praxisnahe Weise zu üben
- mit Rechnungs-, Kunden- und Zahlungsdaten zu arbeiten
- Zusammenfassungsberichte auf Basis finanzieller Daten zu erstellen
- SQL-Konzepte des mittleren Niveaus in einem integrierten Projekt anzuwenden
- Reporting-Aufgaben mit einer Stored Procedure zu automatisieren
- Zahlungsaktivitäten mit einem Trigger automatisch zu protokollieren

### Verwendete Datenbank
- `sql_invoicing`

### Verwendete Haupttabellen
- `clients`
- `invoices`
- `payments`
- `payment_methods`

### Im Projekt erstellte Objekte
Dieses Projekt umfasst die Erstellung und Nutzung der folgenden SQL-Objekte:

- einer `VIEW`
- einer Zusammenfassungs-`TABELLE`
- `INSERT INTO ... SELECT`
- `Subquery`
- `HAVING`
- `CASE`
- `ROLLUP`
- einer Log-Tabelle
- eines `TRIGGER`
- einer `PROCEDURE`

### Projektablauf
Das Projekt wurde in mehreren Aufgaben durchgeführt:

#### Aufgabe 1 - Erstellen einer Invoice-Status-View
Eine View mit dem Namen `invoice_status_summary` wurde erstellt, um den finanziellen Status jeder Rechnung zusammenzufassen.

Sie enthält:
- Rechnungs-ID
- Kunden-ID
- Kundenname
- Rechnungsdatum
- Fälligkeitsdatum
- Rechnungsbetrag
- gesamte erfasste Zahlungen
- offenen Saldo
- Anzahl der Zahlungen
- Rechnungsstatus

Der Rechnungsstatus wurde mit `CASE` in folgende Gruppen eingeteilt:
- `Paid`
- `Partially Paid`
- `Unpaid`
- `Overdue`

#### Aufgabe 2 - Erstellen der Kundenzusammenfassungstabelle
Eine neue Tabelle mit dem Namen `client_collection_summary` wurde erstellt, um kundenbezogene finanzielle Zusammenfassungen zu speichern.

Sie enthält:
- Kunden-ID
- Kundenname
- Stadt
- Bundesstaat
- Gesamtzahl der Rechnungen
- Gesamtsumme der Rechnungsbeträge
- Gesamtsumme der Zahlungen
- gesamter offener Saldo
- bezahlte Rechnungen
- teilweise bezahlte Rechnungen
- überfällige Rechnungen
- Risikostufe
- Zeitstempel der letzten Aktualisierung

#### Aufgabe 3 - Einfügen der Kundenzusammenfassungsdaten
Die Zusammenfassungstabelle wurde mit `INSERT INTO ... SELECT` befüllt.

Für jeden Kunden berechnet die Abfrage:
- Anzahl der Rechnungen
- Gesamtsumme der Rechnungsbeträge
- Gesamtsumme der Zahlungen
- gesamten offenen Saldo
- Anzahl der bezahlten Rechnungen
- Anzahl der teilweise bezahlten Rechnungen
- Anzahl der überfälligen Rechnungen
- Risikostufe

Die Risikostufen wurden wie folgt definiert:
- `High Risk`
- `Medium Risk`
- `Low Risk`

#### Aufgabe 4 - Subquery-Bericht
Eine Subquery wurde geschrieben, um Kunden zu identifizieren, deren gesamter offener Saldo über dem durchschnittlichen offenen Saldo aller Kunden liegt.

Dieser Schritt diente dazu, Vergleiche mit einem aggregierten Wert aus dem gesamten Datensatz zu üben.

#### Aufgabe 5 - HAVING-Bericht
Ein gruppierter Bericht wurde erstellt, um Kunden zu finden, die:
- mindestens 2 überfällige Rechnungen haben
- und einen gesamten offenen Saldo von mehr als 100 aufweisen

Dieser Schritt diente dazu, `GROUP BY` und `HAVING` zu üben.

#### Aufgabe 6 - Erstellen der Payment-Audit-Log-Tabelle
Eine separate Tabelle mit dem Namen `payment_audit_log` wurde erstellt, um Log-Einträge für Zahlungen zu speichern.

Sie enthält:
- Log-ID
- Zahlungs-ID
- Rechnungs-ID
- Kunden-ID
- Zahlungsdatum
- Zahlungsbetrag
- Zahlungsmethode
- Zeitstempel des Logs

#### Aufgabe 7 - Erstellen des Triggers
Ein Trigger mit dem Namen `trg_after_insert_payment` wurde auf der Tabelle `payments` erstellt.

Dieser Trigger fügt automatisch einen Log-Eintrag in `payment_audit_log` ein, jedes Mal wenn eine neue Zahlung eingefügt wird.

Dadurch werden Zahlungsaktivitäten automatisch protokolliert, ohne dass ein manueller Eintrag nötig ist.

#### Aufgabe 8 - Abschlussbericht mit ROLLUP
Ein abschließender Managementbericht wurde mit `GROUP BY ... WITH ROLLUP` erstellt.

Der Bericht zeigt:
- Bundesstaat
- Risikostufe
- Anzahl der Kunden
- gesamten offenen Saldo
- gesamte Rechnungsbeträge

Zusätzlich enthält er:
- Zwischensummen pro Bundesstaat
- die Gesamtsumme aller Bundesstaaten

#### Aufgabe 9 - Stored Procedure
Eine Stored Procedure mit dem Namen `generate_collection_report` wurde erstellt, um den Hauptablauf zu automatisieren.

Die Procedure führt die folgenden Aktionen aus:
1. sie löscht die bisherigen Zusammenfassungsdaten
2. sie erstellt die Kundenzusammenfassung neu
3. sie zeigt Kunden mit überdurchschnittlichem offenem Saldo
4. sie zeigt Kunden mit mehreren überfälligen Rechnungen
5. sie zeigt den abschließenden Rollup-Bericht

### Geübte SQL-Konzepte
Dieses Projekt hat dabei geholfen, die folgenden SQL-Konzepte zu trainieren:

- `SELECT`
- `JOIN`
- `LEFT JOIN`
- `GROUP BY`
- `COUNT()`
- `SUM()`
- `AVG()`
- `HAVING`
- `CASE`
- `INSERT INTO ... SELECT`
- `Subquery`
- `VIEW`
- `ROLLUP`
- `TRIGGER`
- `PROCEDURE`

### Empfohlene Dateistruktur
Empfohlene Dateien für dieses Repository:

- `01_create_invoice_status_view.sql`
- `02_create_client_collection_summary_table.sql`
- `03_insert_client_collection_summary.sql`
- `04_clients_above_average_outstanding.sql`
- `05_clients_with_multiple_overdues.sql`
- `06_create_payment_audit_log_table.sql`
- `07_create_payment_audit_trigger.sql`
- `08_rollup_collection_report.sql`
- `09_generate_collection_report_procedure.sql`
- `README.md`

### Projektwert
Dies ist ein SQL-Portfolio-Projekt auf Anfänger- bis Mittelstufenniveau.

Obwohl es sich nicht um ein vollständiges Produktivsystem handelt, zeigt es:
- Verständnis relationaler Datenbankstrukturen
- Logik finanzieller Berichterstellung
- praktische Anwendung von Aggregation und Klassifizierung
- Logging mit Triggern
- automatisierte Berichterstellung mit einer Stored Procedure

Dieses Projekt eignet sich gut zum Lernen, für die Präsentation im GitHub-Portfolio und für Bewerbungen auf studentische Tätigkeiten.

## Author
Mohammad
