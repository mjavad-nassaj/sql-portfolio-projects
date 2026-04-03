# Customer Sales Summary & Loyalty Management System

## English Version

### Project Overview
This project is a SQL practice and reporting project based on the `sql_store` database.

The main purpose of the project is to analyse customer purchasing behaviour, create customer sales summaries, classify customers into loyalty levels, update customer points, and generate final analytical reports using advanced SQL features.

### Project Goals
The goals of this project are:

- to practise SQL in a structured and practical way
- to work with relational tables and their relationships
- to build summary reports based on customer orders
- to apply intermediate and advanced SQL concepts in one integrated mini project

### Database Used
- `sql_store`

### Main Tables Used
- `customers`
- `orders`
- `order_items`

### Objects Created in the Project
This project includes the creation and use of the following SQL objects:

- a `VIEW`
- a summary `TABLE`
- `INSERT INTO ... SELECT`
- `Subquery`
- `Correlated Subquery`
- `UPDATE`
- `ROLLUP`
- `PROCEDURE`

### Project Workflow
The project was completed in multiple steps:

#### Step 1 - Create a View
A view named `order_financial_summary` was created to summarise each order.

It includes:
- order ID
- customer ID
- order date
- total number of items
- total order amount

#### Step 2 - Create a Summary Table
A new table named `customer_sales_summary` was created to store customer-level sales summaries.

It includes:
- customer ID
- full name
- city
- total orders
- first order date
- last order date
- total spent
- average order value
- customer level
- last update timestamp

#### Step 3 - Insert Summary Data
The summary table was filled using `INSERT INTO ... SELECT`.

For each customer, the query calculates:
- number of orders
- first and last order dates
- total amount spent
- average order value
- customer level classification

Customer levels were defined as:
- `Gold`
- `Silver`
- `Bronze`

#### Step 4 - Correlated Subquery
A correlated subquery was written to identify customers whose total spending is above the average spending of customers in the same city.

This step was designed to practise row-by-row comparison using correlated subqueries.

#### Step 5 - Update Customer Points
The `points` column in the `customers` table was updated based on the loyalty level stored in `customer_sales_summary`.

The rules used were:
- `Gold` -> +500 points
- `Silver` -> +200 points
- `Bronze` -> no change

#### Step 6 - Final Report with ROLLUP
A final analytical report was created using `GROUP BY ... WITH ROLLUP`.

The report shows:
- city
- customer level
- number of customers
- total spending

It also includes:
- subtotal per city
- grand total for all cities

#### Step 7 - Stored Procedure
A stored procedure named `generate_customer_sales_summary` was created to automate the main workflow.

The procedure performs the following actions:
1. clears previous summary data
2. rebuilds the customer summary table
3. updates customer points
4. shows the correlated subquery report
5. shows the final rollup report

### SQL Concepts Practised
This project helped practise the following SQL concepts:

- `SELECT`
- `JOIN`
- `GROUP BY`
- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `CASE`
- `INSERT INTO ... SELECT`
- `UPDATE`
- `Subquery`
- `Correlated Subquery`
- `VIEW`
- `ROLLUP`
- `PROCEDURE`

### Suggested File Structure
Recommended files for this repository:

- `01_create_order_financial_summary_view.sql`
- `02_create_customer_sales_summary_table.sql`
- `03_insert_customer_sales_summary.sql`
- `04_customers_above_city_average.sql`
- `05_update_customer_points.sql`
- `06_rollup_customer_sales_report.sql`
- `07_generate_customer_sales_summary_procedure.sql`
- `README.md`

### Project Value
This is a beginner-to-intermediate SQL portfolio project.

Although it is not a full production system, it demonstrates:
- understanding of relational databases
- reporting logic with multiple tables
- practical use of aggregation
- classification using SQL conditions
- automation of repeated reporting steps

This project is useful for learning, GitHub portfolio presentation, and academic demonstration.

---

## Deutsche Version

### Projektübersicht
Dieses Projekt ist ein SQL-Übungs- und Reporting-Projekt auf Grundlage der Datenbank `sql_store`.

Das Hauptziel des Projekts besteht darin, das Kaufverhalten von Kunden zu analysieren, Zusammenfassungen der Kundeneinkäufe zu erstellen, Kunden in Loyalitätsstufen einzuordnen, Kundenpunkte zu aktualisieren und abschließende analytische Berichte mit fortgeschrittenen SQL-Funktionen zu erzeugen.

### Projektziele
Die Ziele dieses Projekts sind:

- SQL auf strukturierte und praxisnahe Weise zu üben
- mit relationalen Tabellen und ihren Beziehungen zu arbeiten
- Zusammenfassungsberichte auf Basis von Kundenbestellungen zu erstellen
- SQL-Konzepte des mittleren und fortgeschrittenen Niveaus in einem integrierten Miniprojekt anzuwenden

### Verwendete Datenbank
- `sql_store`

### Verwendete Haupttabellen
- `customers`
- `orders`
- `order_items`

