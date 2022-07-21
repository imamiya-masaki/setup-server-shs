
#mkdirで、どこでも利用したいshellscriptを置いておく
if [ ! -e ~/bin ]; then
    mkdir ~/bin
    PATH="$PATH:~/bin"
    echo 'export PATH="$PATH:~/bin"' >> ~/.bashrc
fi
sudo chmod +x ./clear-access.sh
mv ./clear-access.sh ~/bin/clear-access.sh