#!/bin/sh
datetime=$(date +'%Y%m%d')
today=$(date +'%Y-%m-%d')
#xuwuqiang
cat "/data0/ky/kaoqin/${datetime}.txt" |grep 206| grep $today
retval=$?
if [[ $retval -eq 0 ]]; then
#不发邮件
        echo "no need to send to xuwuqiang ${datetime}" >> /tmp/default/info
else
#发邮件
        echo 'Hi xuwuqiang,no clock record generated today ,pls check if oa is running ok !' > /tmp/default/default
        mailx -s "没有打卡数据" xu.wuqiang@kuyun.com </tmp/default/default
fi

#baoming
cat "/data0/ky/kaoqin/${datetime}.txt" |grep 316| grep $today
retval=$?
if [[ $retval -eq 0 ]]; then
#不发邮件
        echo "no need to send to boming ${datetime}" >> /tmp/default/info
else
#发邮件
        echo 'Hi baoming,no clock record generated today ,pls check if oa is running ok !' > /tmp/default/default
        mailx -s "没有打卡数据" bao.ming@kuyun.com </tmp/default/default
fi
