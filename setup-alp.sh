
if [ ! -e alp_linux_amd64.zip ]; then
sudo wget https://github.com/tkuchiki/alp/releases/download/v0.3.1/alp_linux_amd64.zip
fi
sudo unzip alp_linux_amd64.zip
sudo install ./alp /usr/local/bin