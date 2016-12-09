#!/bin/bash
min_heap_size="50m"
max_heap_size="100m"
home=$PWD
cpath=$CLASSPATH:../classes/:$home
for file in ../lib/*.jar;
do
        cpath=$cpath:$file
	done;
	export CLASSPATH=$cpath
	echo $CLASSPATH
	nohup java -Xms$min_heap_size -Xmx$max_heap_size -XX:PermSize=128m -Xloggc:log/gc.log -XX:+PrintGCTimeStamps -XX:-PrintGCDetails -cp $CLASSPATH com.kuyun.oa.job.SynchronousClockDataJob  $@>> nohup.out  &
