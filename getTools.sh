#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
    echo "Input python version, v2 or v3"
  exit 1
fi

if [[ $1 -ne 2 && $1 -ne 3 ]]; then
    echo "Choose 2 or 3"
    exit 1
fi

ANA_VER=5.1.0
ANACONDA=anaconda
INSTALLER=Anaconda${1}-${ANA_VER}-Linux-x86_64.sh
ANACONDA_LINK=http://repo.continuum.io/archive/${INSTALLER}

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y qt5-default libqt5opengl5-dev libgtk-3-dev libgtkglext1 \
libgtkglext1-dev libpng3 pngtools libpng12-dev libpng12-0 libpng++-dev libtiff5-dev \
libtiff5 libtiff-tools libjpeg8-dev libjpeg8 libjpeg8-dbg libjasper-dev libjasper-runtime

if [ ! -d $HOME/${ANACONDA} ]; then
    wget ${ANACONDA_LINK} && chmod +x ${INSTALLER} && ./${INSTALLER} -b -p $HOME/$ANACONDA
fi

$HOME/${ANACONDA}/bin/conda env create -f environment.yml

echo ". ~/anaconda/bin/activate opencv_env"
