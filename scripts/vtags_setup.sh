VERSION='3.11'
SYSTEM=$(uname -n)

if [[ $SYSTEM != "arch" ]]; then
    pushd .
    curl -o $HOME/$VERSION.tar.gz https://www.vim.org/scripts/download_script.php?src_id=28365
    cd $HOME
    tar -xvzf ${VERSION}.tar.gz
    rm ${VERSION}.tar.gz
    mv vtags-${VERSION} .vtags-${VERSION}
    popd 
fi

