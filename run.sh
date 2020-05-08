# 2020-05, ilvkas, https://github.com/ilvkas

## ##################################################
## set config
cd $(dirname $0)
source ./config.sh

## ##################################################
## pause funktion
function pause(){
	read -p "$*"
}

## ##################################################
## prepare the data (Stock Market)
./data-prepare.sh

## ##################################################
## prepare the data (Stock Market)
./data-push2hdfs.sh

## ##################################################
## fetch covid data
./covid-fetch.sh

## ##################################################
## ddl
# hive_cli -f create.sql



