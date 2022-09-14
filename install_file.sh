#!/bin/bash -e

if [[ "$(uname)" == "Darwin" ]]; then
    READLINK=greadlink
else
    READLINK=readlink
fi

# Install a file with a symbolic link.
#
# Check to see if the destination file exists. If it does, delete it and
# overwrite it with a link to the source file. If the destination file is a
# link, check to see if it's a link to the source file already. If not,
# overwrite it with a new link.
#
# Inputs:
#   $1 : path to source file to be installed.
#   $2 : path to destination for link.

# TODO: This whole prompting thing might not work so well in make-based system...

# Prompt the user with a yes-no prompt. If they don't answer "yes", then exit
# the script.
prompt_user_yn() {
    read -p "$1 [y/n] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Exiting..."
        exit 1
    fi
}

if [ -z ${1+x} ]; then
    echo "source file is unset"
    exit 1
fi
if [ -z ${2+x} ]; then
    echo "destination file is unset"
    exit 1
fi

SRC_F="$($READLINK -f "$1")"
DST_F="$2"

# Confirm the file-to-be-installed exists
if [[ ! -f "$SRC_F" ]]; then
    echo "Source file '$SRC_F' doesn't exist"
    exit 1
fi

# If the destination file isn't a link, get rid of it so we can override it
# with a link
if [[ -f "$DST_F" && ! -L "$DST_F" ]]; then
    prompt_user_yn "Remove destination file '$DST_F' before linking to '$SRC_F'?"
    rm -f "$DST_F"
fi

# If the destination file is a link, and it doesn't point to the source file,
# get rid of it so we can link it to the source file
if [[ -L "$DST_F" && "$(readlink -- "$DST_F")" != "$SRC_F" ]]; then
    prompt_user_yn "Change destination link '$DST_F' to point to '$SRC_F' instead of '$(readlink -- "$DST_F")'?"
    rm -f "$DST_F"
fi

# If the destination file's parent directory doesn't exist, create it
if [[ ! -d "$(dirname "$DST_F")" ]]; then
    mkdir -p "$(dirname "$DST_F")"
fi

# Create the link if we haven't already done so previously
if [[ ! -e "$DST_F" ]]; then
    ln -s -v "$SRC_F" "$DST_F"
fi
