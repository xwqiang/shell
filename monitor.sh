#!/bin/sh
datetime=$(date +'%Y%m%d')
result=`curl -s 'http://oa.kuyun.com/oaapi/getUserAudits?userId=246&processId=17' | jq '."result-code"'`
if [[ $result = \"0\" ]] ; then
	echo "审批接口正常 ${datetime}" >> /tmp/default/info
else
	echo 'Hi xuwuqiang and baoming 审批接口数据异常 ,pls check if oa is running ok ![message from 192.168.200.22 crontab]' > /tmp/default/oa
	mailx -s "审批接口异常[ from 192.168.200.22 crontab ]" bao.ming@kuyun.com </tmp/default/oa
	mailx -s "审批接口异常[ from 192.168.200.22 crontab ]" xu.wuqiang@kuyun.com </tmp/default/oa
fi
