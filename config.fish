# Oh My Fish is pretty cool
set fish_path $HOME/.oh-my-fish


# PATH stuff
set PATH $HOME/git/**/.cabal-sandbox/bin                                        # Go grab all my local sandboxed stuff - slow the first time
set PATH /usr/bin /bin /usr/sbin /sbin /opt/X11/bin $PATH                       # System paths
set PATH /usr/texbin $PATH                                                      # TeX paths
set PATH $HOME/.composer/vendor/bin $PATH                                       # Composer global installs
set PATH /usr/local/bin /usr/local/opt/coreutils/libexec/gnubin $PATH           # Homebrew paths
set PATH $HOME/Library/Haskell/bin $PATH                                        # Haskell paths
set PATH /usr/local/tranquil/bin $PATH                                          # Tranquil paths
set PATH $HOME/bin $PATH                                                        # Local scripts paths
set PATH $HOME/.nodenv/bin $HOME/.nodenv/shims $PATH                            # Nodenv path
set -x PATH $PATH

# Other paths

## pkg-config
## I vaguely remember having issues with cairo unless X11 went first, so there it is
set -x PKG_CONFIG_PATH /opt/X11/lib/pkgconfig /usr/local/lib/pkgconfig

## man paths, good for fish_update_completions
set -x MANPATH /usr/local/share/man /usr/local/opt/coreutils/libexec/gnuman $MANPATH

## Conveniences
### Hub: wrapper around git for interacting fluently with github - github/hub
eval (hub alias -s)

## Language envs
set fish_plugins rbenv               # Ruby
set fish_plugins pyenv $fish_plugins # Python
set fish_plugins plenv $fish_plugins # Perl
nodenv rehash 2>/dev/null            # Node
# TODO: phpenv - pending josegonzalez/homebrew-php/issues/1037

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
alias hnote 'IHaskell notebook --ipython=(which ipython)'

## Configs
alias fconf 'e ~/.config/fish/config.fish'
alias econf 'e ~/.emacs.d/init.org'

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


function nodenv
  set command $argv[1]
  set -e argv[1]
  
  switch "$command"
  case rehash shell
    eval (nodenv "sh-$command" $argv)
  case '*'
    command nodenv "$command" $argv
  end
end