# Rossmann Retail Sales Intelligence & Performance Management Platform

## English Version

### Project Overview
This is a SQL-first analytics project built on the Rossmann Store Sales dataset. The project transforms raw store-level sales data into a structured analytical layer for KPI reporting, promotion analysis, store benchmarking, summary tables, reusable database objects, and management-style dashboard outputs.

The project is intentionally positioned as an analytical SQL portfolio project rather than a production OLTP system or a machine learning project. The main goal is to demonstrate practical SQL problem solving, business thinking, structured database design, and interview-defensible analytical work.

---

### Project Objective
The project addresses the following business question:

> How can raw retail sales data be transformed into a reusable analytical layer that supports reporting, benchmarking, promotion analysis, and management-level performance monitoring?

To answer this, the project includes:
- data understanding and validation
- enrichment through analytical views
- time-feature extraction and business flags
- store, store type, and assortment analysis
- promotion and holiday analysis
- ranking and efficiency analysis
- peer-group benchmarking with correlated subqueries
- summary tables for lighter downstream queries
- reusable SQL functions and procedures
- executive dashboard queries
- audit logging with update and delete triggers

---

### Dataset
The project uses the Rossmann Store Sales data included in the repository.

#### Core source tables
- `train`
- `store`

#### Source files included
- `train.csv`
- `store.csv`
- `test.csv`
- `sample_submission.csv`
- SQL dump / source export files

The main analytical work is based on the `train` and `store` tables.

---

### Scope
This repository focuses on descriptive and diagnostic analytics in SQL.

It does not try to claim:
- real-time production data engineering
- machine learning forecasting
- enterprise-scale transactional orchestration
- a fully normalised dimensional warehouse design

Instead, it aims to do a smaller set of things clearly and well:
- build a clean analytical layer
- answer meaningful business questions
- use advanced SQL where it adds value
- remain readable, runnable, and defensible in an interview

---

### Project Architecture
#### Source layer
- `train`
- `store`

#### Analytical views
1. `train_store_enriched_view`
2. `store_total_sales_summary_view`
3. `store_total_sales_by_assortment_summary_view`

#### Summary tables
1. `store_daily_summary`
2. `store_monthly_summary`
3. `promo_effectiveness_summary`

#### Functions
1. `sales_band_function`
2. `promo_effectiveness_band_function`

#### Procedures
1. `refresh_store_daily_summary`
2. `refresh_store_monthly_summary`
3. `executive_dashboard_summary_procedure`

#### Audit layer
- `audit_table`
- update trigger on `store_monthly_summary`
- delete trigger on `store_monthly_summary`

---

### Main Business Questions Answered
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

### Implemented SQL Work
#### 1. Data audit and validation
Implemented checks include:
- structural audit of core tables
- business meaning audit of important columns
- missing-value analysis
- business-rule consistency checks
- grain and uniqueness validation
- join-foundation validation

#### 2. Enrichment layer
A reusable enriched analytical view was built:
- `train_store_enriched_view`

Additional enrichment work includes:
- year, month, quarter, and week-number extraction
- business flags for open day, promo day, holiday status, competition info, and promo2

#### 3. Core business analysis
Implemented analyses include:
- overall sales analysis
- sales by store
- sales by store type
- sales by assortment
- promo effect analysis
- state holiday effect analysis
- school holiday effect analysis
- weekday performance analysis
- monthly trend analysis

#### 4. Ranking, efficiency, and benchmarking
Implemented advanced logic includes:
- store ranking with window functions
- sales-per-customer efficiency analysis
- promo effectiveness by store
- competition impact analysis using competition-distance bands
- peer comparison by store type
- peer comparison by assortment
- underperforming store detection

A notable design choice is the use of correlated subqueries for peer-group benchmarking.

#### 5. Summary tables
- `store_daily_summary` at `store + date` grain
- `store_monthly_summary` at `store + year + month` grain
- `promo_effectiveness_summary` at store grain

#### 6. Functions
- `sales_band_function`
- `promo_effectiveness_band_function`

#### 7. Procedures
- `refresh_store_daily_summary`
- `refresh_store_monthly_summary`
- `executive_dashboard_summary_procedure`

#### 8. Audit and triggers
- `audit_table`
- update trigger
- delete trigger

---

### Selected Findings
Detailed bilingual insights are stored separately in:
- `task_35_final_business_insights/task_35_final_business_insights.md`

High-level findings include:
- promotions were a major sales driver
- the business showed clear monthly seasonality
- weekday performance was uneven and operationally relevant
- store performance dispersion was large across the network
- high total sales did not always imply high customer-value efficiency
- peer-group benchmarking added more managerial value than raw ranking alone

