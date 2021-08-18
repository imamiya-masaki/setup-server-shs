if [ ! -e ./backup ]; then
    echo "created backup folder."
    mkdir ./backup
fi

if [ ! -e ./edited ]; then
    echo "created edited folder."
    mkdir ./edited
fi