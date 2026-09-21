import pandas as pd
import matplotlib.pyplot as plt


# ==========================================
# 1. Daten laden
# ==========================================

customers_df = pd.read_csv("customers.csv")
employees_df = pd.read_csv("employees.csv")
support_tickets_df = pd.read_csv("support_tickets.csv")


# ==========================================
# 2. Datenaufbereitung
# ==========================================

support_tickets_df["created_date"] = pd.to_datetime(
    support_tickets_df["created_date"]
)

support_tickets_df["resolved_date"] = pd.to_datetime(
    support_tickets_df["resolved_date"]
)


def determine_shift(hour):
    if 6 <= hour < 14:
        return "Morning"
    elif 14 <= hour < 22:
        return "Evening"
    else:
        return "Night"


support_tickets_df["created_shift"] = (
    support_tickets_df["created_date"]
    .dt.hour
    .apply(determine_shift)
)

support_tickets_df["resolved_shift"] = (
    support_tickets_df["resolved_date"]
    .dt.hour
    .apply(determine_shift)
)


# ==========================================
# 3. Tabellen verbinden
# ==========================================

merged_df = support_tickets_df.merge(
    employees_df,
    on="employee_id",
    how="left"
)

merged_df = merged_df.merge(
    customers_df,
    on="customer_id",
    how="left"
)


# ==========================================
# 4. Allgemeine KPIs
# ==========================================

overall_kpis = pd.DataFrame({
    "Metric": [
        "Tickets",
        "Average Resolution Time (h)",
        "Average Ticket Cost (€)",
        "SLA Breach Rate (%)",
        "Average Satisfaction"
    ],
    "Value": [
        len(merged_df),
        merged_df["resolution_hours"].mean(),
        merged_df["ticket_cost"].mean(),
        merged_df["sla_breached"].mean() * 100,
        merged_df["satisfaction_score"].mean()
    ]
})


# ==========================================
# 5. Ticketanalyse
# ==========================================

ticket_analysis = (
    merged_df
    .groupby("ticket_type")
    .agg(
        tickets=("ticket_id", "count"),
        avg_cost_eur=("ticket_cost", "mean"),
        total_cost_eur=("ticket_cost", "sum"),
        avg_resolution_hours=("resolution_hours", "mean"),
        sla_breach_rate=("sla_breached", lambda x: x.mean() * 100)
    )
    .sort_values(
        "total_cost_eur",
        ascending=False
    )
)


# Analyse nach Priorität

priority_analysis = (
    merged_df
    .groupby("priority")
    .agg(
        avg_resolution_hours=("resolution_hours", "mean"),
        avg_cost_eur=("ticket_cost", "mean"),
        sla_breach_rate=("sla_breached", lambda x: x.mean() * 100)
    )
)


# ==========================================
# 6. Teamanalyse
# ==========================================

team_analysis = (
    merged_df
    .groupby("team")
    .agg(
        tickets=("ticket_id", "count"),
        avg_resolution_hours=("resolution_hours", "mean"),
        avg_cost_eur=("ticket_cost", "mean"),
        total_cost_eur=("ticket_cost", "sum"),
        sla_breach_rate=("sla_breached", lambda x: x.mean() * 100),
        satisfaction=("satisfaction_score", "mean")
    )
    .sort_values(
        "sla_breach_rate",
        ascending=False
    )
)


# Integration Team Analyse

integration_analysis = (
    merged_df[
        merged_df["team"] == "Integration Team"
    ]
    .groupby("shift")
    .agg(
        tickets=("ticket_id", "count"),
        avg_resolution_hours=("resolution_hours", "mean"),
        sla_breach_rate=("sla_breached", lambda x: x.mean() * 100)
    )
)


# Schichtvergleich

shift_analysis = (
    merged_df
    .groupby("created_shift")
    .agg(
        tickets=("ticket_id", "count"),
        avg_resolution_hours=("resolution_hours", "mean"),
        sla_breach_rate=("sla_breached", lambda x: x.mean() * 100),
        avg_cost_eur=("ticket_cost", "mean")
    )
)


# ==========================================
# 7. Mitarbeiteranalyse
# ==========================================

employee_analysis = (
    merged_df
    .groupby("employee_id")
    .agg(
        tickets=("ticket_id", "count"),
        avg_resolution_hours=("resolution_hours", "mean"),
        sla_breach_rate=("sla_breached", lambda x: x.mean() * 100),
        satisfaction=("satisfaction_score", "mean")
    )
)


