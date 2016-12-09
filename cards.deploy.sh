#!/bin/sh
cd /ky/deploy/cards
git fetch origin dev
git reset --hard origin/dev 
mvn package -Pbeta 
mv target/*.war /ky/cards_repo/cards/cardsPerm
cd  /ky/cards_repo/cards/cardsPerm
rm -r `ls | grep -v ".war"`
jar xf *.war 
ls -al /ky/htdocs_ntvadmin/cards >> /ky/deploy/deploy.log
rm /ky/htdocs_ntvadmin/cards
ln -s /ky/cards_repo/cards/cardsPerm /ky/htdocs_ntvadmin/cards
cd /usr/local/tomcat7088_ntvadmin/bin/
./shutdown.sh
./startup.sh
 

