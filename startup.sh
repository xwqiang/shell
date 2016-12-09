#!/bin/sh
#./etc/profile
home=$PWD
cpath=$CLASSPATH:../classes/
for file in ../lib/*.jar;
do
        cpath=$cpath:$file
done;
export CLASSPATH=$cpath
echo $CLASSPATH
nohup java -Xms512m -Xmx4096m -Xss512K -Xoss512M -server -Dsun.net.client.defaultConnectTimeout=120000 -Dsun.net.client.defaultReadTimeout=240000 -Djava.awt.headless=true com.kuyun.monitor.SendAdMonitorJob > ad_monitor.log 2>&1 &
