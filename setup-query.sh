TARGET_FILE=/etc/mysql/mysql.conf.d/mysqld.cnf
EDIT_FILE=./edit/mysqld.cnf
BACKUP_FILE=./backup/mysqld.cnf.original
EDITED_FILE=./edited/mysqld.cnf
sudo chmod 777 /var/log/mysql/
sudo chmod 777 $TARGET_FILE
if [ -e $TARGET_FILE ]; then
    if [ ! -e $BACKUP_FILE ]; then #バックアップがない時に新規で作業
        sudo cp $TARGET_FILE $BACKUP_FILE
        sudo cp $TARGET_FILE $EDIT_FILE
    fi
    if [ -e $BACKUP_FILE ]; then #バックアップがあれば初期段階が確約されるためこれを参照する
        sudo cp $BACKUP_FILE $EDIT_FILE
    fi
    sudo chmod 777 $EDIT_FILE
    sudo chmod 777 $BACKUP_FILE
    if [ -e /var/log/mysql/mysql-slow.log ]; then
        rm -rf /var/log/mysql/mysql-slow.log
    fi
    sudo echo "slow_query_log = 1" >> $EDIT_FILE
    sudo echo "slow_query_log_file = /var/log/mysql/mysql-slow.log" >> $EDIT_FILE
    sudo echo "long_query_time = 0" >> $EDIT_FILE

    sudo cp $EDIT_FILE $TARGET_FILE
    sudo cp $EDIT_FILE $EDITED_FILE
    sudo chmod 644 $EDITED_FILE
    sudo chmod 644 $TARGET_FILE
    sudo rm -rf $EDIT_FILE
fi

if [ ! -e $TARGET_FILE ]; then
echo $TARGET_FILE" no exist."
fi

sudo service mysql restart # serve-restart
sudo chmod 777 /var/log/mysql/mysql-slow.log
if [ ! -e 3.0.5-test.tar.gz ]; then
wget https://github.com/percona/percona-toolkit/archive/3.0.5-test.tar.gz
tar zxvf 3.0.5-test.tar.gz
sudo mv ./percona-toolkit-3.0.5-test/bin/pt-query-digest /usr/local/bin/pt-query-digest
fi
# /var/log/mysql/

echo "query-digester"

git clone https://github.com/kazeburo/query-digester.git
cd query-digester
sudo install query-digester /usr/local/bin
cd ..

echo "setup pt-query-digest."
