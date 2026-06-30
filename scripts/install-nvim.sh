#!/usr/bin/env bash

RED='\e[31m'
PPL='\e[35m'
BLU='\e[34m'
GRN='\e[32m'
DEF='\e[0m'

NEOVIM_TAG="0.12.3"

while getopts "n:" opt; do
    case $opt in
        n)
            NEOVIM_TAG="$OPTARG"
            ;;
        \?)
            echo "Error: Invalid option -$OPTARG" >&2
            echo "Usage: $0 -n <neovim tag>" >&2
            echo "Example: $0 -n 0.12.3 " >&2
            exit 1
            ;;
        :)
            echo "Error: Option -$OPTARG requires an argument" >&2
            exit 1
            ;;
    esac
done


declare -A DISTRO_EXT=( ["Darwin"]="macos" ["Linux"]="linux" )
declare -A ARM_VARIATIONS=( ["arm64"]="arm64" ["aarch64"]="arm64")
OS_TYPE=$(uname)

LOCAL_INSTALL="${HOME}/.local/bin/nvim"
BACKUP_DIR="${HOME}/.local/bin/software/nvim"

# Operating systems in this list have old glibc libraries
# and require a specific version of neovim that is compiled for those
LINUX_DISTROS_WITH_OLD_GLIB=("rhel")

function backup_local_nvim() {
  if [[ -f "$LOCAL_INSTALL" ]]; then
    VERSION=$(nvim --version | head -n 1 | cut -d' ' -f2)
    BACKUP_VERSION="${BACKUP_DIR}/${VERSION}"
    mkdir -p "$BACKUP_DIR/${VERSION}/" > /dev/null 2>&1
    mv "$LOCAL_INSTALL" ${BACKUP_VERSION}
    blue "Neovim ($VERSION) Backed Up -> ${BACKUP_VERSION}"
  fi
}

function green() {
  local msg="$1"
  echo -e "${GRN}${msg}${DEF}"
}

function red() {
  local msg="$1"
  echo -e "${RED}${msg}${DEF}"
}

function blue() {
  local msg="$1"
  echo -e "${BLU}${msg}${DEF}"
}


if [[ "${OS_TYPE}" == "Darwin" ]]; then
  if ! command -v nvim > /dev/null 2>&1; then
    blue "On MacOS, install Neovim with Homebrew (https://brew.sh/)"
  fi
else
  # Linux distro can be detected from the os-release file
  if [[ ! -f "/etc/os-release" ]]; then
    red "No /etc/os-release file. Cannot determine the Linux OS..."
    exit 1
  fi

  # Gives us the $ID variable, which contains simple OS information
  source /etc/os-release

  NVIM_RELEASE="https://github.com/neovim/neovim/releases/download/v${NEOVIM_TAG}/nvim-${DISTRO_EXT[$OS_TYPE]}-${ARM_VARIATIONS[$(uname -m)]}.appimage"

  for distro in ${LINUX_DISTROS_WITH_OLD_GLIB[@]}; do
    if [[ "${distro}" == "$ID" ]]; then
      blue "Distro: ${distro} requires Neovim with and older glibc..."
      # The neovim url for older glibc releases changes the neovim/releases to neovim-releases
      NVIM_RELEASE="https://github.com/neovim/neovim-releases/download/v${NEOVIM_TAG}/nvim-${DISTRO_EXT[$OS_TYPE]}-${ARM_VARIATIONS[$(uname -m)]}.appimage"
    fi
  done
  if $(wget --spider -q "$NVIM_RELEASE"); then
    backup_local_nvim
    wget -q -O "$LOCAL_INSTALL" ${NVIM_RELEASE} && chmod 755 "$LOCAL_INSTALL"
    blue "Neovim ($NEOVIM_TAG) Installed -> $LOCAL_INSTALL"
  else
    red "Failed to install neovim..."
    red "Neovim Release ${PPL}$NVIM_RELEASE${DEF} does not exist..."
    exit 1
  fi
fi
