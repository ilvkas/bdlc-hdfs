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
## check and/or create local directories
echo "Create local directories"
test -d ./data || mkdir ./data

pause 'Press [Enter] key to continue: get covid data'

## ##################################################
## get data
echo "Get the COVID-19 JSON Data"
# curl -sSLG "$(covid_data_api)" > data/covid_unsorted.json
curl -sSLG "${covid_data_api}" | jq -c ' .records | . []' > data/covid_data.json

pause 'Press [Enter] key to continue: convert and etl covid data'
