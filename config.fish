# Oh My Fish is pretty cool
set fish_path $HOME/.oh-my-fish

set PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin


# See https://github.com/fish-shell/fish-shell/issues/2090
if test 0 -eq (count $MANPATH)
  set -gx MANPATH ""
end

set fish_location $HOME/.config/fish

source $fish_path/oh-my-fish.fish

source $fish_location/boxen.fish

source $fish_location/not_boxen.fish

set PATH vendor/bin $PATH
set -x PATH bin $PATH

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

