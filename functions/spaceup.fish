function spaceup
  pushd ~/.emacs.d
  git pull --rebase
  git submodule sync
  git submodule update
  popd
end
