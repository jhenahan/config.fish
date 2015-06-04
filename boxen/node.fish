## Node
set -x NODENV_ROOT $BOXEN_HOME/nodenv

set PATH $BOXEN_HOME/nodenv/bin $PATH

set PATH /Users/$BOXEN_GITHUB_LOGIN/.nodenv/shims $PATH

set PATH node_modules/.bin $PATH

nodenv rehash 2>/dev/null
