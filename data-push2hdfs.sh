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
hdfs dfs -put -f stock/CHFJPY.txt /user/zeppelin/pro/
hdfs dfs -put -f stock/EURCHF.txt /user/zeppelin/pro/
hdfs dfs -put -f stock/GBPCHF.txt /user/zeppelin/pro/
hdfs dfs -put -f stock/USDCHF.txt /user/zeppelin/pro/