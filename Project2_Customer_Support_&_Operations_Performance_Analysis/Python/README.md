# Customer Support \& Operations Analysis – Python



## Projektübersicht

Dieses Projekt ist Teil meines Portfolios als angehender Data Analyst und basiert auf einem realistischen Customer-Support-Use-Case.

Ziel der Analyse war es, die Ursachen für steigende Supportkosten, SLA-Breaches und unterschiedliche Teamleistungen zu untersuchen.

Der Fokus lag dabei auf:

* Datenaufbereitung mehrerer relationaler Tabellen
* Generierung realistischer Supportdaten
* KPI-Berechnung
* Identifikation operativer Problemfelder
* explorativer Datenanalyse



## Datensatz

Der Datensatz besteht aus drei miteinander verbundenen CSV-Dateien:

* Kunden: 13.251 Datensätze
* Mitarbeiter: 400 Datensätze
* Support-Tickets: 109.532 Datensätze



Die Daten wurden mit Python generiert, um ein realistisches Customer-Support-Szenario abzubilden.

Dabei wurden verschiedene Business-Regeln berücksichtigt:

* unterschiedliche Support-Teams
* verschiedene Mitarbeiter-Level
* unterschiedliche Schichten
* verschiedene Tickettypen und Prioritäten
* unterschiedliche Ticketkomplexitäten
* SLA-Breaches
* Ticketkosten
* Kundenzufriedenheit



## Datenaufbereitung

Durchgeführte Bereinigungs- und Transformationsschritte:

* Überprüfung der Datenqualität
* Kontrolle auf fehlende Werte und Duplikate
* Anpassung der Datentypen
* Erstellung zusätzlicher Analyse-Spalten
* Zusammenführung der Tabellen über gemeinsame IDs



## Feature Engineering

Für die Analyse wurden die Mitarbeiter- und Kundendaten über gemeinsame IDs mit den Support-Tickets verbunden.

Für die Analyse wurden zusätzliche Kennzahlen und Merkmale erstellt:

### Zeitbasierte Features

* Extraktion von Monat und Jahr aus dem Erstellungsdatum
* Zuordnung der Tickets zu Schichten:

  * Morning
  * Evening
  * Night



### Support KPIs

Berechnung und Analyse von:

* Resolution Time
* Ticket Cost
* SLA-Breach-Rate
* durchschnittliche Kosten pro Ticket
* durchschnittliche Bearbeitungszeit



### Analysemerkmale

Zusätzliche Betrachtung nach:

* Tickettyp
* Priorität
* Team
* Mitarbeiter
* Experience Level
* Kunde
* Region
* Schicht



## Explorative Datenanalyse

Die Analyse erfolgte mit Pandas und Matplotlib.

Untersucht wurden unter anderem:

* Kostenverteilung nach Tickettyp
* SLA-Breach-Raten nach verschiedenen Faktoren
* Bearbeitungszeiten nach Team und Schicht
* Performance-Unterschiede zwischen Mitarbeitern
* Kunden mit besonders hohen Supportkosten
* saisonale Entwicklungen



## Zentrale Erkenntnisse

Die Python-Analyse zeigte:

* Integration Support verursacht die höchsten Ticketkosten und längsten Bearbeitungszeiten.
* Performance Issues und Bug Reports verursachen aufgrund ihres hohen Ticketvolumens ebenfalls relevante Kosten.
* Der Tickettyp hat einen stärkeren Einfluss auf SLA-Breaches als die Schichtzugehörigkeit.
* Das Integration Team weist schlechtere Kennzahlen auf, was jedoch hauptsächlich durch die Komplexität der bearbeiteten Tickets erklärt werden kann.
* Die Nachtschicht im Integration Team zeigt Hinweise auf einen möglichen Ressourcenengpass.



## Export der Analysedaten

Die bereinigten und erweiterten Datensätze wurden für weitere Analysen exportiert.

Die Daten wurden anschließend für:

* SQL-Abfragen
* Power-BI-Dashboards
* weitere KPI-Analysen

verwendet.



## Verwendete Bibliotheken

* Pandas
* NumPy
* Faker
* Matplotlib



## Fazit

Die Python-Analyse bildet die Grundlage des Projekts und ermöglicht die strukturierte Untersuchung großer Supportdatenmengen.

Durch die Kombination aus Datengenerierung, Datenaufbereitung und explorativer Analyse konnten relevante operative Probleme identifiziert und erste datenbasierte Handlungsempfehlungen abgeleitet werden.

