# GTFS Public Transport Analytics and Monitoring Platform

## English Version

### Project Overview
This project is a SQL-based analytics and monitoring project built on GTFS public transport data.

The goal of the project is to transform raw transport-related data into structured analytical outputs for reporting, monitoring, and data quality validation.

The project focuses on:

- route performance analysis
- service operational analysis
- summary tables
- functions and procedures
- trigger-based audit logging
- dashboard-oriented reporting
- data quality monitoring

---

### Repository Structure
This repository is organised in the following order:

- `01_database_source_part_1`
- `01_database_source_part_2`
- `01_database_source_part_3`
- `01_database_source_part_4`
- `01_database_source_part_5`
- `02_sql_scripts`
- `03_result_csv`
- `README.md`

This structure was selected to keep the repository organised, readable, and upload-friendly.

---

### Database Source Structure
The GTFS source data was split into multiple repository sections because the original source files were too large to handle comfortably as one single upload package.

The database source is organised as follows:

- `01_database_source_part_1` → smaller GTFS source files
- `01_database_source_part_2` → `stop_times` source, part 1
- `01_database_source_part_3` → `stop_times` source, part 2
- `01_database_source_part_4` → `shapes` source, part 1
- `01_database_source_part_5` → `shapes` source, part 2

This makes the project easier to upload, review, and navigate on GitHub.

---

### Project Context
This project was built in MySQL as part of a practical SQL portfolio.

It combines analytical logic, reporting logic, automation, and monitoring logic in one project structure.

The project uses GTFS-based transport data and turns it into structured outputs that can support operational analysis and management-style reporting.

---

### Main Project Goals
The main goals of this project are:

- to build analytical summary tables from transport data
- to classify route and service behaviour using SQL functions
- to refresh summary tables with stored procedures
- to log important changes with triggers and audit tables
- to generate dashboard-style outputs
- to perform structured data quality checks
- to demonstrate a practical SQL project workflow in a portfolio-ready format

---

### Core Tables and Outputs
The main analytical outputs of the project are:

- `route_performance_summary`
- `service_operational_summary`

These tables are used as summary layers for later analysis and reporting.

---

### Main SQL Components Used
This project includes practical use of:

- joins
- views
- subqueries
- correlated logic
- functions
- procedures
- triggers
- summary tables
- rollup-style reporting
- audit logging
- dashboard-oriented reporting
- data quality monitoring

---

### Key Functional Logic

#### 1. Route Classification
A SQL function was used to classify route intensity levels based on route activity.

#### 2. Service Classification
A SQL function was used to classify service stability levels based on weekly activity, exceptions, and service period.

#### 3. Refresh Procedures
Stored procedures were created to refresh the summary tables:

- route summary refresh
- service summary refresh

#### 4. Audit Logging
Audit tables and triggers were created to capture insert and update behaviour in summary layers.

#### 5. Dashboard Procedure
A dashboard-style procedure was created to generate structured transport reporting outputs.

---

### Bonus Tasks Included
This project also includes several bonus tasks that extend the analytical and monitoring value of the project.

#### Bonus 1
Route data quality check for routes with:
- zero trips
- zero services
- zero shapes

#### Bonus 2
Route data quality check for:
- `trip_count < unique_service_count`

#### Bonus 3
Route data quality check for:
- `unique_shape_count > trip_count`

#### Bonus 4
Service data quality check for:
- `active_days_per_week = 0`
- `exception_count < 0`

#### Bonus 5
Route data quality monitoring summary using conditional counting logic.

#### Bonus 6
Service data quality monitoring summary using conditional counting logic.

#### Bonus 7
Service stability distribution summary implemented with a **CASE-based summary approach**, including **percentage calculation** for each stability level.

#### Bonus 8
A dedicated **data quality dashboard procedure** that combines:
- route quality summary
- service quality summary

in one reusable SQL procedure.

---

### Important Note on Bonus 7
For Bonus 7, the service stability distribution was intentionally implemented with:

- `CASE`
- conditional counting
- percentage logic

instead of a `GROUP BY` output format, because the selected structure was more suitable for a compact dashboard-style summary.

---

### Result Files
The repository also includes selected CSV result files in:

- `03_result_csv`

These files help demonstrate the final outputs of the project more clearly and make the analytical results easier to inspect.

Examples include summary outputs such as:

- route summary results
- service summary results
- selected monitoring outputs

---

### Main Analytical Value of the Project
This project demonstrates how SQL can be used not only for querying data, but also for:

- structuring analytical layers
- automating refresh logic
- tracking changes
- building management-style outputs
- validating data quality
- combining reporting and monitoring in one project

---

### Skills Demonstrated
This project demonstrates practical experience in:

- SQL (MySQL)
- analytical query writing
- views and summary logic
- functions and procedures
- triggers and audit tables
- dashboard-oriented reporting
- data quality checks
- conditional summary logic
- monitoring-style SQL design

---

