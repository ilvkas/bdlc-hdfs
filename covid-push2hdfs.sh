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
## push files to hdfs
echo "pushing covid data to hdfs"
hdfs dfs -put -f data/covid_data.json /user/${USER}/pro/

pause 'Press [Enter] key to continue: sql statements'