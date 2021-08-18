if [ ! -e ./backup ]; then
    echo "created backup folder."
    sudo mkdir ./backup
fi
sudo chmod 777 ./backup

if [ ! -e ./edited ]; then
    echo "created edited folder."
    sudo mkdir ./edited
fi
sudo chmod 777 ./edited


echo "setup complete."