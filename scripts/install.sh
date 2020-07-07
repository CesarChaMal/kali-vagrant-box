#!/bin/bash

# remove comment if you want to enable debugging
set -x

apt update && apt -y full-upgrade && apt auto-remove && apt auto-clean
apt-get -y install ruby &&
apt-get -y install metasploit-framework &&
apt-get -y install systemd &&
apt-get -y install lsof &&
apt-get -y install vim

cp /usr/bin/msfdb /usr/bin/msfdb.bak
cp /usr/bin/msfdb.bak /usr/bin/msfdb
ls -ltra /usr/bin/msfdb*

grep -ril 'systemctl status \${PG_SERVICE}' /usr/bin/msfdb | xargs sed -i -e "s/systemctl status \${PG_SERVICE}/\/etc\/init.d\/\${PG_SERVICE} status/g"
grep -ril 'systemctl --no-pager -l status \${PG_SERVICE}' /usr/bin/msfdb | xargs sed -i -e "s/systemctl --no-pager -l status \${PG_SERVICE}/\/etc\/init.d\/\${PG_SERVICE} status/g"
grep -ril 'systemctl stop \${PG_SERVICE}' /usr/bin/msfdb | xargs sed -i -e "s/systemctl stop \${PG_SERVICE}/\/etc\/init.d\/\${PG_SERVICE} stop/g"
grep -ril 'systemctl start \${PG_SERVICE}' /usr/bin/msfdb | xargs sed -i -e "s/systemctl start \${PG_SERVICE}/\/etc\/init.d\/\${PG_SERVICE} start/g"
msfdb init 
msfdb run

systemctl --no-pager -l status postgresql