### Why This Project Is Useful
This project is useful because it shows a more structured and practical SQL workflow than simple exercise-based SQL tasks.

It demonstrates the ability to:

- analyse transport-related data
- summarise and classify operational behaviour
- automate analytical refresh logic
- build reusable reporting procedures
- create data quality control layers

This makes the project especially valuable for portfolio presentation in data, reporting, and analytics-related roles.

---

### Suggested File Structure
A suitable structure for this project is:

- `MINI_PROJECT.4/`
  - `01_database_source_part_1/`
  - `01_database_source_part_2/`
  - `01_database_source_part_3/`
  - `01_database_source_part_4/`
  - `01_database_source_part_5/`
  - `02_sql_scripts/`
  - `03_result_csv/`
  - `README.md`

---

### Final Note
This project was designed as a practical intermediate-to-advanced SQL portfolio project.

It combines analysis, automation, reporting, and monitoring in a way that is more realistic than isolated SQL exercises.

---

## Deutsche Version

### Projektübersicht
Dieses Projekt ist ein SQL-basiertes Analyse- und Monitoring-Projekt auf Grundlage von GTFS-Daten des öffentlichen Verkehrs.

Das Ziel des Projekts ist es, rohe verkehrsbezogene Daten in strukturierte analytische Ergebnisse für Reporting, Monitoring und Data-Quality-Prüfungen zu überführen.

Der Schwerpunkt des Projekts liegt auf:

- Analyse der Routenleistung
- Analyse des Betriebsverhaltens von Services
- Summary Tables
- Functions und Procedures
- triggerbasiertem Audit-Logging
- dashboardorientiertem Reporting
- Data-Quality-Monitoring

---

### Repository-Struktur
Dieses Repository ist in folgender Reihenfolge aufgebaut:

- `01_database_source_part_1`
- `01_database_source_part_2`
- `01_database_source_part_3`
- `01_database_source_part_4`
- `01_database_source_part_5`
- `02_sql_scripts`
- `03_result_csv`
- `README.md`

Diese Struktur wurde gewählt, damit das Repository übersichtlich, gut lesbar und uploadfreundlich bleibt.

---

### Struktur der Quelldatenbank
Die GTFS-Quelldaten wurden in mehrere Repository-Bereiche aufgeteilt, weil die ursprünglichen Quelldateien zu groß waren, um sie sinnvoll als ein einziges Upload-Paket zu verwalten.

Die Quelldatenbank ist wie folgt organisiert:

- `01_database_source_part_1` → kleinere GTFS-Quelldateien
- `01_database_source_part_2` → `stop_times`, Teil 1
- `01_database_source_part_3` → `stop_times`, Teil 2
- `01_database_source_part_4` → `shapes`, Teil 1
- `01_database_source_part_5` → `shapes`, Teil 2

Dadurch lässt sich das Projekt auf GitHub leichter hochladen, prüfen und nachvollziehen.

---

### Projektkontext
Dieses Projekt wurde in MySQL als Teil eines praktischen SQL-Portfolios erstellt.

Es verbindet analytische Logik, Reporting-Logik, Automatisierung und Monitoring innerhalb einer einheitlichen Projektstruktur.

Die verwendeten GTFS-Verkehrsdaten werden in strukturierte Auswertungen umgewandelt, die sich für operative Analysen und managementorientiertes Reporting eignen.

---

### Hauptziele des Projekts
Die wichtigsten Ziele dieses Projekts sind:

- analytische Summary Tables auf Basis von Verkehrsdaten aufzubauen
- Routen- und Serviceverhalten mit SQL-Functions zu klassifizieren
- Summary Tables mit Stored Procedures zu aktualisieren
- wichtige Änderungen mit Triggern und Audit Tables zu protokollieren
- dashboardartige Auswertungen zu erzeugen
- strukturierte Data-Quality-Prüfungen durchzuführen
- einen praxisnahen SQL-Workflow in Portfolio-Form zu demonstrieren

---

### Zentrale Tabellen und Ergebnisse
Die wichtigsten analytischen Ergebnisse des Projekts sind:

- `route_performance_summary`
- `service_operational_summary`

Diese Tabellen dienen als Summary-Schicht für weitere Analysen und Reports.

---

### Verwendete SQL-Bausteine
Das Projekt enthält praktische Anwendung von:

- Joins
- Views
- Subqueries
- korrelierter Logik
- Functions
- Procedures
- Triggers
- Summary Tables
- rollupartigem Reporting
- Audit-Logging
- dashboardorientiertem Reporting
- Data-Quality-Monitoring

---

### Wichtige funktionale Logik

#### 1. Routenklassifikation
Eine SQL-Function wurde verwendet, um Routenintensitätsstufen anhand der Routenaktivität zu klassifizieren.

#### 2. Serviceklassifikation
Eine SQL-Function wurde verwendet, um Service-Stabilitätsstufen anhand von Wochenaktivität, Ausnahmen und Servicezeitraum zu klassifizieren.

