-- ============================================
-- Downtime Analysis
-- Ziel: Identifikation der Kosten durch Stillstand
-- ============================================


-- Business Question:
-- Welche Maschine verursacht die höchsten Kosten durch Stillstand?


-- Logik:
-- - Berechnung des Stillstands aller Maschinen
-- - Umwandlung von Minuten in Stunden und Stunden in Tage, für nachvollziehbareren Vergleich
-- - Berechnung der Kosten durch Stillstand aller Maschinen


SELECT 
    maschine,
    ROUND((SUM(stillstand_min)/60),2) AS Stillstand_Stunden,
    ROUND(((SUM(stillstand_min)/60)/24),1) AS Stillstand_Tage,
    ROUND((AVG(gesamtkosten))*((SUM(stillstand_min))/60),2) AS Stillstand_Schaden_EUR,
    ROUND((SUM(stillstand_min) / 60.0) /((DATEDIFF('day', MIN(datum), MAX(datum)) + 1) * 24) * 100 ,2) AS Stillstandsquote
FROM 
    production_analysis
GROUP BY
    maschine
ORDER BY 
    Stillstand_Schaden_EUR DESC;


-- Ergebnis:
-- - Maschine 2 verursacht die höchsten Stillstandszeiten und den höchsten finanziellen Schaden
-- - Die Stillstandsquote von Maschine 2 liegt bei rund 8,6% und ist damit deutlich erhöht
-- - Maschine 3 weist die geringsten Stillstandszeiten auf


-- Business Insight:
-- - Ursachen der hohen Stillstandzeiten bei Maschine 2 priorisiert untersuchen
-- - Maßnahmen zur Reduzierung ungeplanter Stillstände entwickeln