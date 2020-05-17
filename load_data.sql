-- --------------------------------------------------
-- USE Table
use bdlc_pro_data;

-- --------------------------------------------------
-- LOAD Data into tables
load data inpath '/user/bd01/pro/covid_data.json' into table covid_data;
load data inpath '/user/bd01/pro/USDCHF.txt' into table src_chfjpy_txt;
load data inpath '/user/bd01/pro/GBPCHF.txt' into table src_eurchf_txt;
load data inpath '/user/bd01/pro/EURCHF.txt' into table src_gbpchf_txt;
load data inpath '/user/bd01/pro/CHFJPY.txt' into table src_usdchf_txt;

-- --------------------------------------------------
-- CREATE VIEW
DROP VIEW IF EXISTS covid_test;
CREATE VIEW IF NOT EXISTS covid_test AS
SELECT
get_json_object(test, '$.dateRep') AS Datum,
get_json_object(test, '$.day') AS Tag,
get_json_object(test, '$.month') AS Monat,
get_json_object(test, '$.year') AS Jahr,
get_json_object(test, '$.cases') AS Faelle,
get_json_object(test, '$.deaths') AS Tote,
get_json_object(test, '$.countriesAndTerritories') AS Land,
get_json_object(test, '$.geoId') AS LandID,
get_json_object(test, '$.countryterritoryCode') AS LandCode,
get_json_object(test, '$.popData2018') AS Population,
get_json_object(test, '$.continentExp') AS Kontinent
FROM covid_data;

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

