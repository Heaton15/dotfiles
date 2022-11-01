# .bashrc

# Source global definitions
#if [ -f /etc/bashrc ]; then
#	. /etc/bashrc
#fi

if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

source /etc/profile.d/modules.sh

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

PATH="/home/users/tim/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/users/tim/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/users/tim/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/users/tim/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/users/tim/perl5"; export PERL_MM_OPT;

#------------------------------------------------------------------------------#
#                            Work Flow Modifications                           #
#------------------------------------------------------------------------------#
alias loadEnv="source env/bin/activate"
alias loadMods="module load vcs verdi git riscv-tools"

#export PATH=$HOME/.linuxbrew/bin:$PATH
#export PATH=$HOME/.linuxbrew/sbin:$PATH

export PATH=$HOME/.local/share/vim-lsp-settings/servers/metals:$PATH
export PATH=$HOME/.local/bin:$PATH
#export JAVA_HOME=$HOME/.linuxbrew/opt/openjdk@8
