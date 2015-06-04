set -x PHPENV_ROOT $BOXEN_HOME/phpenv

set PATH $BOXEN_HOME/phpenv/bin $BOXEN_HOME/phpenv/plugins/php-build/bin $PATH

set PATH /opt/boxen/phpenv/shims $PATH

phpenv rehash 2>/dev/null

function phpenv
  typeset command
  set command $argv[1]
  if test count $argv -gt 0
    set -e $argv[1]
  end

  switch $command
    case shell
      eval (phpenv sh-$command $argv)
    case '*'
      command phpenv $command $argv
  end
end
