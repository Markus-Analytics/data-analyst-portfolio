# Produktionsanalyse mit SQL

## Projektübersicht

Dieses Projekt ist Teil meines Portfolios als angehender Data Analyst und basiert auf einem realistischen Produktions-Use-Case.

Ziel war es, mithilfe von SQL betriebliche Schwachstellen in der Produktion zu identifizieren und datenbasierte Handlungsempfehlungen abzuleiten.

Die Analyse wurde mit **DuckDB** durchgeführt.

---

## 🎯 Ziel des Projekts

Untersucht wurden drei zentrale Fragestellungen:

- Welche Maschine verursacht die höchste Ausschussquote?
- Welche Maschine verursacht die höchsten realen Produktionskosten?
- Welche Maschine verursacht die höchsten Kosten durch Stillstand?

---

## 📁 Datensatz

Der Datensatz umfasst **50.000 Zeilen** und enthält unter anderem:

- Produktion
- Ausschuss
- Maschine (M1, M2, M3)
- Stillstand_min
- Kosten_pro_Einheit
- Gesamtkosten
- Datum

Der Datensatz wurde erstellt, um ein realistisches Produktionsszenario abzubilden.

Berücksichtigt wurden typische Effekte wie:

- unterschiedliche Maschinenleistung
- erhöhte Ausschussrate einzelner Maschinen
- variierende Stillstandzeiten
- realistische Kostenstrukturen
- zeitliche Produktionsverläufe

---

## 🛠️ Verwendete Tools

- SQL
- DuckDB
- Visual Studio Code
- GitHub

---

## 📊 Durchgeführte Analysen

### 1. Scrap Analysis

Analyse der Ausschussquote nach Maschine und Schicht.

Verwendete SQL-Techniken:

- CASE WHEN zur Schichtlogik
- GROUP BY
- SUM()
- Prozentberechnung
- ORDER BY

Ergebnis:

- Maschine 3 weist in allen Schichten die höchste Ausschussquote auf.

---

### 2. Cost Analysis

Analyse der realen Produktionskosten unter Berücksichtigung von Ausschusskosten.

Verwendete SQL-Techniken:

- Aggregationen
- SUM()
- AVG()
- berechnete Kennzahlen

Ergebnis:

- Maschine 1 verursacht die höchsten Gesamtkosten.
- Maschine 3 verursacht die höchsten Durchschnittskosten pro Datensatz.

---

### 3. Downtime Analysis

Analyse der Kosten durch Maschinenstillstand.

Verwendete SQL-Techniken:

- SUM()
- AVG()
- DATEDIFF()
- Prozentberechnung
- Umrechnung Minuten → Stunden → Tage

Ergebnis:

- Maschine 2 verursacht den höchsten finanziellen Schaden durch Stillstand.

---

## 📈 Zentrale Erkenntnisse

- **M3** ist qualitativ die kritischste Maschine (höchster Ausschuss)
- **M1** ist kostenmäßig relevant durch hohe Produktionsmenge
- **M2** ist operativ kritisch durch hohe Stillstandskosten

---

## 💡 Business Empfehlungen

- Wartung und Qualitätsprüfung von Maschine 3 priorisieren
- Effizienzpotenziale bei Maschine 1 prüfen
- Ursachenanalyse der Stillstände bei Maschine 2 durchführen

---

## 📂 Projektdateien

- Scrap_Analysis.sql
- Cost_Analysis.sql
- Downtime_Analysis.sql
- production_data.csv

---

## 📌 Fazit

Dieses Projekt zeigt meine Fähigkeit, mit SQL reale Business-Fragen zu beantworten, Kennzahlen zu berechnen und aus Daten konkrete Handlungsempfehlungen abzuleiten.