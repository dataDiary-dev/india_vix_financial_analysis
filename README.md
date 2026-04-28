# 📊 India VIX Financial Analysis (2009–2021)

**A multi-tool financial data analysis project exploring India's Volatility Index to uncover market fear patterns, seasonal trends, and actionable investment insights.**

---

## 👩‍💻 Author
**Vedika Mahale**

---

## 📌 Project Overview

India VIX (Volatility Index) is a real-time measure of market-expected volatility — essentially a **fear gauge** for Indian equity markets. This project analyses 12 years of India VIX historical data (2009–2021) across a full data pipeline: from raw data cleaning to SQL querying to Python visualisation, culminating in business recommendations grounded in the data.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| **Python** (Pandas, Matplotlib, Seaborn) | Data cleaning, feature engineering, EDA, visualisations |
| **MySQL** | Structured data storage, analytical SQL queries |
| **Excel** | Pivot tables, pivot charts, data documentation layer |
| **Jupyter Notebook** | Interactive analysis environment |

---

## 📁 Project Structure

```
nifty-vix-analysis/
├── data/
│   ├── INDIAVIX_.csv                  ← original raw data
│   └── india_vix_clean.csv            ← cleaned by Python
├── sql/
│   ├── schema.sql                     ← table creation
│   └── queries.sql                    ← all analytical queries
├── notebooks/
│   ├── 01_data_cleaning.ipynb         ← cleaning + MySQL load
│   ├── 02_eda_analysis.ipynb          ← all charts
│   └── 04_business_recommendations.ipynb
├── reports/
│   └── charts/                        ← exported chart PNGs
├── excel/
│   └── india_vix_analysis.xlsx        ← pivot tables + charts
├── requirements.txt
└── README.md
```

---

## 📊 Dataset

- **Source:** Kaggle — India VIX Historical Data
- **Period:** March 2009 – July 2021
- **Records:** 3,060 trading days
- **Columns used:** `date`, `open`, `high`, `low`, `close`, `previous`

---

## ⚙️ Feature Engineering

The following columns were derived in Python:

| Column | Formula | Purpose |
|--------|---------|---------|
| `daily_return` | `(close - prev_close) / prev_close × 100` | Measures day-over-day VIX change |
| `intraday_range` | `high - low` | Measures daily uncertainty spread |
| `rolling_30` | 30-day rolling mean of close | Smoothed trend line |
| `zone` | Rule-based classification | Categorises fear level |

### VIX Fear Zones (Industry Standard Thresholds)

| Zone | VIX Range | Market Meaning |
|------|-----------|---------------|
| 🟢 Calm | < 15 | Low fear, bullish sentiment |
| 🟡 Moderate | 15 – 25 | Normal market conditions |
| 🟠 High Fear | 25 – 40 | Elevated fear, caution advised |
| 🔴 Panic | > 40 | Extreme fear — crisis mode |

---

## 🗄️ SQL Analysis

Five analytical queries were written and executed in MySQL:

1. **Yearly Fear Summary** — avg VIX, peak VIX, volatility per year
2. **Monthly Seasonality** — which months historically show highest fear
3. **Panic Days** — all trading days where VIX exceeded 40
4. **Top 10 Fear Spikes** — biggest single-day VIX jumps
5. **Zone Distribution** — % of time market spent in each fear zone

---

## 📈 Visualisations

| Chart | Insight |
|-------|---------|
| VIX History with Fear Zones | Full 12-year fear timeline with zone overlays |
| Monthly Heatmap | Seasonality — fear patterns by month and year |
| Yearly Average Bar Chart | Year-by-year fear comparison |
| Daily Return Distribution | Return behaviour, skewness, fat tails |
| Intraday Range Over Time | Daily uncertainty with 30-day rolling average |

---

## 💼 Business Recommendations

**1. March 2020 was the peak panic event**
VIX hit 83.6 during COVID-19 — its highest ever recorded value. Historically, VIX spikes above 50 have been followed by strong market recoveries, making them the best long-term buying opportunities for patient investors.

**2. Market spends most time in Calm/Moderate zones**
The majority of trading days fall below VIX 25, confirming India as a structurally stable long-term market. SIP investors should not react to short-term fear spikes.

**3. March and October show historically elevated fear**
Seasonality analysis reveals these months consistently carry higher VIX. Investors should expect volatility but not exit — historically these months offer cheaper equity entry points.

**4. Low VIX signals complacency, not safety**
VIX below 12 has historically preceded corrections. Avoid large lump-sum investments when markets appear "too calm."

**5. VIX above 25 = accumulation opportunity**
Every time VIX crossed 25, Nifty 50 offered attractive entry points for investors with a 1–3 year horizon. Systematic investing during high-VIX periods consistently outperforms lump-sum investing at low-VIX levels.

---

## 🚀 Future Scope

This project will be extended with machine learning after gaining proficiency in supervised learning and time series forecasting. Planned additions include VIX level prediction using Random Forest and LSTM models, trading strategy backtesting using historical signals, and a live Streamlit dashboard deployable on the web.

---

## ▶️ How to Run

**1. Install dependencies:**
```bash
pip install -r requirements.txt
```

**2. Set up MySQL:**
```sql
-- Run sql/schema.sql in MySQL Workbench first
```

**3. Run notebooks in order:**
```
01_data_cleaning.ipynb        ← run first
02_eda_analysis.ipynb         ← run second
04_business_recommendations.ipynb
```

> ⚠️ Update the MySQL password in `01_data_cleaning.ipynb` with your own credentials before running.

---

## 📦 Requirements

```
pandas
matplotlib
seaborn
sqlalchemy
pymysql
openpyxl
```
