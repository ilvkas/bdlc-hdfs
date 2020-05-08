# 2020-05, ilvkas, https://github.com/ilvkas

export covid_data_api=https://opendata.ecdc.europa.eu/covid19/casedistribution/json/

function hive_cli {
  if [ -n "${JDBC_HIVE2_URL}" ]; then
    beeline -n "${USER}" -u "${JDBC_HIVE2_URL}" "$@"
  else
    hive "$@"
  fi
}

set -xv
