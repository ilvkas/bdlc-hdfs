## bdlc-project

### Requirements
```
You have done the following:
https://github.com/it-gro/lxd-ub18-hdp-ambari
```

### Start
```
lxc shell cl-hpelc1-50-gw-01-lx-ub18
apt-get install jq
su -l bd01
cd ~/repos
git clone https://github.com/ilvkas/bdlc-hdfs
```

### Run
```
lxc shell cl-hpelc1-50-gw-01-lx-ub18
su -l bd01
cd ~/repos
cd bdlc-hdfs/
./run.sh
```
#### Run without SQL
```
./run_wo_sql.sh
```
