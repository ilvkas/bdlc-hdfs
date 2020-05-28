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
## Change Format of TXT for correct datetime
echo "Change CHFJPY.txt"
cd stock/
cat CHFJPY2.txt | sed 's/./&-/11;s/./&-/14;s/./&:/20;s/./&:/23' | awk -F, '{print $1","$2","$4","$5","$6","$7}' > CHFJPY.txt
pause 'Press [Enter] key to continue: change EURCHF'
cat EURCHF2.txt | sed 's/./&-/11;s/./&-/14;s/./&:/20;s/./&:/23' | awk -F, '{print $1","$2","$4","$5","$6","$7}' > EURCHF.txt
pause 'Press [Enter] key to continue: change GBPCHF'
cat GBPCHF2.txt | sed 's/./&-/11;s/./&-/14;s/./&:/20;s/./&:/23' | awk -F, '{print $1","$2","$4","$5","$6","$7}' > GBPCHF.txt
pause 'Press [Enter] key to continue: change USDCHF'
cat USDCHF2.txt | sed 's/./&-/11;s/./&-/14;s/./&:/20;s/./&:/23' | awk -F, '{print $1","$2","$4","$5","$6","$7}' > USDCHF.txt

pause 'Press [Enter] key to continue: change file permissions'

## ##################################################
## Change file permissions
chmod 755 CHFJPY.txt
chmod 755 EURCHF.txt
chmod 755 GBPCHF.txt
chmod 755 USDCHF.txt

pause 'Press [Enter] key to continue: push data to hdfs'