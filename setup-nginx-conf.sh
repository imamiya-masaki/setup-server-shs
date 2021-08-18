# nginxファイル作成
BAK_FILE_NAME=memo_nginx.txt #上書きする用ファイル　名前はかぶらなければなんでも良い
TO_FILE=/etc/nginx/nginx.conf #目的のファイル
BAKUP_PATH=./backup #一応バックアップする
EDITED_FILE=./edited/nginx.conf #エディット先も保存
if [ -e $BAK_FILE_NAME ]; then
sudo rm -rf $BAK_FILE_NAME
fi

sudo echo "user  www-data;" >> $BAK_FILE_NAME
sudo echo "worker_processes  auto;" >> $BAK_FILE_NAME
sudo echo "" >> $BAK_FILE_NAME
sudo echo "error_log  /var/log/nginx/error_test.log;" >> $BAK_FILE_NAME
sudo echo "pid        /run/nginx.pid;" >> $BAK_FILE_NAME
sudo echo "" >> $BAK_FILE_NAME
sudo echo "" >> $BAK_FILE_NAME
sudo echo "events {" >> $BAK_FILE_NAME
sudo echo "    worker_connections  1024;" >> $BAK_FILE_NAME
sudo echo "}" >> $BAK_FILE_NAME
sudo echo "" >> $BAK_FILE_NAME
sudo echo "" >> $BAK_FILE_NAME
sudo echo "http {" >> $BAK_FILE_NAME
sudo echo "    include       /etc/nginx/mime.types;" >> $BAK_FILE_NAME
sudo echo "    default_type  application/octet-stream;" >> $BAK_FILE_NAME
sudo echo "" >> $BAK_FILE_NAME
sudo echo "    log_format main \"time:\$time_local\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\thost:\$remote_addr\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\tforwardedfor:\$http_x_forwarded_for\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\treq:\$request\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\tmethod:\$request_method\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\turi:\$request_uri\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\tstatus:\$status\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\tsize:\$body_bytes_sent\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\treferer:\$http_referer\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\tua:\$http_user_agent\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\treqtime:\$request_time\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\truntime:\$upstream_http_x_runtime\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\tapptime:\$upstream_response_time\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\tcache:\$upstream_http_x_cache\"" >> $BAK_FILE_NAME
sudo echo "    \"\\\tvhost:\$host\";" >> $BAK_FILE_NAME
sudo echo "" >> $BAK_FILE_NAME
sudo echo "    access_log  /var/log/nginx/access_test.log main;" >> $BAK_FILE_NAME
sudo echo "" >> $BAK_FILE_NAME
sudo echo "    sendfile        on;" >> $BAK_FILE_NAME
sudo echo "    #tcp_nopush     on;" >> $BAK_FILE_NAME
sudo echo "" >> $BAK_FILE_NAME
sudo echo "    keepalive_timeout  65;" >> $BAK_FILE_NAME
sudo echo "" >> $BAK_FILE_NAME
sudo echo "    #gzip  on;" >> $BAK_FILE_NAME
sudo echo "" >> $BAK_FILE_NAME
sudo echo "    include /etc/nginx/conf.d/*.conf;" >> $BAK_FILE_NAME
sudo echo "    include /etc/nginx/sites-enabled/*.conf;" >> $BAK_FILE_NAME
sudo echo "}" >> $BAK_FILE_NAME

if [ ! -e $BAKUP_PATH ]; then
  sudo mkdir $BAKUP_PATH ## ここでバックアップとってます
fi
sudo cp $TO_FILE $BAKUP_PATH
sudo cp $BAK_FILE_NAME $TO_FILE
sudo cp $BAK_FILE_NAME $EDITED_FILE
sudo rm -rf $BAK_FILE_NAME
sudo systemctl reload nginx

#アクセスログもろもろ
ACCESS_LOG_PATH=/var/log/nginx/access.log
if [ -e $ACCESS_LOG_PATH ]; then
  sudo rm $ACCESS_LOG_PATH
fi
sudo systemctl reload nginx