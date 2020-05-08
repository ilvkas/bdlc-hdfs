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
echo "pushing data to hdfs"
hdfs dfs -put -f stock/CHFJPY.txt /user/${USER}/pro/
hdfs dfs -put -f stock/EURCHF.txt /user/${USER}/pro/
hdfs dfs -put -f stock/GBPCHF.txt /user/${USER}/pro/
hdfs dfs -put -f stock/USDCHF.txt /user/${USER}/pro/

pause 'Press [Enter] key to continue: fetch covid data'