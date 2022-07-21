
#mkdirで、どこでも利用したいshellscriptを置いておく

mkdir ~/bin
sudo chmod +x ./clear-access.sh
mv ./clear-access.sh ~/bin
PATH="$PATH:~/bin"
echo 'export PATH="$PATH:~/bin"' >> ~/.bashrc