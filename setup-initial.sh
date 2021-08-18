sudo chmod 744 /var/log
if [ ! -e ./backup ]; then
    echo "created backup folder."
    sudo mkdir ./backup
fi
sudo chmod 744 ./backup

if [ ! -e ./edited ]; then
    echo "created edited folder."
    sudo mkdir ./edited
fi
sudo chmod 744 ./edited

if [ ! -e ./edit ]; then
    echo "created edit folder."
    sudo mkdir ./edit
fi
sudo chmod 744 ./edit


echo "setup complete."