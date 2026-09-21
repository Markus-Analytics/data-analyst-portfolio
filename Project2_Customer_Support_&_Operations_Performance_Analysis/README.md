## Verwendete Tools

* Python (Pandas, NumPy, Faker, Matplotlib)
* SQL (DuckDB)
* Power BI



## Datensatz

Das Projekt besteht aus drei CSV-Dateien:

* Kunden: 13.251 Datensätze
* Mitarbeiter: 400 Datensätze
* Support-Tickets: 109.532 Datensätze



## Business-Szenario

Ein internationales Softwareunternehmen hat Probleme mit:

* steigenden Supportkosten
* sinkender Kundenzufriedenheit
* zunehmenden SLA-Breaches
* unterschiedlichen Teamleistungen



## Projektziel

Ziel dieses Projekts ist die Analyse der Support-Performance eines internationalen Softwareunternehmens. Untersucht werden die wichtigsten Kostentreiber, Ursachen für SLA-Breaches sowie Leistungsunterschiede zwischen Teams, Tickettypen und Kunden. Auf Basis der Ergebnisse werden datenbasierte Handlungsempfehlungen abgeleitet.



## Executive Summary

Die Analyse identifizierte Integration Support als größten Kostentreiber des Customer Supports. Dieser Tickettyp verursacht gleichzeitig die höchsten Bearbeitungszeiten, die höchsten SLA-Breach-Raten und die höchsten durchschnittlichen Ticketkosten.

Das Integration Team weist zwar die schlechtesten Leistungskennzahlen auf, die Ergebnisse deuten jedoch darauf hin, dass dies überwiegend auf den hohen Anteil komplexer Integration-Support-Tickets sowie einen Ressourcenengpass auf der Nachtschicht zurückzuführen ist.

Zusätzlich wurde ein möglicher Ressourcenengpass in der Nachtschicht identifiziert. Integration-Support-Tickets werden gleichmäßig über alle Schichten erstellt, während im Integration Team lediglich drei Mitarbeiter ausschließlich in der Nachtschicht arbeiten und dort keine Senior-Mitarbeiter eingesetzt werden. Gleichzeitig weist diese Schicht die längsten Bearbeitungszeiten auf.

Die Kundenanalyse zeigt, dass hohe Supportkosten hauptsächlich durch die Ticketzusammensetzung entstehen und weniger durch einzelne Kundenmerkmale.

Darüber hinaus konnten keine saisonalen Muster festgestellt werden, sodass die identifizierten Probleme nicht auf zeitlich begrenzte Belastungsspitzen zurückzuführen sind.

Die Ergebnisse sprechen dafür, insbesondere die Prozesse rund um Integration Support zu optimieren und die Ressourcenplanung der Nachtschicht im Integration Team zu überprüfen.



## Ergebnisse

### Haupttreiber der Supportkosten

* Integration Support verursacht mit Abstand die höchsten Kosten pro Ticket.
* Performance Issues verursachen aufgrund des hohen Ticketvolumens ebenfalls einen großen Kostenblock.
* Bug Reports tragen aufgrund ihres hohen Ticketaufkommens ebenfalls wesentlich zu den Gesamtkosten bei.

### Teamanalyse

* Das Integration Team weist die höchsten Bearbeitungszeiten, Kosten, SLA-Breach-Raten und die niedrigste Kundenzufriedenheit auf.
* Die Analyse zeigt jedoch, dass dies hauptsächlich auf den hohen Anteil komplexer Integration-Support-Tickets zurückzuführen ist.

### Analyse der Tickettypen

* Integration Support ist der kritischste Tickettyp.
* höchste Gesamt-, sowie Durchschnittskosten
* längste Bearbeitungszeit
* höchste SLA-Breach-Rate

Weitere auffällige Tickettypen sind Performance Issues und Bug Reports.

### Analyse der SLA-Breaches

* Obwohl sich die SLA-Breach-Raten zwischen den Schichten unterscheiden, zeigen die Analysen, dass der Tickettyp einen deutlich stärkeren Einfluss besitzt als die Schicht selbst.

### Ursachenanalyse des Integration Teams

Integration-Support-Tickets werden gleichmäßig über alle Schichten erstellt. Gleichzeitig arbeiten im Integration Team lediglich drei Mitarbeiter ausschließlich in der Nachtschicht, darunter kein Senior-Mitarbeiter. Dies deutet auf einen möglichen Ressourcenengpass auf der Nachtschicht hin und nicht auf eine ungleichmäßige Ticketverteilung.

### Mitarbeiteranalyse

Zwischen Mitarbeitern, die denselben Tickettyp bearbeiten, bestehen deutliche Unterschiede bei der Bearbeitungszeit und der SLA-Performance. Mit den vorhandenen Daten lässt sich jedoch nicht eindeutig bestimmen, ob diese Unterschiede auf Ticketkomplexität, Arbeitsbelastung, Spezialisierungen oder unterschiedliche Prozesse zurückzuführen sind.

### Kundenanalyse

Einige Kunden verursachen besonders hohe Supportkosten. Die Analyse zeigt jedoch, dass dies überwiegend auf die Zusammensetzung ihrer Tickets zurückzuführen ist und weniger auf die Kunden selbst.

### Saisonale Analyse

Es konnten keine saisonalen Muster im Ticketaufkommen oder den wichtigsten KPIs festgestellt werden.

### Regionsanalyse

Zwischen den Regionen konnten ebenfalls keine relevanten Unterschiede hinsichtlich Servicequalität, Kosten oder SLA-Breach-Raten festgestellt werden. Die größten Unterschiede entstehen durch Tickettyp und Teamstruktur, nicht durch regionale Faktoren.

## Handlungsempfehlungen

* Prozesse rund um Integration-Support-Tickets analysieren und optimieren.
* Ressourcenplanung im Integration Team, insbesondere für die Nachtschicht überprüfen und gegebenenfalls anpassen.
* Unterschiede zwischen Mitarbeitern mit zusätzlichen Daten (z. B. Ticketkomplexität, Spezialisierungen oder Workload) weiter untersuchen.
* Performance Issues und Bug Reports aufgrund ihres hohen Ticketvolumens ebenfalls priorisiert analysieren.

