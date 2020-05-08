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

pause 'Press [Enter] key to continue: create hdfs directories'

## ##################################################
## create hdfs directories
echo "creating HDFS Directories"
hdfs dfs -mkdir -p /user/${USER}/pro/
hdfs dfs -mkdir -p /user/${USER}/pro/etl/

pause 'Press [Enter] key to continue: prepare data'

## ##################################################
## unzip files
echo "prepare data (stock)"
cd stock/
unzip CHFJPY.zip
unzip EURCHF.zip
unzip GBPCHF.zip
unzip USDCHF.zip

pause 'Press [Enter] key to continue: cleaning up data'

## ##################################################
## clean up
echo "cleaning up (stock)"
mkdir orig
mv CHFJPY.zip EURCHF.zip GBPCHF.zip USDCHF.zip orig/

pause 'Press [Enter] key to continue: clear first line of txt'

## ##################################################
## clear first line
tail -n +2 CHFJPY.txt > CHFJPY2.txt
tail -n +2 EURCHF.txt > EURCHF2.txt
tail -n +2 GBPCHF.txt > GBPCHF2.txt
tail -n +2 USDCHF.txt > USDCHF2.txt

mv CHFJPY2.txt CHFJPY.txt
mv EURCHF2.txt EURCHF.txt
mv GBPCHF2.txt GBPCHF.txt
mv USDCHF2.txt USDCHF.txt

pause 'Press [Enter] key to continue: push data to hdfs'

