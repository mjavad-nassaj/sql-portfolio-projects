# GTFS Public Transport Analytics and Monitoring Platform

## English Version

### Project Overview
This project is a MySQL-based analytics and monitoring project built on GTFS public transport data. Its purpose is to transform raw transport data into structured analytical outputs for reporting, operational monitoring, and data quality validation.

The project combines analytical SQL, reusable summary layers, classification functions, automation procedures, trigger-based logging, and dashboard-style reporting in one portfolio-ready structure.

---

### Project Objectives
The main goals of the project are:

- analyse route and service behaviour using GTFS data
- build reusable analytical summary tables
- classify operational patterns with SQL functions
- automate refresh workflows with stored procedures
- log important summary-table changes with audit tables and triggers
- generate dashboard-style outputs for reporting
- perform structured data quality checks

---

### Repository Structure
The project is organised as follows:

- `01_database_source_part_1/`
- `01_database_source_part_2/`
- `01_database_source_part_3/`
- `01_database_source_part_4/`
- `01_database_source_part_5/`
- `02_sql_scripts/`
- `03_result_csv/`
- `README.md`

This structure was chosen to keep the repository readable and upload-friendly, especially because the GTFS source data is large and had to be split into multiple parts.

---

### Source Data Structure
The GTFS source data was divided into multiple repository sections because the original source files were too large to handle comfortably as a single upload package.

The source structure is organised as follows:

- `01_database_source_part_1` → smaller GTFS source files
- `01_database_source_part_2` → shapes source, part 1
- `01_database_source_part_3` → shapes source, part 2
- `01_database_source_part_4` → stop_times source, part 1
- `01_database_source_part_5` → stop_times source, part 2

This makes the project easier to upload, review, and navigate on GitHub.

---

### Project Context
This project was built as a practical SQL portfolio project in MySQL. It focuses on turning transport data into structured outputs that support route analysis, service monitoring, management-style reporting, and data quality validation.

---

### Core Analytical Outputs
The main analytical summary tables are:

- `route_performance_summary`
- `service_operational_summary`

These tables act as reusable summary layers for later reporting, monitoring, and dashboard logic.

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
A SQL function classifies route intensity levels based on route activity.

#### 2. Service Classification
A SQL function classifies service stability levels based on weekly activity, exceptions, and service period.

#### 3. Refresh Procedures
Stored procedures were created to refresh the summary tables:

- route summary refresh
- service summary refresh

#### 4. Audit Logging
Audit tables and triggers were created to capture insert and update behaviour in summary layers.

#### 5. Dashboard Procedures
Dashboard-style procedures were created to generate structured transport reporting outputs and data quality summaries.

---

### Data Quality and Monitoring Layer
This project also includes a dedicated data quality section. Examples include checks for:

- routes with zero trips, zero services, or zero shapes
- routes where trip counts and service counts are inconsistent
- routes where shape counts exceed trip counts
- services with invalid activity patterns
- compact route and service monitoring summaries
- service stability distribution with percentage logic
- a dedicated data quality dashboard procedure

---

### Result Files
Selected CSV outputs are stored in:

- `03_result_csv/`

These files provide sample outputs for validation and make the analytical results easier to inspect.

---

### Practical Value of the Project
This project shows how SQL can be used not only for querying data, but also for:

- structuring analytical layers
- automating refresh logic
- tracking important summary changes
- building management-style outputs
- validating data quality
- combining reporting and monitoring in one workflow

---

### Skills Demonstrated
This project demonstrates practical experience in:

- MySQL
- analytical query writing
- views and summary logic
- functions and procedures
- triggers and audit tables
- dashboard-oriented reporting
- data quality checks
- conditional summary logic
- monitoring-style SQL design

---

### Why This Project Is Portfolio-Relevant
This project goes beyond simple SQL practice tasks. It demonstrates a more structured workflow that includes analysis, automation, monitoring, and reusable reporting logic. That makes it relevant for portfolio presentation in data analysis, reporting, BI-support, and SQL-heavy analytical roles.

---

