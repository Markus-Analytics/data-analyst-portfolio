# 📊 Produktionsanalyse



## 🎯 Projektübersicht



Dieses Projekt ist Teil meines Portfolios als angehender Data Analyst und basiert auf einem realistischen Produktions-Use-Case.



Ziel der Analyse war es, herauszufinden, wo in der Produktion die größten finanziellen Verluste durch Ausschuss und Stillstand entstehen.



Die zentrale Business-Frage lautete:



> „Wo verlieren wir am meisten Geld durch Ausschuss und wann passiert das?“



---



## 📁 Datensatz



Der Datensatz umfasst \*\*50.000 Zeilen\*\* und enthält unter anderem:



- Produktionsmenge

- Ausschuss

- Maschinen (M1, M2, M3)

- Stillstandzeiten

- Kosten pro Einheit

- Gesamtkosten

- Datum



Der Datensatz wurde mit Python generiert, um ein realistisches Produktionsszenario abzubilden.



Dabei wurden typische Effekte berücksichtigt:



- unterschiedliche Effizienz der Maschinen

- erhöhte Ausschussquoten einzelner Maschinen

- höhere Stillstandzeiten

- saisonale Effekte (z. B. geringere Produktion im Sommer)



---



## 🧹 Datenaufbereitung



Durchgeführte Bereinigungs- und Transformationsschritte:



- Bereinigung negativer Ausschusswerte (Datenfehler)

- Umwandlung des Datums in ein Datetime-Format

- Extraktion der Stunde aus dem Zeitstempel

- Erstellung von Schichten basierend auf der Uhrzeit:



| Schicht | Uhrzeit |

|---|---|

| Früh | 06:00 – 14:00 |

| Spät | 14:00 – 22:00 |

| Nacht | 22:00 – 06:00 |



---



## 📊 Durchgeführte Analysen



### 1. Gesamt-KPIs



Berechnung zentraler Produktionskennzahlen:



- Gesamtproduktion

- Gesamtausschuss

- Ausschussquote



---



### 2. Maschinenanalyse



Analyse der Maschinenleistung durch:



- Aggregation von Produktion, Ausschuss und Stillstand

- Berechnung der Ausschussquote pro Maschine

- Vergleich der Maschinenperformance



---



### 3. Kostenanalyse



Erweiterung der Kostenbetrachtung durch:



- Berechnung der Ausschusskosten

- Ergänzung der Gesamtkosten um Ausschusskosten

- Berechnung realer Produktionskosten

- Durchschnittliche Kosten pro Maschine



---



### 4. Stillstandskosten



Analyse des finanziellen Schadens durch Maschinenstillstand:



- Berechnung der Stillstandzeiten

- Umrechnung Minuten → Stunden → Tage

- Berechnung der Stillstandskosten



---



## 📈 Visualisierung



Visualisiert wurden gezielt die wichtigsten Kennzahlen:



- Ausschussquote pro Maschine

- Durchschnittliche Kosten pro Maschine

- Kosten durch Stillstand



Ziel war eine klare und schnelle Entscheidungsgrundlage ohne unnötige Visualisierungen.



---



## 🧠 Zentrale Erkenntnisse



- **M3** weist die höchste Ausschussquote auf und ist die ineffizienteste Maschine

- **M2** verursacht den höchsten finanziellen Schaden durch Stillstand

- **M1** produziert am meisten und verursacht aufgrund der höchsten Produktionsmenge die höchsten Gesamtkosten, arbeitet jedoch vergleichsweise stabil



---



## 💡 Business Empfehlungen



- Wartung und Optimierung von Maschine 3 priorisieren

- Ursachenanalyse der Stillstände bei Maschine 2 durchführen

- Kontinuierliches Monitoring von Maschine 1 etablieren



---



## 🛠️ Verwendete Tools



- Python

- Pandas

- Matplotlib

- Visual Studio Code

- GitHub



---



## 📂 Weiterverwendung der Daten



Die bereinigte Version des Datensatzes wurde als `production_analysis_clean.csv` exportiert und für die weiteren Analysen in Power BI verwendet.



---



## 📌 Fazit



Die Analyse zeigt, dass finanzielle Verluste nicht ausschließlich durch Ausschuss entstehen, sondern insbesondere durch Maschinenstillstände verstärkt werden.



Die Kombination aus technischer Analyse und Kostenbetrachtung ermöglicht konkrete datenbasierte Maßnahmen zur Optimierung der Produktion.