---

### Repository Structure
```text
rossmann-retail-sales-intelligence-platform/
├── database_source/
├── sql_scripts/
├── task_35_final_business_insights/
├── test_tables/
└── README.md
```

The main implementation files are kept under `sql_scripts/`, while the interpretation file is stored separately under `task_35_final_business_insights/`.

---

### Recommended Execution Order
1. Load the Rossmann database from the source SQL / raw files.
2. Run the numbered SQL files in order.
3. Create the enriched and helper views.
4. Build the summary tables.
5. Create the functions.
6. Create the procedures.
7. Create the audit table and triggers.
8. Run the executive dashboard and store dashboard queries.

---

### Design Decisions Worth Explaining in an Interview
#### Why build summary tables?
Because repeated aggregation on raw daily data makes later logic heavier, harder to read, and less reusable.

#### Why use helper views before correlated subqueries?
Because direct correlated logic on the enriched daily view was logically correct but unnecessarily heavy. Helper views reduced query weight while preserving benchmarking logic.

#### Why include triggers in an analytics project?
Not to claim a full production logging system, but to demonstrate basic change tracking and database-side automation.

#### Why keep the project SQL-first?
Because the main purpose of the repository is to demonstrate analytical SQL design, business-oriented querying, and structured reasoning.

---

### Limitations
To keep the project realistic and defensible, several limits should be stated clearly:
- This is not a predictive modelling project.
- Promotion-effect measurement here is descriptive, not causal inference.
- Competition impact is analysed through grouped business bands, not formal econometric modelling.
- The audit layer is deliberately lightweight.
- The project prioritises clarity and explainability over highly compressed SQL.

---

### Future Improvements
Possible future extensions include:
- a second promo-effect function based on average promo uplift
- a dedicated date dimension
- parameterised dashboard procedures
- broader audit logging beyond total sales
- a Power BI or Tableau layer on top of the SQL layer
- a Pandas validation notebook connected to the SQL outputs

---

### Final Assessment
This project combines:
- sound SQL fundamentals
- intermediate-to-advanced querying
- business-focused analysis
- reusable analytical objects
- modest but meaningful database automation

It does not claim to be more than it is. That is intentional.

The repository is best described as a well-structured SQL analytics portfolio project with enough depth to be discussed seriously in interviews while remaining practical, readable, and defensible.


## Deutsche Version

### Projektüberblick
Dies ist ein SQL-orientiertes Analyseprojekt auf Basis des Rossmann Store Sales Datensatzes. Das Projekt transformiert Rohdaten auf Filialebene in eine strukturierte analytische Ebene für KPI-Reporting, Promotionsanalyse, Filial-Benchmarking, Summary Tables, wiederverwendbare Datenbankobjekte und managementorientierte Dashboard-Ausgaben.

Das Projekt ist bewusst als analytisches SQL-Portfolio-Projekt positioniert und nicht als produktives OLTP-System oder Machine-Learning-Projekt. Das Hauptziel besteht darin, praktische SQL-Problemlösung, betriebswirtschaftliches Denken, strukturierte Datenbankgestaltung und im Bewerbungsgespräch gut verteidigbare Analysearbeit zu zeigen.

---

### Projektziel
Das Projekt behandelt die folgende betriebswirtschaftliche Fragestellung:

> Wie können rohe Retail-Sales-Daten in eine wiederverwendbare analytische Ebene überführt werden, die Reporting, Benchmarking, Promotionsanalyse und Management-Monitoring unterstützt?

Dafür umfasst das Projekt:
- Datenverständnis und Validierung
- Anreicherung durch analytische Views
- Extraktion von Zeitmerkmalen und Business Flags
- Analysen nach Filiale, Filialtyp und Sortiment
- Promotions- und Feiertagsanalysen
- Ranking- und Effizienzanalysen
- Peer-Group-Benchmarking mit correlated subqueries
- Summary Tables für leichtere Folgeabfragen
- wiederverwendbare SQL-Funktionen und Procedures
- Executive-Dashboard-Abfragen
- Audit-Logging mit Update- und Delete-Triggern

---

### Datensatz
Das Projekt verwendet die im Repository enthaltenen Rossmann-Store-Sales-Daten.

#### Zentrale Quelltabellen
- `train`
- `store`

#### Enthaltene Quelldateien
- `train.csv`
- `store.csv`
- `test.csv`
- `sample_submission.csv`
- SQL-Dump- bzw. Exportdateien

