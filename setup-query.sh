TARGET_FILE=/etc/mysql/mysql.conf.d/mysql.conf

sudo echo "slow_query_log = 1" >> $TARGET_FILE
sudo echo "slow_query_log_file = /var/log/mysql/mysql-slow.log" >> $TARGET_FILE
sudo echo "long_query_time = 0" >> $TARGET_FILE

sudo chmod 777 /var/log/mysql/
/var/log/mysql/