#!/bin/bash
read -t 10 -p "input your name" name
if [ -z $name ]
then
	echo 'no read'
fi
echo $name
