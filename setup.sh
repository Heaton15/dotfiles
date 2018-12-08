#!/bin/sh
#############################################################################################################
# Run this script to properly create all directories and symlinks needed to re-create the work environment .#
# Use this for either Arch Linux or other environment configurations.                                       #
# This script will also ask if you are either using urxvt or xterm as the terminal window.                  #
############################################################################################################
echo " " 
echo " " 
echo "This script configures the Linux work environment"
echo "If being used to configure a personal laptop, "
echo "Manually configure the following dotfiles:"
echo "===.neomutt
===grub (kernel params)
===.polybar
===.xinitrc
===.xserverrc
      "
echo " " 

# Create backup directory to store all old dotfiles if they exist
if [ ! -d $HOME/dotfiles_backup ]
then 
 mkdir $HOME/dotfiles_backup
fi

BACKUP="dotfiles_backup"

######################################################################
# Create .vimrc symlink. If .vimrc already exists, backup and replace.
######################################################################
if [ -e $HOME/.vimrc ]
then 
    mv $HOME/.vimrc $HOME/$BACKUP/.vimrc_bak
    ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc 
else
    ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
fi
############################################################################
# Create spacemacs symlink. If .spacemacs already exists, backup and replace
############################################################################
if [ -e $HOME/.spacemacs ]
then 
    mv $HOME/.spacemacs $HOME/$BACKUP/.spacemacs_bak
    ln -s $HOME/dotfiles/.spacemacs $HOME/.spacemacs
else
    ln -s $HOME/dotfiles/.spacemacs $HOME/.spacemacs
fi
#####################################################################
# Create .bash_profile symlink. If already exists, backup and replace
#####################################################################
if [ -e $HOME/.bash_profile ]
then 
    mv $HOME/.bash_profile $HOME/$BACKUP/.bash_profile_bak
    ln -s $HOME/dotfiles/.bash_profile $HOME/.bash_profile
else
    ln -s $HOME/dotfiles/.bash_profile $HOME/.bash_profile
fi
###############################################################
# Create .bashrc symlink. If already exists, backup and replace
###############################################################
if [ -e $HOME/.bashrc ]
then 
    mv $HOME/.bashrc $HOME/$BACKUP/.bashrc_bak
    ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
else
    ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
fi
###################################################################
# Create .dir_colors symlink. If already exists, backup and replace
###################################################################
if [ -e $HOME/.dir_colors ]
then 
    mv $HOME/.dir_colors $HOME/$BACKUP/.dir_colors_bak
    ln -s $HOME/dotfiles/.dir_colors $HOME/.dir_colors
else
    ln -s $HOME/dotfiles/.dir_colors $HOME/.dir_colors
fi
##########################################################################
# Create .fan symlink (fan control). If already exists, backup and replace
##########################################################################
if [ -e $HOME/.fan ]
then 
    mv $HOME/.fan $HOME/$BACKUP/.fan_bak
    ln -s $HOME/dotfiles/.fan $HOME/.fan
else
    ln -s $HOME/dotfiles/.fan $HOME/.fan
fi
################################################################################
# Do not set .fehbg as symlink. Sourcing .sh overwrites relative paths (feh bug) 
#If already exists, backup and replace
# Note that a background path is inside of the file. 
################################################################################
if [ -e $HOME/.fehbg ]
then 
    mv $HOME/.fehbg $HOME/$BACKUP/.fehbg_bak
    cp $HOME/dotfiles/.fehbg $HOME
else
    cp $HOME/dotfiles/.fehbg $HOME
fi
sh $HOME/.fehbg 2> /dev/null
# Sets background to default red_wave

########################################################
# Create .i3 file symlink. If exists, backup and replace
########################################################
if [ -d $HOME/.config/i3 ]
then 
    cp -RL $HOME/.config/i3/config $HOME/$BACKUP/.i3_config_bak
    ln -s $HOME/dotfiles/.i3_config $HOME/.config/i3/config
else

    echo " "
    echo "Warning: i3 not Installed. "
    echo "Please Install i3 and Run"
    echo "Again for i3 Config"
fi
##############################################################
# Create .inputrc file symlink. If exists, backup and replace. 
##############################################################
if [ -e $HOME/.inputrc ]
then 
    mv $HOME/.inputrc $HOME/$BACKUP/.inputrc_bak
    ln -s $HOME/dotfiles/.inputrc $HOME/.inputrc
else
    ln -s $HOME/dotfiles/.inputrc $HOME/.inputrc
fi
##############################################################
# Add ranger symlinks. If exists, backup and replace. 
# Check to see if ranger directories first exist. 
# If they do not, tell the user that they need to install 
# ranger first before proceeding. 
# Assume that installed means there is a ranger directory in 
# the .config file of $HOME
##############################################################

if [ -d $HOME/.config/ranger ]
then 
    mv $HOME/.config/ranger $HOME/$BACKUP/ranger_bak
    ln -s $HOME/dotfiles/ranger $HOME/.config/ranger
else
    echo " "
    echo "Warning: Ranger not Installed. "
    echo "Please Install Ranger and Run"
    echo "Again for Ranger Config"
fi


#################################################
# Requests user for either Xterm or URxvt config. 
#################################################
echo " " 
echo "Please Select Terminal Configuration"
echo " (1) Xterm"
echo " (2) URxvt"
read -p 'Selection: ' term_config


##################################################################
# Create .Xresources symlink depending on Xterm or URxvt selection 
##################################################################
if [ -e $HOME/.Xresources ]
then 
    mv $HOME/.Xresources $HOME/$BACKUP/.Xresources_bak
fi

if [ $term_config -eq '1' ]
then
    ln -s $HOME/dotfiles/.Xresources_xterm $HOME/.Xresources
    xrdb $HOME/.Xresources
elif [ $term_config -eq '2' ] 
then
    ln -s $HOME/dotfiles/.Xresources_urxvt $HOME/.Xresources
    xrdb $HOME/.Xresources
fi

##################################################################
#Install Vundle Plugin if not installed ##########################
##################################################################
if [ ! -d $HOME/.vim/bundle ]
then 
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 echo "Vundle not Detected. Installing"
 echo " "
fi


##################################################################
#Create URxvt/Xterm Color Files for 256 ##########################
##################################################################
if [ ! -d $HOME/.terminfo ]
then 
    cp -R $HOME/dotfiles/.terminfo $HOME
fi


