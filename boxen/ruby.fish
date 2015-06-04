set CHRUBY_ROOT $HOMEBREW_ROOT

set PATH /opt/boxen/ruby-build/bin $PATH

set -x RUBIES /opt/rubies/*

set -x BUNDLE_JOBS 8

Plugin "chruby"

chruby 2.2.2
