#!/usr/bin/bash

export PATH=$HOME/.linuxbrew/bin:$PATH
export PATH=$HOME/.linuxbrew/sbin:$PATH

## Installs the linuxbrew tools
gitver=$(git --version | grep '^git *version' | cut -d " " -f3)
requiredgitver="2.7"

if [[ "$(echo -e "$requiredgitver\n$gitver" | sort -V | head -n1)" = "$requiredgitver" ]]; then
    echo "Success: Git Version > $requiredgitver"
else
    echo "Failed: Git version must be > $requiredgitver. Please fix"
    exit 0
fi

curlver=$(curl --version | grep '^curl' | cut -d " " -f2)
requiredcurlver="7.41.0"

if [[ "$(echo -e "$requiredcurlver\n$curlver" | sort -V | head -n1)" = "$requiredcurlver" ]]; then
    echo "Success: Curl Version > $requiredcurlver"
else
    #wget https://curl.se/download/curl-7.80.0.tar.gz --no-check-certificate 
    echo "Failed: Curl version must be > $requiredcurlver. Found at https://curl.se/download"
    exit 0
fi

# Check if brew does not exist
if ! command -v brew > /dev/null 2>&1; then
    echo "Homebrew is not installed."
    echo "/usr/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)""
    echo "export PATH=$HOME/.linuxbrew/bin:$PATH"
    echo "export PATH=$HOME/.linuxbrew/sbin:$PATH"
    echo "Installing now"
   #/usr/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


# Update brew version if needed
brew update

# Upgrade all packages 
brew upgrade

#brew install git
#brew tap linuxbrew/fonts
#ln -s $HOME/.linuxbrew/share/fonts $HOME/.local/share/fonts

CFG_BREW_BINS="\
    vim \
    tmux \"