#### 3. Refresh-Procedures
Stored Procedures wurden erstellt, um die Summary Tables zu aktualisieren:

- Refresh der Routensummary
- Refresh der Servicesummary

#### 4. Audit-Logging
Audit Tables und Trigger wurden erstellt, um Insert- und Update-Verhalten in den Summary-Schichten zu protokollieren.

#### 5. Dashboard-Procedure
Eine dashboardartige Procedure wurde erstellt, um strukturierte Transport-Reports zu erzeugen.

---

### Enthaltene Bonusaufgaben
Dieses Projekt enthält außerdem mehrere Bonusaufgaben, die den analytischen und Monitoring-Wert des Projekts erweitern.

#### Bonus 1
Route-Data-Quality-Check für Routen mit:
- null Trips
- null Services
- null Shapes

#### Bonus 2
Route-Data-Quality-Check für:
- `trip_count < unique_service_count`

#### Bonus 3
Route-Data-Quality-Check für:
- `unique_shape_count > trip_count`

#### Bonus 4
Service-Data-Quality-Check für:
- `active_days_per_week = 0`
- `exception_count < 0`

#### Bonus 5
Route-Data-Quality-Monitoring-Summary mit bedingter Zähllogik.

#### Bonus 6
Service-Data-Quality-Monitoring-Summary mit bedingter Zähllogik.

#### Bonus 7
Summary zur Verteilung von `service_stability_level`, umgesetzt mit einem **CASE-basierten Summary-Ansatz** einschließlich **prozentualer Berechnung** für jede Stabilitätsstufe.

#### Bonus 8
Eine eigene **Data-Quality-Dashboard-Procedure**, die
- Route-Quality-Summary
- Service-Quality-Summary

in einer wiederverwendbaren SQL-Procedure zusammenführt.

---

### Wichtiger Hinweis zu Bonus 7
Für Bonus 7 wurde die Verteilung der Service-Stabilitätsstufen bewusst mit:

- `CASE`
- bedingter Zähllogik
- Prozentlogik

umgesetzt und nicht mit einem `GROUP BY`-Ausgabeformat, da diese Struktur besser zu einer kompakten dashboardartigen Summary passt.

---

### Ergebnisdateien
Das Repository enthält außerdem ausgewählte CSV-Ergebnisdateien in:

- `03_result_csv`

Diese Dateien helfen dabei, die finalen Ergebnisse des Projekts klarer zu zeigen und die analytischen Ausgaben leichter nachvollziehbar zu machen.

Beispiele sind:

- Routensummary-Ergebnisse
- Servicesummary-Ergebnisse
- ausgewählte Monitoring-Ergebnisse

---

### Zentraler analytischer Wert des Projekts
Dieses Projekt zeigt, dass SQL nicht nur für einfache Datenabfragen verwendet werden kann, sondern auch für:

- Aufbau analytischer Schichten
- Automatisierung von Refresh-Logik
- Nachverfolgung von Änderungen
- Erstellung managementorientierter Ausgaben
- Validierung der Datenqualität
- Verbindung von Reporting und Monitoring in einem Projekt

---

### Nachgewiesene Fähigkeiten
Das Projekt zeigt praktische Erfahrung in:

- SQL (MySQL)
- analytischem Query Writing
- Views und Summary-Logik
- Functions und Procedures
- Triggers und Audit Tables
- dashboardorientiertem Reporting
- Data-Quality-Checks
- bedingter Summary-Logik
- monitoringorientiertem SQL-Design

---

### Warum dieses Projekt nützlich ist
Dieses Projekt ist nützlich, weil es einen strukturierteren und praxisnäheren SQL-Workflow zeigt als einfache Übungsaufgaben.

Es demonstriert die Fähigkeit:

- verkehrsbezogene Daten zu analysieren
- operatives Verhalten zusammenzufassen und zu klassifizieren
- analytische Refresh-Logik zu automatisieren
- wiederverwendbare Reporting-Procedures zu bauen
- Data-Quality-Kontrollschichten aufzubauen

Dadurch ist das Projekt besonders wertvoll für die Portfolio-Präsentation in daten-, reporting- und analysebezogenen Rollen.

---

### Empfohlene Projektstruktur
Eine sinnvolle Struktur für dieses Projekt ist:

- `MINI_PROJECT.4/`
  - `01_database_source_part_1/`
  - `01_database_source_part_2/`
  - `01_database_source_part_3/`
  - `01_database_source_part_4/`
  - `01_database_source_part_5/`
  - `02_sql_scripts/`
  - `03_result_csv/`
  - `README.md`

---

### Abschließende Bemerkung
Dieses Projekt wurde als praxisnahes SQL-Portfolio-Projekt auf mittlerem bis fortgeschrittenem Niveau konzipiert.

Es verbindet Analyse, Automatisierung, Reporting und Monitoring auf eine Weise, die realistischer ist als isolierte SQL-Übungen.

---

## Author

Mohammad
