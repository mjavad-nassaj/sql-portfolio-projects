
--  Business Meaning Audit of Core Columns

-- 1. Metriken:
-- Diese Spalten zeigen die wichtigsten geschäftlichen Ergebnisse.
-- - TRAIN.Sales
-- - TRAIN.Customers

-- 2. Flags:
-- Diese Spalten zeigen einen bestimmten Zustand oder eine Situation.
-- - TRAIN.Open
-- - TRAIN.Promo
-- - TRAIN.SchoolHoliday
-- - STORE.Promo2

-- 3. Beschreibende / kategorische Spalten:
-- Diese Spalten helfen bei der Beschreibung und beim Vergleich von Filialen oder Tagen.
-- - STORE.StoreType
-- - STORE.Assortment
-- - STORE.PromoInterval
-- - TRAIN.StateHoliday
-- - TRAIN.DayOfWeek

-- 4. Zeitbezogene Spalten:
-- Diese Spalten sind wichtig für Zeitanalysen und Entwicklungen.
-- - TRAIN.Date
-- - STORE.CompetitionOpenSinceMonth
-- - STORE.CompetitionOpenSinceYear
-- - STORE.Promo2SinceWeek
-- - STORE.Promo2SinceYear

-- 5. Identifikations- und Schlüsselspalten:
-- Diese Spalten sind wichtig für die eindeutige Zuordnung und für Joins.
-- - STORE.Store
-- - TRAIN.Store

-- 6. Analytische Einflussvariable:
-- Diese Spalte ist keine direkte Kennzahl, aber sie kann die Verkaufsleistung beeinflussen.
-- - STORE.CompetitionDistance