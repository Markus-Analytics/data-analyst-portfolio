# Customer Support & Operations Analysis – SQL


## Projektübersicht

Dieses Projekt ist Teil meines Portfolios als angehender Data Analyst und basiert auf einem realistischen Customer-Support-Use-Case.

Ziel der SQL-Analyse war es, die Ursachen für steigende Supportkosten, SLA-Breaches und unterschiedliche Teamleistungen zu untersuchen.

Der Fokus lag dabei auf:

- Analyse relationaler Daten
- Verknüpfung mehrerer Tabellen über IDs
- Aggregation und Berechnung von KPIs
- Analyse von Tickettypen und Teams
- Untersuchung von SLA-Breaches
- Analyse von Kunden mit auffälliger SLA-Performance
- zeitliche Analyse der Supportentwicklung


## Datensatz

Der Datensatz besteht aus drei miteinander verbundenen CSV-Dateien:

- Kunden: 13.251 Datensätze
- Mitarbeiter: 400 Datensätze
- Support-Tickets: 109.532 Datensätze

Die Daten wurden zuvor mit Python generiert und aufbereitet und anschließend für die SQL-Analyse verwendet.


## Datenimport

Die drei CSV-Dateien werden mit DuckDB eingelesen und als Tabellen angelegt:

- `customers`
- `employees`
- `tickets`

Die Tabellen werden über gemeinsame IDs miteinander verknüpft:

- `employee_id`
- `customer_id`


## SQL-Analysen

### Tickettypen

Untersucht wurden:

- Anzahl Tickets
- Gesamtkosten
- SLA-Breach-Rate
- durchschnittliche Bearbeitungszeit

**Business Question:**

Welche Tickettypen verursachen die höchsten Kosten und weisen gleichzeitig eine schlechte Performance auf?

**Ergebnis:**

Integration Support ist der kritischste Tickettyp und weist die höchsten Kosten, die längsten Bearbeitungszeiten und die höchste SLA-Breach-Rate auf.

Performance Issues und Bug Reports verursachen aufgrund ihres hohen Ticketvolumens ebenfalls relevante Gesamtkosten.


### Teamanalyse

Untersucht wurden:

- Anzahl Tickets
- durchschnittliche Bearbeitungszeit
- SLA-Breach-Rate
- Kundenzufriedenheit

**Business Question:**

Welche Teams weisen die höchsten SLA-Breach-Raten und Bearbeitungszeiten auf?

**Ergebnis:**

Das Integration Team weist die schlechtesten Leistungskennzahlen auf. Dies muss jedoch im Zusammenhang mit der Zusammensetzung der bearbeiteten Tickets betrachtet werden, da das Team einen hohen Anteil komplexer Integration-Support-Tickets bearbeitet.


### Integration Team – Schicht & Auslastung

Untersucht wurden:

- Anzahl Tickets
- Anzahl Mitarbeiter
- Tickets pro Mitarbeiter
- durchschnittliche Bearbeitungszeit
- SLA-Breach-Rate

**Business Question:**

Gibt es innerhalb des Integration Teams Unterschiede zwischen den Schichten und Hinweise auf mögliche Kapazitätsengpässe?

**Ergebnis:**

Die Nachtschicht weist die längsten Bearbeitungszeiten und eine erhöhte SLA-Breach-Rate auf.

Zusammen mit der geringen Anzahl an Mitarbeitern in dieser Schicht deutet dies auf einen möglichen Ressourcenengpass hin.


### Kundenanalyse

Untersucht wurden Kunden mit:

- mehr als 20 Tickets
- einer SLA-Breach-Rate von über 60 %

Betrachtete Kennzahlen:

- Anzahl Tickets
- Gesamtkosten
- durchschnittliche Kosten pro Ticket
- SLA-Breach-Rate

**Business Question:**

Welche Kunden weisen eine besonders hohe SLA-Breach-Rate auf?

**Ergebnis:**

Einige Kunden weisen auffällig hohe SLA-Breach-Raten und Supportkosten auf. Die Ergebnisse deuten jedoch darauf hin, dass diese Unterschiede hauptsächlich durch die Zusammensetzung der Tickettypen entstehen und nicht eindeutig auf kundenbezogene Faktoren zurückgeführt werden können.


### Monatliche Entwicklung

Untersucht wurden:

- Anzahl Tickets
- durchschnittliche Bearbeitungszeit
- SLA-Breach-Rate

Die Analyse wurde auf die 24 vollständigen Monate von 2024 und 2025 begrenzt, da für Januar 2026 nur wenige Tickets vorhanden sind.

**Business Question:**

Gibt es im Zeitverlauf auffällige Veränderungen bei Ticketvolumen, Bearbeitungszeit oder SLA-Breaches?

**Ergebnis:**

Es konnten keine relevanten saisonalen Muster festgestellt werden.


## Zentrale Erkenntnisse

Die SQL-Analyse bestätigt die wesentlichen Erkenntnisse der Python-Analyse:

- Integration Support ist der kritischste Tickettyp hinsichtlich Kosten, Bearbeitungszeit und SLA-Breaches.
- Performance Issues und Bug Reports verursachen aufgrund ihres hohen Ticketvolumens ebenfalls relevante Kosten.
- Das Integration Team weist die schwächsten Leistungskennzahlen auf.
- Die Nachtschicht im Integration Team zeigt Hinweise auf einen möglichen Ressourcenengpass.
- Kunden mit hoher SLA-Breach-Rate sind nicht zwangsläufig selbst die Ursache der Probleme.
- Es konnten keine relevanten saisonalen Muster festgestellt werden.


## Handlungsempfehlungen

- Prozesse rund um Integration-Support-Tickets analysieren und optimieren.
- Ressourcenplanung im Integration Team, insbesondere für die Nachtschicht, überprüfen.
- Ursachen für die langen Bearbeitungszeiten bei Integration Support untersuchen.
- Performance Issues und Bug Reports aufgrund ihres hohen Ticketvolumens ebenfalls priorisiert analysieren.
- Kundenbezogene Auffälligkeiten gemeinsam mit der Ticketzusammensetzung betrachten.


## Verwendete Tools

- SQL (DuckDB)


## Fazit

Die SQL-Analyse ermöglicht die strukturierte Auswertung der Supportdaten direkt auf Datenbankebene.

Durch Aggregationen, JOINs, Filterungen und KPI-Berechnungen konnten die wichtigsten operativen Problemfelder identifiziert und die Ergebnisse der Python-Analyse bestätigt werden.

Die SQL-Abfragen bilden damit einen weiteren Bestandteil der End-to-End-Analyse und zeigen die Fähigkeit, Business Questions mit SQL in konkrete Kennzahlen und Ergebnisse zu übersetzen.