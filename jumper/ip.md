#alias0        ip        port           user         mark         cmd 
bj101|172.21.62.101|33355|xuwuqiang|北京101|
bj209|172.21.19.209|33355|xuwuqiang|北京209|
oa|192.168.200.22|33355|xuwuqiang|oa|
tongji|172.21.19.210|33355|xuwuqiang|北京210|cd /ky/data/tvstat/log/socket-business_fmt 

valle|192.168.200.138|33355|xuwuqiang|valle|


101cards|172.21.62.101|33355|xuwuqiang|北京101卡片部署|cd /ky/deploy/cards;sh cards.deploy.sh
101socket|172.21.62.101|33355|xuwuqiang|北京101socket日志|cd /ky/data/socket-business/logs
tongji|172.21.19.210|33355|xuwuqiang|北京210|cd /ky/data/tvstat/log/socket-business_fmt 
hive|172.21.19.210|33355|xuwuqiang|北京210|sh /ky/shark/shark-0.8.0-bin-hadoop1/shark-0.8.0/bin/shark -h localhost -p 9527
kytvtongji|172.21.19.210|33355|xuwuqiang|北京210|cd /usr/home/service/workspace/kytv_tongji/
redis|172.21.19.203|33355|xuwuqiang|redis测试|cd /usr/local/bin/; ./redis-cli 
