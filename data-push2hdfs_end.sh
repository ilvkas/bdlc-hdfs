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
## create folder in userhome zeppelin
if ! hdfs dfs -test -d /user/zeppelin/pro/; then hdfs dfs -mkdir /user/zeppelin/pro/; fi

## ##################################################
## push files to hdfs
echo "pushing data to hdfs"
hdfs dfs -put -f stock/CHFJPY.txt.bz2 /user/zeppelin/pro/
hdfs dfs -put -f stock/EURCHF.txt.bz2 /user/zeppelin/pro/
hdfs dfs -put -f stock/GBPCHF.txt.bz2 /user/zeppelin/pro/
hdfs dfs -put -f stock/USDCHF.txt.bz2 /user/zeppelin/pro/
cp ../../../zeppelin/covid_data_2.json covid_data.json
chmod 755 covid_data.json
hdfs dfs -put -f covid_data.json /user/zeppelin/pro/