### Im Projekt erstellte Objekte
Dieses Projekt umfasst die Erstellung und Nutzung der folgenden SQL-Objekte:

- einer `VIEW`
- einer Zusammenfassungs-`TABELLE`
- `INSERT INTO ... SELECT`
- `Subquery`
- `Correlated Subquery`
- `UPDATE`
- `ROLLUP`
- `PROCEDURE`

### Projektablauf
Das Projekt wurde in mehreren Schritten durchgeführt:

#### Schritt 1 - Erstellen einer View
Eine View mit dem Namen `order_financial_summary` wurde erstellt, um jede Bestellung zusammenzufassen.

Sie enthält:
- Bestell-ID
- Kunden-ID
- Bestelldatum
- Gesamtanzahl der Artikel
- Gesamtwert der Bestellung

#### Schritt 2 - Erstellen einer Zusammenfassungstabelle
Eine neue Tabelle mit dem Namen `customer_sales_summary` wurde erstellt, um kundenbezogene Verkaufszusammenfassungen zu speichern.

Sie enthält:
- Kunden-ID
- vollständigen Namen
- Stadt
- Gesamtzahl der Bestellungen
- Datum der ersten Bestellung
- Datum der letzten Bestellung
- gesamten Einkaufswert
- durchschnittlichen Bestellwert
- Kundenstufe
- Zeitstempel der letzten Aktualisierung

#### Schritt 3 - Einfügen der Zusammenfassungsdaten
Die Zusammenfassungstabelle wurde mit `INSERT INTO ... SELECT` befüllt.

Für jeden Kunden berechnet die Abfrage:
- Anzahl der Bestellungen
- Datum der ersten und letzten Bestellung
- gesamten Einkaufswert
- durchschnittlichen Bestellwert
- Einordnung in eine Kundenstufe

Die Kundenstufen wurden wie folgt definiert:
- `Gold`
- `Silver`
- `Bronze`

#### Schritt 4 - Correlated Subquery
Es wurde eine Correlated Subquery geschrieben, um Kunden zu identifizieren, deren Gesamtausgaben über dem durchschnittlichen Einkaufswert der Kunden derselben Stadt liegen.

Dieser Schritt diente dazu, den zeilenweisen Vergleich mit korrelierten Unterabfragen zu üben.

#### Schritt 5 - Aktualisierung der Kundenpunkte
Die Spalte `points` in der Tabelle `customers` wurde auf Grundlage der in `customer_sales_summary` gespeicherten Kundenstufe aktualisiert.

Die verwendeten Regeln waren:
- `Gold` -> +500 Punkte
- `Silver` -> +200 Punkte
- `Bronze` -> keine Änderung

#### Schritt 6 - Abschlussbericht mit ROLLUP
Ein abschließender Analysebericht wurde mit `GROUP BY ... WITH ROLLUP` erstellt.

Der Bericht zeigt:
- Stadt
- Kundenstufe
- Anzahl der Kunden
- gesamten Einkaufswert

Zusätzlich enthält er:
- Zwischensummen pro Stadt
- die Gesamtsumme aller Städte

#### Schritt 7 - Stored Procedure
Eine Stored Procedure mit dem Namen `generate_customer_sales_summary` wurde erstellt, um den Hauptablauf zu automatisieren.

Die Procedure führt die folgenden Aktionen aus:
1. sie löscht die bisherigen Zusammenfassungsdaten
2. sie erstellt die Kundenzusammenfassung neu
3. sie aktualisiert die Kundenpunkte
4. sie zeigt den Bericht der Correlated Subquery
5. sie zeigt den abschließenden Rollup-Bericht

### Geübte SQL-Konzepte
Dieses Projekt hat dabei geholfen, die folgenden SQL-Konzepte zu trainieren:

- `SELECT`
- `JOIN`
- `GROUP BY`
- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `CASE`
- `INSERT INTO ... SELECT`
- `UPDATE`
- `Subquery`
- `Correlated Subquery`
- `VIEW`
- `ROLLUP`
- `PROCEDURE`

### Empfohlene Dateistruktur
Empfohlene Dateien für dieses Repository:

- `01_create_order_financial_summary_view.sql`
- `02_create_customer_sales_summary_table.sql`
- `03_insert_customer_sales_summary.sql`
- `04_customers_above_city_average.sql`
- `05_update_customer_points.sql`
- `06_rollup_customer_sales_report.sql`
- `07_generate_customer_sales_summary_procedure.sql`
- `README.md`

### Projektwert
Dies ist ein SQL-Portfolio-Projekt auf Anfänger- bis Mittelstufenniveau.

Obwohl es sich nicht um ein vollständiges Produktivsystem handelt, zeigt es:
- Verständnis relationaler Datenbanken
- Reporting-Logik mit mehreren Tabellen
- praktische Anwendung von Aggregation
- Klassifizierung mit SQL-Bedingungen
- Automatisierung wiederkehrender Reporting-Schritte

Dieses Projekt ist nützlich für das Lernen, für die Präsentation im GitHub-Portfolio und für akademische Zwecke.

## Author
Mohammad
