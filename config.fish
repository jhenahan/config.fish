# Oh My Fish is pretty cool
set fish_path $HOME/.oh-my-fish


# PATH stuff
# Haskell
set GHC_DOT_APP /Applications/ghc-7.8.3.app 
set -x PATH $HOME/.cabal/bin $GHC_DOT_APP/Contents/bin $PATH
set -x PATH $HOME/.haskellbin/.cabal-sandbox/bin $PATH
set -x PATH $HOME/.haskellbin/**/.cabal-sandbox/bin $PATH
set PATH $HOME/dev/haskell-tools/.cabal-sandbox/bin

# System paths
set PATH /usr/bin /bin /usr/sbin /sbin /opt/X11/bin $PATH                       

# TeX
set PATH /usr/texbin $PATH                                                      

# Composer global installs
set PATH $HOME/.composer/vendor/bin $PATH

# Homebrew
set PATH /usr/local/bin /usr/local/sbin /usr/local/opt/coreutils/libexec/gnubin $PATH

# Local scripts
set PATH $HOME/bin $PATH

set -x PATH $PATH

# Other paths

## pkg-config
## I vaguely remember having issues with cairo unless X11 went first, so there it is
set -x PKG_CONFIG_PATH /opt/X11/lib/pkgconfig /usr/local/lib/pkgconfig

## man paths, good for fish_update_completions
set -x MANPATH /usr/local/share/man /usr/local/opt/coreutils/libexec/gnuman /usr/local/opt/erlang/lib/erlang/man $HOME/GHC/share/man $MANPATH

## Conveniences
### Hub: wrapper around git for interacting fluently with github - github/hub
eval (hub alias -s)

## Language envs
set fish_plugins chruby
chruby ruby

## Convenience plugins
set fish_plugins rake tmux vi-mode $fish_plugins
set vi_mode_default vi_mode_insert

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

source $fish_path/oh-my-fish.fish