-- --------------------------------------------------
-- USE Table
use bdlc_data_pro;

-- --------------------------------------------------
-- LOAD Data into tables
load data inpath '/user/zeppelin/pro/covid_data.json' into table covid_19_json;
load data inpath '/user/zeppelin/pro/USDCHF.txt' into table src_usdchf_txt;
load data inpath '/user/zeppelin/pro/GBPCHF.txt' into table src_gbpchf_txt;
load data inpath '/user/zeppelin/pro/EURCHF.txt' into table src_eurchf_txt;
load data inpath '/user/zeppelin/pro/CHFJPY.txt' into table src_chfjpy_txt;

-- --------------------------------------------------
-- CREATE VIEW
DROP VIEW IF EXISTS covid_split;
CREATE VIEW IF NOT EXISTS covid_split AS
SELECT
get_json_object(data, '$.dateRep') AS Datum,
get_json_object(data, '$.day') AS Tag,
get_json_object(data, '$.month') AS Monat,
get_json_object(data, '$.year') AS Jahr,
get_json_object(data, '$.cases') AS Faelle,
get_json_object(data, '$.deaths') AS Tote,
get_json_object(data, '$.countriesAndTerritories') AS Land,
get_json_object(data, '$.geoId') AS LandID,
get_json_object(data, '$.countryterritoryCode') AS LandCode,
get_json_object(data, '$.popData2018') AS Population,
get_json_object(data, '$.continentExp') AS Kontinent
FROM covid_19_json;

-- --------------------------------------------------
-- show infos
-- show tables;
-- 
-- DESCRIBE covid_data;  
-- DESCRIBE covid_test;
-- DESCRIBE src_chfjpy_txt;
-- DESCRIBE src_eurchf_txt;  
-- DESCRIBE src_gbpchf_txt;  
-- DESCRIBE src_usdchf_txt;  
-- 
-- DESCRIBE FORMATTED measurements;  

