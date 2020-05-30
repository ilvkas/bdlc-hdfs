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
test -e stock/CHFJPY.txt.bz2 || bzip2 -c stock/CHFJPY.txt > stock/CHFJPY.txt.bz2
chmod 755 stock/CHFJPY.txt.bz2
test -e stock/EURCHF.txt.bz2 || bzip2 -c stock/EURCHF.txt > stock/EURCHF.txt.bz2
chmod 755 stock/EURCHF.txt.bz2
test -e stock/GBPCHF.txt.bz2 || bzip2 -c stock/GBPCHF.txt > stock/GBPCHF.txt.bz2
chmod 755 stock/GBPCHF.txt.bz2
test -e stock/USDCHF.txt.bz2 || bzip2 -c stock/USDCHF.txt > stock/USDCHF.txt.bz2
chmod 755 stock/USDCHF.txt.bz2

pause 'Press [Enter] key to continue: push final data to hdfs'

## ##################################################
## push files to hdfs
echo "pushing data to hdfs"
hdfs dfs -put -f stock/CHFJPY.txt /user/zeppelin/pro/
hdfs dfs -put -f stock/CHFJPY.txt.bz2 /user/zeppelin/pro/
hdfs dfs -put -f stock/EURCHF.txt /user/zeppelin/pro/
hdfs dfs -put -f stock/EURCHF.txt.bz2 /user/zeppelin/pro/
hdfs dfs -put -f stock/GBPCHF.txt /user/zeppelin/pro/
hdfs dfs -put -f stock/GBPCHF.txt.bz2 /user/zeppelin/pro/
hdfs dfs -put -f stock/USDCHF.txt /user/zeppelin/pro/
hdfs dfs -put -f stock/USDCHF.txt.bz2 /user/zeppelin/pro/