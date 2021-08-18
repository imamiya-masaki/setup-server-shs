TARGET_FILE=/etc/mysql/mysql.conf.d/mysql.conf
sudo chmod 777 /var/log/mysql/
sudo echo "slow_query_log = 1" >> $TARGET_FILE
sudo echo "slow_query_log_file = /var/log/mysql/mysql-slow.log" >> $TARGET_FILE
sudo echo "long_query_time = 0" >> $TARGET_FILE

sudo service mysql restart # serve-restart

if [ ! -e 3.0.5-test.tar.gz ]; then
wget https://github.com/percona/percona-toolkit/archive/3.0.5-test.tar.gz
tar zxvf 3.0.5-test.tar.gz
sudo mv ./percona-toolkit-3.0.5-test/bin/pt-query-digest /usr/local/bin/pt-query-digest
fi
# /var/log/mysql/
