-- --------------------------------------------------
-- 2020-05, ilvkas, https://github.com/ilvkas

CREATE DATABASE IF NOT EXISTS bdlc_data_pro;
use bdlc_data_pro;
show tables;

-- --------------------------------------------------
-- tabula rasa for src_* tables
DROP TABLE IF EXISTS bdlc_data_pro.src_chfjpy_txt;
DROP TABLE IF EXISTS bdlc_data_pro.src_eurchf_txt;
DROP TABLE IF EXISTS bdlc_data_pro.src_gbpchf_txt;
DROP TABLE IF EXISTS bdlc_data_pro.src_usdchf_txt;
DROP TABLE IF EXISTS bdlc_data_pro.covid_19_json;

-- --------------------------------------------------
-- DDL src_* Tables
CREATE TABLE src_chfjpy_txt (Ticker STRING,Datum TIMESTAMP,Open FLOAT,High FLOAT,Low FLOAT,Close FLOAT)
COMMENT 'CHF-JPY Market'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE src_eurchf_txt (Ticker STRING,Datum TIMESTAMP,Open FLOAT,High FLOAT,Low FLOAT,Close FLOAT)
COMMENT 'EUR-CHF Market'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE src_gbpchf_txt (Ticker STRING,Datum TIMESTAMP,Open FLOAT,High FLOAT,Low FLOAT,Close FLOAT)
COMMENT 'GBP-CHF Market'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE src_usdchf_txt (Ticker STRING,Datum TIMESTAMP,Open FLOAT,High FLOAT,Low FLOAT,Close FLOAT)
COMMENT 'USD-CHF Market'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS covid_19_json (data STRING)
COMMENT 'COVID 19 JSON DATA'
STORED AS TEXTFILE;