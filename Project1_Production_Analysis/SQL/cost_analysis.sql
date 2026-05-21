-- ============================================
-- Cost Analysis
-- Ziel: Identifikation der kostenintensivsten Maschine
-- ============================================


-- Business Question:
-- Welche Maschine verursacht die höchsten Kosten?


-- Logik:
-- - Vergleich der Gesamtproduktion und Gesamtkosten aller Maschinen
-- - Ergänzung von Ausschusskosten, da diese in den Gesamtkosten nicht enthalten sind
-- - Berechnung der realen Kosten, mit Berücksichtigung der zusätzlichen Kosten durch Ausschuss


SELECT 
    maschine,
    ROUND(SUM(produktion)) AS Gesamtproduktion,
    ROUND(SUM(gesamtkosten),2) AS Gesamtkosten,
    ROUND(SUM(gesamtkosten + ausschuss * kosten_pro_einheit),2) AS Reale_Gesamtkosten,
    ROUND(AVG(gesamtkosten + ausschuss * kosten_pro_einheit),2) AS Reale_Durchschnittskosten
FROM 
    production_analysis
GROUP BY
    maschine
ORDER BY 
    Reale_Gesamtkosten DESC;


-- Ergebnis:
-- - Maschine 1 verursacht die höchsten Gesamtkosten, da sie die höchste Produktionsmenge aufweist
-- - Nachdem die Ausschusskosten einbezogen wurden, verursacht Maschine 3 die höchsten Durchschnittskosten, trotz der niedrigsten Produktionsmenge


-- Business Insight:
-- - Maschine 1 prüfen, da Optimierungen bei hoher Produktionsmenge besonders große Wirkung haben können
-- - Ausschussreduzierung bei Maschine 3 priorisieren, um Stückkosten zu senken