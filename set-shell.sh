
#mkdirで、どこでも利用したいshellscriptを置いておく
if [ ! -e ~/bin ]; then
    sudo mkdir ~/bin
    sudo PATH="$PATH:~/bin"
    sudo echo 'export PATH="$PATH:~/bin"' >> ~/.bashrc
fi
sudo chmod +x ./clear-access.sh
sudo mv ./clear-access.sh ~/bin/clear-access.sh