Die zentrale analytische Arbeit basiert auf den Tabellen `train` und `store`.

---

### Projektumfang
Dieses Repository konzentriert sich auf deskriptive und diagnostische Analytik in SQL.

Es behauptet ausdrücklich nicht:
- produktionsreifes Echtzeit-Data-Engineering
- Machine-Learning-Forecasting
- Enterprise-Transaktionsorchestrierung im großen Stil
- ein vollständig normalisiertes dimensionales Warehouse-Design

Stattdessen versucht es, eine kleinere Menge von Dingen klar und sauber umzusetzen:
- Aufbau einer sauberen analytischen Ebene
- Beantwortung sinnvoller Business-Fragen
- Einsatz fortgeschrittener SQL-Techniken dort, wo sie Mehrwert bringen
- gute Lesbarkeit, Ausführbarkeit und Verteidigbarkeit im Interview

---

### Projektarchitektur
#### Source Layer
- `train`
- `store`

#### Analytische Views
1. `train_store_enriched_view`
2. `store_total_sales_summary_view`
3. `store_total_sales_by_assortment_summary_view`

#### Summary Tables
1. `store_daily_summary`
2. `store_monthly_summary`
3. `promo_effectiveness_summary`

#### Funktionen
1. `sales_band_function`
2. `promo_effectiveness_band_function`

#### Procedures
1. `refresh_store_daily_summary`
2. `refresh_store_monthly_summary`
3. `executive_dashboard_summary_procedure`

#### Audit Layer
- `audit_table`
- Update-Trigger auf `store_monthly_summary`
- Delete-Trigger auf `store_monthly_summary`

---

### Zentrale Business-Fragen
Das Projekt ist um folgende Fragen herum aufgebaut:
- Wie sieht das gesamte Verkaufs- und Kundenbild des Unternehmens aus?
- Welche Filialen performen am besten und am schwächsten?
- Wie beeinflussen Filialtyp und Sortiment die Performance?
- Sind Promotionen ein relevanter Umsatztreiber?
- Wie wirken sich staatliche Feiertage und Schulferien auf den Umsatz aus?
- Gibt es deutliche Muster nach Wochentagen und Monaten?
- Welche Filialen sind beim Umsatz pro Kunde besonders effizient?
- Spielt die Distanz zum Wettbewerber offenbar eine Rolle?
- Welche Filialen liegen über oder unter dem Durchschnitt ihrer Peer Group?
- Welche Filialen unterperformen relativ zu ihrer strukturellen Vergleichsgruppe?

---

### Umgesetzte SQL-Arbeit
#### 1. Datenprüfung und Validierung
Umgesetzt wurden unter anderem:
- strukturelle Prüfung der Kern-Tabellen
- fachliche Prüfung wichtiger Spalten
- Missing-Value-Analyse
- Konsistenzprüfung von Business-Regeln
- Prüfung von Grain und Eindeutigkeit
- Validierung der Join-Grundlage

#### 2. Enrichment Layer
Es wurde eine wiederverwendbare analytische View aufgebaut:
- `train_store_enriched_view`

Weitere Anreicherungsschritte umfassen:
- Extraktion von Jahr, Monat, Quartal und Wochennummer
- Business Flags für Öffnungstag, Promo-Tag, Feiertagsstatus, Wettbewerbsinfo und Promo2

#### 3. Zentrale Business-Analysen
Umgesetzte Analysen umfassen:
- Gesamtumsatzanalyse
- Analyse nach Filiale
- Analyse nach Store Type
- Analyse nach Sortiment
- Promotionsanalyse
- Analyse staatlicher Feiertage
- Analyse von Schulferien
- Wochentagsanalyse
- monatliche Trendanalyse

#### 4. Ranking, Effizienz und Benchmarking
Fortgeschrittene analytische Logik umfasst:
- Filial-Ranking mit Window Functions
- Effizienzanalyse Umsatz pro Kunde
- Promo-Wirksamkeit pro Filiale
- Analyse des Wettbewerbseinflusses über Distanz-Bänder
- Peer-Vergleich nach Store Type
- Peer-Vergleich nach Sortiment
- Erkennung von unterdurchschnittlich performenden Filialen

Eine wichtige Designentscheidung war der bewusste Einsatz von correlated subqueries für Peer-Group-Benchmarking.

#### 5. Summary Tables
- `store_daily_summary` auf dem Grain `store + date`
- `store_monthly_summary` auf dem Grain `store + year + month`
- `promo_effectiveness_summary` auf Filialebene

#### 6. Funktionen
- `sales_band_function`
- `promo_effectiveness_band_function`

