./setup-initial.sh
./setup-alp.sh
./setup-nginx-conf.sh
./setup-query.sh

#mkdirで、どこでも利用したいshellscriptを置いておく
./set-shell.sh

sudo service nginx start #一応最後にnginxを再スタートさせとく

echo "all complete."