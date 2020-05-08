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

!!!!!!!!!!!

<TICKER>,<DTYYYYMMDD>,<TIME>,<OPEN>,<HIGH>,<LOW>,<CLOSE>,<VOL>
CHFJPY,20010102,230100,71.55,71.55,71.55,71.55,4

!!!!!!!!!!!!!!!!
-- --------------------------------------------------
-- DDL src_* Tables
CREATE TABLE IF NOT EXISTS src_cities_json
  (
      city_record STRING
  )
  COMMENT 'https://api.openaq.org/v1/cities'
  STORED AS TEXTFILE
  -- location '/user/bd01/demo/etl/openaq_org_api/src_cities_json'
;

CREATE TABLE IF NOT EXISTS src_latest_location_json
  (
      latest_record STRING
  )
  COMMENT 'https://api.openaq.org/v1/latest'
  STORED AS TEXTFILE
  -- location '/user/bd01/demo/etl/openaq_org_api/src_latest_location_json'
;

CREATE TABLE IF NOT EXISTS src_latest_measurements_json
  (
      latest_record STRING
  )
  COMMENT 'https://api.openaq.org/v1/latest'
  STORED AS TEXTFILE
  -- location '/user/bd01/demo/etl/openaq_org_api/src_latest_measurements_json'
;


-- --------------------------------------------------
-- DDL src_* Views
DROP VIEW IF EXISTS src_cities;
DROP VIEW IF EXISTS src_latest_location;
DROP VIEW IF EXISTS src_latest_measurements;

-- so viele get_json_object aufrufe sind nich sonderlich effizient
-- aber die datenmenge ist überschaubar
-- die views werden materialisiert (siehe unten)
CREATE VIEW IF NOT EXISTS src_cities AS
  SELECT
      get_json_object(city_record, '$.city')      AS city
    , get_json_object(city_record, '$.country')   AS country
    , get_json_object(city_record, '$.locations') AS locations
    , get_json_object(city_record, '$.count')     AS count
    FROM src_cities_json
;

CREATE VIEW IF NOT EXISTS src_latest_location AS
  SELECT
      get_json_object(latest_record, '$.location')               AS location
    , get_json_object(latest_record, '$.city')                   AS city
    , get_json_object(latest_record, '$.country')                AS country
    , get_json_object(latest_record, '$.distance')               AS distance
    , get_json_object(latest_record, '$.coordinates.latitude')   AS latitude
    , get_json_object(latest_record, '$.coordinates.longitude')  AS longitude
    FROM src_latest_location_json
;

CREATE VIEW IF NOT EXISTS src_latest_measurements AS
  SELECT
      get_json_object(latest_record, '$.location')                            AS location
    , get_json_object(latest_record, '$.measurements.parameter')              AS parameter
    , get_json_object(latest_record, '$.measurements.value')                  AS value
    , get_json_object(latest_record, '$.measurements.lastUpdated')            AS lastUpdated
    , get_json_object(latest_record, '$.measurements.unit')                   AS unit
    , get_json_object(latest_record, '$.measurements.sourceName')             AS sourceName
    , get_json_object(latest_record, '$.measurements.averagingPeriod.value')  AS averagingPeriodValue
    , get_json_object(latest_record, '$.measurements.averagingPeriod.unit')   AS averagingPeriodUnit
    FROM src_latest_measurements_json
;


DROP VIEW IF EXISTS src_latest;
-- nicht zu empfehlen
CREATE VIEW IF NOT EXISTS src_latest AS
  SELECT
      l.location
    , l.city
    , l.country
    , l.distance
    , l.latitude
    , l.longitude
    , m.parameter
    , m.value
    , m.lastUpdated
    , m.unit
    , m.sourceName
    , m.averagingPeriodValue
    , m.averagingPeriodUnit
    FROM src_latest_location l JOIN src_latest_measurements m ON (l.location = m.location)
;


-- --------------------------------------------------
-- DDL core / main / ...
-- DROP => data loss
# this table shall grow ...

CREATE TABLE measurements
  (
      location_parameter   string
    , location             string
    , city                 string
    , country              string
    , distance             string
    , latitude             string
    , longitude            string
    , parameter            string
    , value                string
    , lastUpdated          string
    , unit                 string
    , sourceName           string
    , averagingPeriodValue string
    , averagingPeriodUnit  string
  )
  COMMENT 'Source: https://api.openaq.org'
  ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
  STORED AS TEXTFILE
;


-- --------------------------------------------------
-- high water marks
CREATE TABLE hwm_location_parameter
  (
      location_parameter   string
    , lastUpdated          string
  )
  COMMENT 'max lastUpdated per location/parameter'
  -- CLUSTERED BY (location_parameter) INTO 1 BUCKETS
  -- STORED AS ORC
  -- TBLPROPERTIES('transactional'='true')
;


-- --------------------------------------------------
-- show infos
show tables;

DESCRIBE hwm_location_parameter        ;  
DESCRIBE measurements                  ;  
DESCRIBE src_cities                    ;  
DESCRIBE src_cities_json               ;  
DESCRIBE src_latest                    ;  
DESCRIBE src_latest_location           ;  
DESCRIBE src_latest_location_json      ;  
DESCRIBE src_latest_measurements       ;  
DESCRIBE src_latest_measurements_json  ;  

DESCRIBE FORMATTED measurements;  