#### 7. Procedures
- `refresh_store_daily_summary`
- `refresh_store_monthly_summary`
- `executive_dashboard_summary_procedure`

#### 8. Audit und Trigger
- `audit_table`
- Update-Trigger
- Delete-Trigger

---

### Ausgewählte Erkenntnisse
Die ausführlichen zweisprachigen Insights liegen separat in:
- `task_35_final_business_insights/task_35_final_business_insights.md`

Wichtige Erkenntnisse sind unter anderem:
- Promotionen waren ein wesentlicher Umsatztreiber
- das Geschäft zeigte eine deutliche monatliche Saisonalität
- die Performance nach Wochentagen war ungleich verteilt und operativ relevant
- die Leistungsunterschiede zwischen Filialen waren groß
- hoher Gesamtumsatz bedeutete nicht automatisch hohe Effizienz pro Kunde
- Peer-Group-Benchmarking lieferte mehr Management-Nutzen als reines Roh-Ranking

---

### Repository-Struktur
```text
rossmann-retail-sales-intelligence-platform/
├── database_source/
├── sql_scripts/
├── task_35_final_business_insights/
├── test_tables/
└── README.md
```

Die zentralen Implementierungsdateien liegen unter `sql_scripts/`, während die Interpretation separat unter `task_35_final_business_insights/` gespeichert ist.

---

### Empfohlene Ausführungsreihenfolge
1. Rossmann-Datenbank aus den SQL- bzw. Rohdateien laden.
2. Die nummerierten SQL-Dateien der Reihe nach ausführen.
3. Die Enrichment- und Helper-Views erstellen.
4. Die Summary Tables aufbauen.
5. Die Funktionen erstellen.
6. Die Procedures erstellen.
7. Audit Table und Trigger anlegen.
8. Executive-Dashboard- und Store-Dashboard-Abfragen ausführen.

---

### Designentscheidungen, die man im Interview erklären kann
#### Warum Summary Tables statt ständig auf Rohdaten zu aggregieren?
Weil wiederholte Aggregation auf Rohdaten spätere Logik schwerer, unübersichtlicher und schlechter wiederverwendbar macht.

#### Warum Helper Views vor correlated subqueries?
Weil direkte correlated subqueries auf der angereicherten Tages-View logisch korrekt, aber unnötig schwer waren. Helper Views reduzierten die Last und behielten die Benchmarking-Logik bei.

#### Warum Trigger in einem Analyseprojekt?
Nicht um ein vollständiges produktives Logging-System zu behaupten, sondern um grundlegendes Change Tracking und Datenbank-Automatisierung zu demonstrieren.

#### Warum SQL-first?
Weil der Hauptzweck des Repositories darin besteht, analytisches SQL-Design, business-orientierte Abfragen und strukturiertes Denken zu zeigen.

---

### Grenzen des Projekts
Damit das Projekt realistisch und gut verteidigbar bleibt, sollten seine Grenzen klar benannt werden:
- Es ist kein Predictive-Modelling-Projekt.
- Die Promotionsmessung ist hier deskriptiv, nicht kausal.
- Wettbewerbseinfluss wird über gruppierte Business-Bänder analysiert, nicht über formale ökonometrische Modelle.
- Die Audit-Ebene ist bewusst leichtgewichtig gehalten.
- Das Projekt priorisiert Klarheit und Erklärbarkeit vor stark komprimiertem SQL.

---

### Mögliche Weiterentwicklungen
Sinnvolle nächste Schritte wären:
- eine zweite Promo-Funktion auf Basis durchschnittlicher Promo-Uplifts
- eine eigene Date Dimension
- parametrisierte Dashboard-Procedures
- breiteres Audit-Logging über Total Sales hinaus
- eine Power-BI- oder Tableau-Schicht auf Basis der SQL-Ebene
- ein Pandas-Validierungsnotebook auf Basis der SQL-Outputs

---

### Abschließende Bewertung
Dieses Projekt kombiniert:
- solide SQL-Grundlagen
- Queries auf mittlerem bis fortgeschrittenem Niveau
- business-orientierte Analyse
- wiederverwendbare analytische Objekte
- kleine, aber sinnvolle Datenbank-Automatisierung

Es behauptet nicht, mehr zu sein, als es ist. Das ist bewusst so gewählt.

Am besten lässt sich das Repository als gut strukturiertes SQL-Analytics-Portfolio-Projekt beschreiben, das genügend Tiefe für ernsthafte Interviewgespräche bietet und dabei praktisch, lesbar und verteidigbar bleibt.
