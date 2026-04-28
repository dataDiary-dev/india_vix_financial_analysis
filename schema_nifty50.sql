CREATE DATABASE IF NOT EXISTS nifty_analysis;
USE nifty_analysis;

CREATE TABLE IF NOT EXISTS india_vix (
    id             INT AUTO_INCREMENT PRIMARY KEY,
    trade_date     DATE NOT NULL UNIQUE,
    open_price     DECIMAL(8, 4),
    high_price     DECIMAL(8, 4),
    low_price      DECIMAL(8, 4),
    close_price    DECIMAL(8, 4),
    prev_close     DECIMAL(8, 4),
    daily_return   DECIMAL(8, 4),
    intraday_range DECIMAL(8, 4),
    rolling_30     DECIMAL(8, 4),
    zone           VARCHAR(20)
);

