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

### First run
```
lxc shell cl-hpelc1-50-gw-01-lx-ub18
su -l bd01
cd ~/repos
cd bdlc-hdfs/
./run.sh
```

NOT DONE YET:
!!!!!!!!!!!!!!
### Run again

```
./process.sh
```


### Run by schedule

```
crontab -l
nano crontab
crontab crontab
crontab -l
```

### Stop schedule

```
crontab -l
crontab -r
crontab -l
```

### Remove example

```
./remove.sh
```
!!!!!!!!!!!!!!