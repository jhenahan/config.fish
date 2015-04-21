# Oh My Fish is pretty cool
set fish_path $HOME/.oh-my-fish

# Boxen
set -x BOXEN_HOME /opt/boxen

set -x BOXEN_BIN_DIR /opt/boxen/bin
set -x BOXEN_CONFIG_DIR /opt/boxen/config
set -x BOXEN_DATA_DIR /opt/boxen/data
set -x BOXEN_ENV_DIR /opt/boxen/env.d
set -x BOXEN_LOG_DIR /opt/boxen/log
set -x BOXEN_SOCKET_DIR /opt/boxen/data/project-sockets
set -x BOXEN_SRC_DIR /Users/jhenahan/src

set -x BOXEN_DOWNLOAD_URL_BASE "https://boxen-downloads.s3.amazonaws.com"

## Homebrew
set -x HOMEBREW_ROOT /opt/boxen/homebrew
set -x HOMEBREW_CACHE /opt/boxen/cache/homebrew

set -x BOXEN_HOMEBREW_BOTTLE_URL "https://boxen-downloads.s3.amazonaws.com/homebrew"

set -x CFLAGS "-I$HOMEBREW_ROOT/include"
set -x LDFLAGS "-L$HOMEBREW_ROOT/lib"

## Man Paths
set -x MANPATH $HOMEBREW_ROOT/share/man $MANPATH

## Paths
### System
set PATH /usr/bin /bin /usr/sbin /sbin /opt/X11/bin

### Homebrew
set PATH $HOMEBREW_ROOT/bin $HOMEBREW_ROOT/sbin $BOXEN_BIN_DIR $PATH

# TeX
set PATH /usr/texbin $PATH                                                      

### Haskell
set GHC_DOT_APP /Applications/ghc-7.8.4.app 
set HASKELL_BIN $HOME/.haskellbin
set -x MANPATH $GHC_DOT_APP/Contents/share/man $MANPATH
set PATH $HASKELL_BIN/.cabal-sandbox/bin $PATH
set PATH $HASKELL_BIN/**/.cabal-sandbox/bin $PATH
set PATH $HOME/.cabal/bin $GHC_DOT_APP/Contents/bin $PATH

### Local stubs
set -x PATH bin $PATH

## GitHub
set -x BOXEN_GITHUB_LOGIN jhenahan
eval (hub alias -s)

## Language envs
set fish_plugins chruby

## Convenience plugins
set fish_plugins $fish_plugins

source $fish_path/oh-my-fish.fish

# Compilation settings
set -x ARCHFLAGS '-arch x86_64'

# Emacs is my <Leader>
set -x EDITOR 'emacsclient -c'

# Aliases
## Text
alias e $EDITOR
alias E 'sudo -e'

## Configs
alias fconf 'e ~/.config/fish/config.fish'
alias econf 'e ~/.spacemacs'

## File operations
### Ignore backups, classify, human-readable sizes, kibibytes, long, group directories before files
alias l 'ls -BFhkl --group-directories-first' 
alias la 'ls -AFhkl --group-directories-first' # All but .. and ., don't ignore backups
alias lft 'ls -X' # sort by filetype

### Get a warning before you break things, ya dingus
alias cp 'cp -i'
alias rm 'rm -i'
alias mv 'mv -i'

chruby ruby
