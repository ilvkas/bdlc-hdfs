-- --------------------------------------------------
-- 2020-05, ilvkas, https://github.com/ilvkas

CREATE DATABASE IF NOT EXISTS bdlc_data_pro;
use bdlc_data_pro;
show tables;

-- --------------------------------------------------
-- tabula rasa for src_* tables
DROP TABLE IF EXISTS bdlc_data_pro.covid_19_json;

-- --------------------------------------------------
-- DDL src_* Tables
CREATE TABLE IF NOT EXISTS covid_19_json (data STRING)
COMMENT 'COVID 19 JSON DATA'
STORED AS TEXTFILE;