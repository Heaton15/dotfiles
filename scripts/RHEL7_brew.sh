# Installs the linuxbrew tools
if [[ $(git --version | grep '^git *version' | cut -d " " -f3) < 2.7 ]]; then
    echo "Git > 2.7 required for homebrew install"
    if [[ $(find /opt/rh/ -maxdepth 1 -name "*git*" > /dev/null 2>&1) ]]; then
        echo "Please enable git in /opt/rh"
        exit 0
    else 
        echo "No git found. Please install newer version of git"
    fi
fi

#source /opt/rh/devtoolset-8/enable
#export HOMEBREW_NO_ENV_FILTERING=1
#export HOMEBREW_CURLRC=1
#
##echo "insecure" >> ~/.curlrc
#echo "export HOMEBREW_NO_ENV_FILTERING=1" >> ~/.bashrc
#echo "export HOMEBREW_CURLRC=1" >> ~/.bashrc
#echo "export PATH=\$HOME/.linuxbrew/bin:\$PATH" >> ~/.bashrc
#echo "export PATH=\$HOME/.linuxbrew/sbin:\$PATH" >> ~/.bashrc
#
/usr/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#
##Update and upgrade in case anything is left over 
#export PATH="$HOME/.linuxbrew/bin:$PATH"
#export PATH="$HOME/.linuxbrew/sbin:$PATH"
#brew update
#brew upgrade
## yes you have to do this
#brew uninstall gcc
#brew uninstall glibc
#brew install glibc
#brew install gcc
#brew install git
#brew tap linuxbrew/fonts
#ln -s $HOME/.linuxbrew/share/fonts $HOME/.local/share/fonts
