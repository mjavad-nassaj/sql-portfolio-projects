# Exercise 2 - Customer Order Report

## English Version

### File Name Recommendation
For the SQL query itself, a clear and professional file name would be:

`exercise_2_customer_order_report.sql`

If you want a shorter name, you can also use:

`customer_order_report.sql`

### Overview
This file documents a medium-level SQL practice exercise based on the `sql_store` database.

The purpose of this exercise is to generate a customer-level report by combining customer information, order records, and order item details.

### Objective
The main objective of this exercise is to write a SQL query that shows, for each customer:

- customer ID
- full customer name
- city
- total number of orders
- first order date
- last order date
- total amount of all orders
- average order value
- customer activity status based on total purchase amount

### Database Used
- `sql_store`

### Tables Used
- `customers`
- `orders`
- `order_items`

### SQL Concepts Practised
This exercise helps practise the following SQL concepts:

- `SELECT`
- `JOIN`
- `GROUP BY`
- `COUNT(DISTINCT ...)`
- `MIN()`
- `MAX()`
- `SUM()`
- calculated expressions
- `CASE`
- `HAVING`
- `ORDER BY`

### Logic of the Exercise
The report is built at the **customer level**, which means each final row represents one customer.

To solve this exercise correctly, it is important to understand that:

- customer information comes from the `customers` table
- order dates come from the `orders` table
- financial totals come from the `order_items` table
- the grouping must be done by customer, not by order

A key part of the solution is calculating the total order amount using:

`quantity * unit_price`

Then the total amount for all orders of one customer is calculated with `SUM(...)`.

The average order value is calculated by dividing the total amount by the number of distinct orders.

### Learning Value
This exercise is useful because it teaches how to move from the **order level** to the **customer level** in SQL analysis.

It also helps develop a better understanding of:

- aggregation logic
- grouping at the correct level
- the difference between counting rows and counting distinct orders
- filtering grouped data with `HAVING`
- creating categories with `CASE`

### Project Value for GitHub
This exercise is a good example of a beginner-to-intermediate SQL reporting task.

Although it is still a practice exercise, it demonstrates:

- relational database understanding
- multi-table query writing
- reporting logic
- aggregation and conditional classification
- structured SQL problem solving

### Suggested Repository Structure
Recommended files for this exercise:

- `exercise_2_customer_order_report.sql`
- `exercise_2_customer_order_report_README_EN_DE.md`

---

## Deutsche Version

### Empfehlung für den Dateinamen
Für die eigentliche SQL-Abfrage wäre ein klarer und professioneller Dateiname:

`exercise_2_customer_order_report.sql`

Falls du einen kürzeren Namen möchtest, kannst du auch diesen verwenden:

`customer_order_report.sql`

### Überblick
Diese Datei dokumentiert eine SQL-Übung auf mittlerem Schwierigkeitsniveau auf Grundlage der Datenbank `sql_store`.

Der Zweck dieser Übung besteht darin, einen kundenbezogenen Bericht zu erstellen, indem Kundeninformationen, Bestelldaten und Bestellpositionen miteinander kombiniert werden.

### Ziel
Das Hauptziel dieser Übung besteht darin, eine SQL-Abfrage zu schreiben, die für jeden Kunden folgende Informationen anzeigt:

- Kunden-ID
- vollständiger Kundenname
- Stadt
- Gesamtzahl der Bestellungen
- Datum der ersten Bestellung
- Datum der letzten Bestellung
- Gesamtbetrag aller Bestellungen
- durchschnittlicher Bestellwert
- Kundenstatus auf Grundlage des gesamten Einkaufswerts

### Verwendete Datenbank
- `sql_store`

### Verwendete Tabellen
- `customers`
- `orders`
- `order_items`

### Geübte SQL-Konzepte
Diese Übung hilft dabei, die folgenden SQL-Konzepte zu trainieren:

- `SELECT`
- `JOIN`
- `GROUP BY`
- `COUNT(DISTINCT ...)`
- `MIN()`
- `MAX()`
- `SUM()`
- berechnete Ausdrücke
- `CASE`
- `HAVING`
- `ORDER BY`

### Logik der Übung
Der Bericht wird auf der **Kundenebene** erstellt. Das bedeutet, dass jede endgültige Zeile einen Kunden repräsentiert.

Um diese Übung korrekt zu lösen, ist es wichtig zu verstehen, dass:

- die Kundeninformationen aus der Tabelle `customers` kommen
- die Bestelldaten aus der Tabelle `orders` kommen
- die finanziellen Gesamtsummen aus der Tabelle `order_items` berechnet werden
- die Gruppierung nach Kunden und nicht nach Bestellungen erfolgen muss

Ein zentraler Teil der Lösung ist die Berechnung des Bestellwerts mit:

`quantity * unit_price`

Anschließend wird der Gesamtwert aller Bestellungen eines Kunden mit `SUM(...)` berechnet.

Der durchschnittliche Bestellwert wird berechnet, indem der Gesamtbetrag durch die Anzahl der unterschiedlichen Bestellungen geteilt wird.

### Lernwert
Diese Übung ist nützlich, weil sie zeigt, wie man in einer SQL-Analyse von der **Bestellebene** auf die **Kundenebene** wechselt.

Außerdem hilft sie dabei, ein besseres Verständnis für folgende Punkte zu entwickeln:

- Aggregationslogik
- Gruppierung auf der richtigen Ebene
- den Unterschied zwischen dem Zählen von Zeilen und dem Zählen unterschiedlicher Bestellungen
- das Filtern gruppierter Daten mit `HAVING`
- die Erstellung von Kategorien mit `CASE`

### Projektwert für GitHub
Diese Übung ist ein gutes Beispiel für eine SQL-Reporting-Aufgabe auf Anfänger- bis Mittelstufenniveau.

Obwohl es sich weiterhin um eine Übungsaufgabe handelt, zeigt sie:

- Verständnis relationaler Datenbanken
- Schreiben von Abfragen mit mehreren Tabellen
- Reporting-Logik
- Aggregation und bedingte Klassifizierung
- strukturiertes Problemlösen mit SQL

### Empfohlene Repository-Struktur
Empfohlene Dateien für diese Übung:

- `exercise_2_customer_order_report.sql`
- `exercise_2_customer_order_report_README_EN_DE.md`
