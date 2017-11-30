VER=5.0.1
ANACONDA=anaconda3
INSTALLER=Anaconda3-${VER}-Linux-x86_64.sh
ANACONDA_LINK=http://repo.continuum.io/archive/${INSTALLER}

if [ ! -d $HOME/${ANACONDA} ]; then
    wget ${ANACONDA_LINK} && chmod +x ${INSTALLER} && ./${INSTALLER} -b -p $HOME/$ANACONDA
fi

$HOME/${ANACONDA}/bin/conda env create -f environment.yml

echo -e "Run this:  . ~/anaconda3/bin/activate py36  \n"
