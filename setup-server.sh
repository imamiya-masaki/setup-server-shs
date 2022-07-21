./setup-initial.sh
./setup-alp.sh
./setup-nginx-conf.sh
./setup-query.sh

#mkdirで、どこでも利用したいshellscriptを置いておく
mkdir ~/bin
sudo chmod +x ./clear-access.sh
mv ./clear-access.sh ~/bin
echo 'PATH="$PATH:~/bin"'

sudo service nginx start #一応最後にnginxを再スタートさせとく

echo "all complete."