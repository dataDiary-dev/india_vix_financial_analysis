-- ================================================================
-- PROJECT  : India VIX Financial Analysis (2009–2021)
-- FILE     : queries.sql
-- PURPOSE  : All analytical SQL queries for the project
-- DATABASE : nifty_analysis
-- ================================================================

USE nifty_analysis;

-- ----------------------------------------------------------------
-- QUERY 1 : Yearly Fear Summary
-- PURPOSE : Understand how market fear evolved year over year
-- ----------------------------------------------------------------
SELECT
    YEAR(trade_date)            AS year,
    ROUND(AVG(close_price), 2)  AS avg_vix,
    ROUND(MAX(high_price), 2)   AS peak_vix,
    ROUND(MIN(low_price), 2)    AS lowest_vix,
    ROUND(STD(close_price), 4)  AS volatility
FROM india_vix
GROUP BY YEAR(trade_date)
ORDER BY year;


-- ----------------------------------------------------------------
-- QUERY 2 : Monthly Seasonality
-- PURPOSE : Identify which months historically show highest fear
-- ----------------------------------------------------------------
SELECT
    MONTH(trade_date)           AS month_num,
    MONTHNAME(trade_date)       AS month_name,
    ROUND(AVG(close_price), 2)  AS avg_vix
FROM india_vix
GROUP BY MONTH(trade_date), MONTHNAME(trade_date)
ORDER BY month_num;


-- ----------------------------------------------------------------
-- QUERY 3 : Panic Days (VIX > 40)
-- PURPOSE : Isolate extreme fear events for event analysis
-- ----------------------------------------------------------------
SELECT trade_date, close_price, daily_return
FROM india_vix
WHERE close_price > 40
ORDER BY close_price DESC;


-- ----------------------------------------------------------------
-- QUERY 4 : Top 10 Biggest Single Day Fear Spikes
-- PURPOSE : Find days with the sharpest VIX jumps
-- ----------------------------------------------------------------
SELECT trade_date, close_price, daily_return
FROM india_vix
ORDER BY daily_return DESC
LIMIT 10;


-- ----------------------------------------------------------------
-- QUERY 5 : Zone Distribution
-- PURPOSE : What % of time was market calm vs fearful?
-- ----------------------------------------------------------------
SELECT
    zone,
    COUNT(*)                                                        AS days,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM india_vix), 1)  AS pct
FROM india_vix
GROUP BY zone
ORDER BY days DESC;
