set -x BOXEN_HOME /opt/boxen
set -x BOXEN_GITHUB_LOGIN (whoami)

set -x BOXEN_BIN_DIR /opt/boxen/bin
set -x BOXEN_CONFIG_DIR /opt/boxen/config
set -x BOXEN_DATA_DIR /opt/boxen/data
set -x BOXEN_ENV_DIR /opt/boxen/env.d
set -x BOXEN_LOG_DIR /opt/boxen/log
set -x BOXEN_SOCKET_DIR /opt/boxen/data/project-sockets
set -x BOXEN_SRC_DIR /Users/$BOXEN_GITHUB_LOGIN/src

set -x BOXEN_DOWNLOAD_URL_BASE "https://boxen-downloads.s3.amazonaws.com"

set -l boxen_configs $fish_location/boxen

set -l enabled_configs homebrew git mysql php node ruby

for i in $enabled_configs
  source $boxen_configs/$i.fish
end
