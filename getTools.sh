#!/usr/bin/env bash

ANA_VER=2019.03
ANACONDA=anaconda
INSTALLER=Anaconda3-${ANA_VER}-Linux-x86_64.sh
ANACONDA_LINK=https://repo.anaconda.com/archive/${INSTALLER}
ENV_FILE=environment.yml

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y qt5-default libqt5opengl5-dev libgtk-3-dev libgtkglext1 \
libgtkglext1-dev libpng3 pngtools libpng12-dev libpng12-0 libpng++-dev libtiff5-dev \
libtiff5 libtiff-tools libjpeg8-dev libjpeg8 libjpeg8-dbg libjasper-dev libjasper-runtime

if [ ! -d $HOME/${ANACONDA} ]; then

    if [ ! -f ${INSTALLER} ]; then

        if ! wget ${ANACONDA_LINK}; then
            exit 1
        fi
    fi

    chmod +x ${INSTALLER} && ./${INSTALLER} -b -p $HOME/$ANACONDA
fi

$HOME/${ANACONDA}/bin/conda env create -f $ENV_FILE

source ~/anaconda/bin/activate opencv_env
python ./test.py

