## Homebrew
set -x HOMEBREW_ROOT /opt/boxen/homebrew
set -x HOMEBREW_CACHE /opt/boxen/cache/homebrew

set -x BOXEN_HOMEBREW_BOTTLE_URL "https://boxen-downloads.s3.amazonaws.com/homebrew"

set -x CFLAGS "-I$HOMEBREW_ROOT/include"
set -x LDFLAGS "-L$HOMEBREW_ROOT/lib"

## Cask
set -x HOMEBREW_CASK_OPTS "--caskroom=/opt/homebrew-cask/Caskroom"

## man paths
set -x MANPATH $HOMEBREW_ROOT/share/man $MANPATH
set PATH $HOMEBREW_ROOT/bin $HOMEBREW_ROOT/sbin $BOXEN_BIN_DIR $PATH
