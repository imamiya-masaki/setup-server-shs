TARGET_FILE=/etc/mysql/mysql.conf.d/mysqld.cnf
EDIT_FILE=./backup/mysqld.cnf
BACKUP_FILE=./backup/mysqld.cnf.backup
EDITED_FILE=./edited/mysqld.cnf
sudo chmod 777 /var/log/mysql/
sudo chmod 777 $TARGET_FILE
if [ -e $TARGET_FILE ]; then
sudo cp $TARGET_FILE $BACKUP_FILE
sudo cp $TARGET_FILE $EDIT_FILE
sudo chmod 777 $EDIT_FILE
sudo chmod 777 $BACKUP_FILE
sudo echo "slow_query_log = 1" >> $EDIT_FILE
sudo echo "slow_query_log_file = /var/log/mysql/mysql-slow.log" >> $EDIT_FILE
sudo echo "long_query_time = 0" >> $EDIT_FILE

sudo cp $EDIT_FILE $TARGET_FILE
sudo cp $EDIT_FILE $EDITED_FILE
sudo chmod 777 $EDITED_FILE
sudo rm -rf $EDIT_FILE
fi

if [ ! -e $TARGET_FILE ]; then
echo $TARGET_FILE" no exist."
fi

sudo service mysql restart # serve-restart
sudo chmod /var/log/mysql/mysql-slow.log
if [ ! -e 3.0.5-test.tar.gz ]; then
wget https://github.com/percona/percona-toolkit/archive/3.0.5-test.tar.gz
tar zxvf 3.0.5-test.tar.gz
sudo mv ./percona-toolkit-3.0.5-test/bin/pt-query-digest /usr/local/bin/pt-query-digest
fi
# /var/log/mysql/

echo "setup pt-query-digest."