employee_ranking = (
    employee_analysis
    .sort_values(
        "avg_resolution_hours",
        ascending=False
    )
    .head(10)
)


# ==========================================
# 8. Kundenanalyse
# ==========================================

customer_analysis = (
    merged_df
    .groupby("customer_id")
    .agg(
        tickets=("ticket_id", "count"),
        total_cost_eur=("ticket_cost", "sum"),
        avg_cost_eur=("ticket_cost", "mean"),
        avg_resolution_hours=("resolution_hours", "mean"),
        sla_breach_rate=("sla_breached", lambda x: x.mean() * 100),
        satisfaction=("satisfaction_score", "mean")
    )
)


# Nur Kunden mit ausreichender Ticketanzahl betrachten

customer_analysis_filtered = (
    customer_analysis[
        customer_analysis["tickets"] >= 20
    ]
)


customer_ranking = (
    customer_analysis_filtered
    .sort_values(
        "total_cost_eur",
        ascending=False
    )
    .head(10)
)


# ==========================================
# 9. Zeit- und Saisonanalyse
# ==========================================

monthly_analysis = (
    merged_df
    .groupby(
        merged_df["created_date"].dt.to_period("M")
    )
    .agg(
        tickets=("ticket_id", "count"),
        avg_resolution_hours=("resolution_hours", "mean"),
        sla_breach_rate=("sla_breached", lambda x: x.mean() * 100),
        avg_cost_eur=("ticket_cost", "mean")
    )
)


# ==========================================
# 10. Export für weitere Analysen
# ==========================================

merged_df.to_csv(
    "support_analysis_clean.csv",
    index=False
)

ticket_analysis.to_csv(
    "ticket_analysis.csv"
)

team_analysis.to_csv(
    "team_analysis.csv"
)

customer_ranking.to_csv(
    "customer_ranking.csv"
)


# ======================
# Visualisierung
# ======================

plt.figure(figsize=(12, 7))
ticket_analysis["total_cost_eur"].sort_values(ascending=False).plot(kind="bar")
plt.title("Gesamtkosten nach Tickettyp")
plt.ylabel("€")
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()

plt.figure(figsize=(12, 7))
ticket_analysis["avg_resolution_hours"].sort_values(ascending=False).plot(kind="bar")
plt.title("Durchschnittliche Bearbeitungszeit nach Tickettyp")
plt.ylabel("h")
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()

plt.figure(figsize=(12, 7))
ticket_analysis["sla_breach_rate"].sort_values(ascending=False).plot(kind="bar")
plt.title("SLA-Breach-Rate nach Tickettyp")
plt.ylabel("%")
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()

plt.figure(figsize=(12, 7))
team_analysis["sla_breach_rate"].sort_values(ascending=False).plot(kind="bar")
plt.title("SLA-Breach-Rate nach Team")
plt.ylabel("%")
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()

plt.figure(figsize=(12, 7))
team_analysis["avg_resolution_hours"].sort_values(ascending=False).plot(kind="bar")
plt.title("Durchschnittliche Bearbeitungszeit nach Team")
plt.ylabel("h")
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()

plt.figure(figsize=(12, 7))
integration_analysis["avg_resolution_hours"].sort_values(ascending=False).plot(kind="bar")
plt.title("Durchschnittliche Bearbeitungszeit nach Schicht im Integration Team")
plt.ylabel("h")
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()

# ==========================================
# Ergebnisse anzeigen
# ==========================================

print("\n=== Allgemeine KPIs ===")
print(overall_kpis.round(2))

print("\n=== Ticketanalyse ===")
print(ticket_analysis.round(2))

print("\n=== Teamanalyse ===")
print(team_analysis.round(2))

print("\n=== Integration Team Analyse ===")
print(integration_analysis.round(2))

print("\n=== Schichtanalyse ===")
print(shift_analysis.round(2))

print("\n=== Mitarbeiter Ranking ===")
print(employee_ranking.round(2))

print("\n=== Kunden Ranking ===")
print(customer_ranking.round(2))

print("\n=== Monatliche Analyse ===")
print(monthly_analysis.round(2))


print((support_tickets_df["resolution_hours"]).mean())