### Suggested Repository Path
A suitable root folder name for this project is:

- `gtfs-public-transport-analytics-and-monitoring-platform/`

With the following internal structure:

- `gtfs-public-transport-analytics-and-monitoring-platform/`
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
This project was designed as a practical intermediate-to-advanced SQL portfolio project. It combines analysis, automation, reporting, and monitoring in a way that is closer to real structured SQL work than isolated exercise-only tasks.

---

## Deutsche Version

### Projektübersicht
Dieses Projekt ist ein MySQL-basiertes Analyse- und Monitoring-Projekt auf Grundlage von GTFS-Daten des öffentlichen Verkehrs. Ziel ist es, rohe Verkehrsdaten in strukturierte analytische Ergebnisse für Reporting, operatives Monitoring und Data-Quality-Prüfungen zu überführen.

Das Projekt verbindet analytisches SQL, wiederverwendbare Summary Layers, Klassifikationsfunktionen, Automatisierungslogik, triggerbasiertes Logging und dashboardorientiertes Reporting in einer portfoliofähigen Struktur.

---

### Projektziele
Die Hauptziele des Projekts sind:

- Analyse des Verhaltens von Routen und Services auf Basis von GTFS-Daten
- Aufbau wiederverwendbarer analytischer Summary Tables
- Klassifikation operativer Muster mit SQL-Funktionen
- Automatisierung von Refresh-Abläufen mit Stored Procedures
- Protokollierung wichtiger Änderungen mit Audit Tables und Triggern
- Erzeugung dashboardartiger Reporting-Ausgaben
- Durchführung strukturierter Data-Quality-Prüfungen

---

### Repository-Struktur
Das Projekt ist wie folgt aufgebaut:

- `01_database_source_part_1/`
- `01_database_source_part_2/`
- `01_database_source_part_3/`
- `01_database_source_part_4/`
- `01_database_source_part_5/`
- `02_sql_scripts/`
- `03_result_csv/`
- `README.md`

Diese Struktur wurde gewählt, damit das Repository übersichtlich, gut lesbar und uploadfreundlich bleibt, insbesondere weil die GTFS-Quelldaten sehr groß sind und deshalb auf mehrere Teile verteilt werden mussten.

---

### Struktur der Quelldaten
Die GTFS-Quelldaten wurden in mehrere Bereiche aufgeteilt, weil die ursprünglichen Dateien zu groß waren, um sie komfortabel als ein einziges Upload-Paket zu verwalten.

Die Struktur der Quelldaten ist wie folgt organisiert:

- `01_database_source_part_1` → kleinere GTFS-Quelldateien
- `01_database_source_part_2` → Shapes-Quelle, Teil 1
- `01_database_source_part_3` → Shapes-Quelle, Teil 2
- `01_database_source_part_4` → Stop-Times-Quelle, Teil 1
- `01_database_source_part_5` → Stop-Times-Quelle, Teil 2

Dadurch wird das Projekt auf GitHub leichter hochladbar, prüfbar und navigierbar.

---

### Projektkontext
Dieses Projekt wurde als praktisches SQL-Portfolio-Projekt in MySQL aufgebaut. Der Schwerpunkt liegt darauf, Verkehrsdaten in strukturierte Ergebnisse zu überführen, die Routenanalyse, Service-Monitoring, managementorientiertes Reporting und Data-Quality-Validierung unterstützen.

---

### Zentrale analytische Outputs
Die wichtigsten analytischen Summary Tables sind:

- `route_performance_summary`
- `service_operational_summary`

Diese Tabellen dienen als wiederverwendbare Summary Layer für Reporting, Monitoring und Dashboard-Logik.

---

### Verwendete SQL-Komponenten
Das Projekt beinhaltet den praktischen Einsatz von:

- Joins
- Views
- Subqueries
- korrelierter Logik
- Functions
- Procedures
- Triggern
- Summary Tables
- Rollup-orientiertem Reporting
- Audit Logging
- dashboardorientiertem Reporting
- Data-Quality-Monitoring

---

