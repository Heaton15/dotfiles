if [[ ${USER} == "tim.heaton" || ${USER} == "heaton.49" ]]; then
    pushd .
    curl -o $HOME/vtags.tar.gz https://www.vim.org/scripts/download_script.php?src_id=26794
    cd $HOME
    tar -xvzf vtags.tar.gz
    mv vtags-3.01 .vtags-3.01
    popd 
fi

