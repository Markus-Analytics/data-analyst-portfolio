-- ============================================
-- Scrap Analysis
-- Ziel: Identifikation der höchsten Ausschussquote nach Maschine und Schicht
-- ============================================


-- Business Question:
-- Welche Maschine und Schicht verursachen die höchste Ausschussquote?


-- Logik:
-- - Schichten werden basierend auf der Stunde gebildet
-- - Aggregation nach Maschine und Schicht
-- - Berechnung der Ausschussquote in Prozent


SELECT 
    CASE
        WHEN EXTRACT(hour FROM datum) >= 6 AND EXTRACT(hour FROM datum) < 14  THEN 'Früh'
        WHEN EXTRACT(hour FROM datum) >= 14 AND EXTRACT(hour FROM datum) < 22 THEN 'Spät'
        ELSE 'Nacht'
    END AS Schicht,

    
    maschine,

    ROUND(SUM(produktion)) AS Gesamtproduktion,
    ROUND(SUM(ausschuss)) AS Gesamtausschuss,

    ROUND(SUM(ausschuss) * 100.0 / SUM(produktion), 2) AS Ausschussquote
    
FROM 
    production_analysis
GROUP BY
    maschine,
    Schicht
ORDER BY 
    Ausschussquote DESC;


-- Ergebnis:
-- - Maschine 3 zeigt in allen Schichten die höchste Ausschussquote (~8%)
-- - Die Ausschussquote von Maschine 3 liegt konstant etwa 3 Prozentpunkte über den anderen Maschinen
-- - → Hinweis auf systematische Ineffizienz dieser Maschine


-- Business Insight:
-- - Die hohe Ausschussquote von Maschine 3 deutet auf Optimierungsbedarf hin
-- - (z. B. Wartung, Prozessanalyse oder Qualitätskontrolle)