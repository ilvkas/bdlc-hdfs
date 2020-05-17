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
## fetch covid data
./covid-push2hdfs.sh

## ##################################################
## create DB & Tables
hive_cli -f create.sql
pause 'Press [Enter] key to continue: load data into tables'

## ##################################################
## load data into tables
hive_cli -f load_data.sql
pause 'Press [Enter] key to continue: end script'

