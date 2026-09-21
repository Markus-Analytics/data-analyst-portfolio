-- ============================================================
-- CUSTOMER SUPPORT & OPERATIONS PERFORMANCE ANALYSIS
-- SQL-ANALYSE
-- ============================================================
--
-- Ziel:
-- Analyse von Supportleistung, SLA-Breaches, Kosten,
-- Bearbeitungszeiten und operativen Belastungen.
--
-- Datenbasis:
-- - 13.251 Kunden
-- - 400 Mitarbeiter
-- - 109.532 Support-Tickets
--
-- ============================================================


-- ==========================================
-- 1. Tabellen zurücksetzen
-- ==========================================

DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS tickets;


-- ==========================================
-- 2. Daten importieren
-- ==========================================


CREATE TABLE customers AS
SELECT*
FROM read_csv_auto('C:\Users\Markos\Desktop\Data Analyst\Portfolio\Project2_Customer_Support_&_Operations_Performance_Analysis\SQL\customers.csv');

CREATE TABLE employees AS
SELECT*
FROM read_csv_auto('C:\Users\Markos\Desktop\Data Analyst\Portfolio\Project2_Customer_Support_&_Operations_Performance_Analysis\SQL\employees.csv');

CREATE TABLE tickets AS
SELECT*
FROM read_csv_auto('C:\Users\Markos\Desktop\Data Analyst\Portfolio\Project2_Customer_Support_&_Operations_Performance_Analysis\SQL\support_tickets.csv');


-- ==========================================
-- 3. Daten prüfen
-- ==========================================

SELECT *
FROM customers
LIMIT 5;

SELECT *
FROM employees
LIMIT 5;

SELECT *
FROM tickets
LIMIT 5;


-- ============================================================
-- 4. ANALYSE 1: TICKETTYPEN
-- ============================================================
--
-- Fragestellung:
-- Welche Tickettypen verursachen die höchsten Kosten
-- und weisen gleichzeitig eine schlechte Performance auf?
--
-- Betrachtete Kennzahlen:
-- - Anzahl Tickets
-- - Gesamtkosten
-- - SLA-Breach-Rate
-- - durchschnittliche Bearbeitungszeit
-- ============================================================


SELECT 
    ticket_type,
    COUNT(*) AS tickets,
    ROUND(SUM(ticket_cost), 2) AS Gesamtkosten,
    ROUND(AVG(CAST(sla_breached AS INTEGER)) *100, 2) AS sla_breach_rate,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours
FROM 
    tickets
GROUP BY 
    ticket_type
ORDER BY
    Gesamtkosten DESC;



-- ============================================================
-- 5. ANALYSE 2: TEAMLEISTUNG
-- ============================================================
--
-- Fragestellung:
-- Welche Teams weisen die höchsten SLA-Breach-Raten
-- und Bearbeitungszeiten auf?
--
-- Betrachtete Kennzahlen:
-- - Anzahl Tickets
-- - durchschnittliche Bearbeitungszeit
-- - SLA-Breach-Rate
-- - Kundenzufriedenheit
-- ============================================================


SELECT
    e.team,
    COUNT(*) AS tickets,
    ROUND(AVG(t.resolution_hours), 2) AS avg_resolution_hours,
    ROUND(AVG(CAST(t.sla_breached AS INTEGER)) * 100, 2) AS sla_breach_rate,
    ROUND(AVG(t.satisfaction_score), 2) AS avg_satisfaction
FROM tickets t
LEFT JOIN employees e
    ON t.employee_id = e.employee_id
GROUP BY e.team
ORDER BY sla_breach_rate DESC;


-- ============================================================
-- 6. ANALYSE 3: INTEGRATION TEAM – SCHICHT & AUSLASTUNG
-- ============================================================
--
-- Fragestellung:
-- Gibt es innerhalb des Integration Teams Unterschiede
-- zwischen den einzelnen Schichten?
--
-- Zusätzlich wird die Anzahl der Tickets pro Mitarbeiter
-- betrachtet, um mögliche Kapazitätsengpässe zu erkennen.
--
-- Betrachtete Kennzahlen:
-- - Anzahl Tickets
-- - Anzahl Mitarbeiter
-- - Tickets pro Mitarbeiter
-- - durchschnittliche Bearbeitungszeit
-- - SLA-Breach-Rate
-- ============================================================


SELECT
    e.shift,
    e.team,
    COUNT(*) AS tickets,
    COUNT(DISTINCT e.employee_id) AS employees,
    ROUND(AVG(t.resolution_hours), 2) AS avg_resolution_hours,
    ROUND(AVG(CAST(t.sla_breached AS INTEGER)) *100, 2) AS sla_breach_rate,
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT e.employee_id), 2) AS tickets_per_employee
FROM 
    employees e
LEFT JOIN tickets t
    ON e.employee_id = t.employee_id
WHERE
    e.team = 'Integration Team'
GROUP BY 
    e.shift,
    e.team
ORDER BY
    sla_breach_rate DESC;



-- ============================================================
-- 7. ANALYSE 4: KUNDEN MIT HOHER SLA-BREACH-RATE
-- ============================================================
--
-- Fragestellung:
-- Welche Kunden weisen eine besonders hohe
-- SLA-Breach-Rate auf?
--
-- Um Ergebnisse mit sehr wenigen Tickets zu vermeiden,
-- werden nur Kunden mit mehr als 20 Tickets betrachtet.
--
-- Zusätzlich werden nur Kunden mit einer
-- SLA-Breach-Rate von über 60 % berücksichtigt.
--
-- Betrachtete Kennzahlen:
-- - Anzahl Tickets
-- - Gesamtkosten
-- - durchschnittliche Kosten pro Ticket
-- - SLA-Breach-Rate
-- ============================================================


SELECT
    c.customer_name,
    COUNT(*) AS tickets,
    ROUND(SUM(t.ticket_cost), 2) AS total_cost,
    ROUND(AVG(t.ticket_cost), 2) AS avg_cost,
    ROUND(AVG(CAST(t.sla_breached AS INTEGER)) *100, 2) AS sla_breach_rate
FROM
    customers c
LEFT JOIN tickets t
    ON c.customer_id = t.customer_id
GROUP BY
    c.customer_name
HAVING
   tickets > 20 
   AND sla_breach_rate > 60
ORDER BY
    sla_breach_rate DESC
LIMIT
    20;


-- ============================================================
-- 8. ANALYSE 5: MONATLICHE ENTWICKLUNG
-- ============================================================
--
-- Fragestellung:
-- Gibt es im Zeitverlauf auffällige Veränderungen
-- bei Ticketvolumen, Bearbeitungszeit oder SLA-Breaches?
--
-- Der Datensatz beginnt 2024 und reicht bis in den
-- Januar 2026. Da für Januar 2026 nur wenige Tickets
-- vorhanden sind, wird die Analyse auf die 24 vollständigen
-- Monate von 2024 und 2025 begrenzt.
--
-- Betrachtete Kennzahlen:
-- - Anzahl Tickets
-- - durchschnittliche Bearbeitungszeit
-- - SLA-Breach-Rate
-- ============================================================


SELECT
    EXTRACT(YEAR FROM created_date) AS year,
    EXTRACT(MONTH FROM created_date) AS month,
    COUNT(*) AS tickets,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours,
    ROUND(AVG(CAST(sla_breached AS INTEGER)) *100, 2) AS sla_breach_rate
FROM
    tickets
WHERE
    created_date < '2026-01-01'
GROUP BY
    month,
    year
ORDER BY
    year,
    month;