### Zentrale funktionale Logik

#### 1. Routenklassifikation
Eine SQL-Funktion klassifiziert die Intensität von Routen auf Basis der Routenaktivität.

#### 2. Serviceklassifikation
Eine SQL-Funktion klassifiziert die Stabilität von Services auf Basis der Wochenaktivität, Ausnahmen und des Servicezeitraums.

#### 3. Refresh Procedures
Stored Procedures wurden erstellt, um die Summary Tables zu aktualisieren:

- Refresh der Routen-Summary
- Refresh der Service-Summary

#### 4. Audit Logging
Audit Tables und Trigger wurden erstellt, um Insert- und Update-Verhalten in den Summary Layers zu protokollieren.

#### 5. Dashboard Procedures
Es wurden dashboardartige Procedures erstellt, um strukturierte Reporting-Outputs und Data-Quality-Zusammenfassungen zu erzeugen.

---

### Data-Quality- und Monitoring-Layer
Das Projekt enthält zusätzlich einen dedizierten Bereich für Data Quality. Beispiele sind Prüfungen für:

- Routen ohne Trips, ohne Services oder ohne Shapes
- Routen mit inkonsistentem Verhältnis zwischen Trip-Anzahl und Service-Anzahl
- Routen, bei denen die Shape-Anzahl größer als die Trip-Anzahl ist
- Services mit ungültigen Aktivitätsmustern
- kompakte Monitoring-Zusammenfassungen für Routen und Services
- Verteilung der Service-Stabilität mit Prozentlogik
- eine dedizierte Data-Quality-Dashboard-Procedure

---

### Ergebnisdateien
Ausgewählte CSV-Ergebnisse befinden sich in:

- `03_result_csv/`

Diese Dateien dienen als Beispielausgaben zur Validierung und machen die analytischen Ergebnisse leichter nachvollziehbar.

---

### Praktischer Mehrwert des Projekts
Dieses Projekt zeigt, dass SQL nicht nur für einfache Abfragen verwendet werden kann, sondern auch für:

- den Aufbau analytischer Schichten
- die Automatisierung von Refresh-Logik
- das Nachverfolgen wichtiger Änderungen
- managementorientierte Reporting-Ausgaben
- Data-Quality-Validierung
- die Kombination von Reporting und Monitoring in einem Workflow

---

### Nachgewiesene Fähigkeiten
Dieses Projekt zeigt praktische Erfahrung in:

- MySQL
- analytischem Query Writing
- Views und Summary-Logik
- Functions und Procedures
- Triggern und Audit Tables
- dashboardorientiertem Reporting
- Data-Quality-Prüfungen
- bedingter Summary-Logik
- monitoringorientiertem SQL-Design

---

### Warum dieses Projekt portfolio-relevant ist
Dieses Projekt geht über einfache SQL-Übungsaufgaben hinaus. Es zeigt einen strukturierteren Workflow mit Analyse, Automatisierung, Monitoring und wiederverwendbarer Reporting-Logik. Dadurch ist es gut geeignet für ein Portfolio im Bereich Data Analysis, Reporting, BI-nahe Aufgaben und SQL-lastige analytische Rollen.

---

### Empfohlener Repository-Pfad
Ein passender Root-Ordnername für dieses Projekt ist:

- `gtfs-public-transport-analytics-and-monitoring-platform/`

Mit folgender interner Struktur:

- `gtfs-public-transport-analytics-and-monitoring-platform/`
  - `01_database_source_part_1/`
  - `01_database_source_part_2/`
  - `01_database_source_part_3/`
  - `01_database_source_part_4/`
  - `01_database_source_part_5/`
  - `02_sql_scripts/`
  - `03_result_csv/`
  - `README.md`

---

### Abschließender Hinweis
Dieses Projekt wurde als praktisches SQL-Portfolio-Projekt auf mittlerem bis fortgeschrittenem Niveau entwickelt. Es verbindet Analyse, Automatisierung, Reporting und Monitoring in einer Form, die deutlich realistischer ist als isolierte SQL-Einzelübungen.
