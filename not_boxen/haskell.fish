set GHC_DOT_APP /Applications/ghc-7.10.1.app 
set HASKELL_BIN $HOME/.haskellbin
set -x MANPATH $GHC_DOT_APP/Contents/share/man $MANPATH
set PATH $HASKELL_BIN/.cabal-sandbox/bin $PATH
set PATH $HASKELL_BIN/**/.cabal-sandbox/bin $PATH
set PATH $HOME/.cabal/bin $GHC_DOT_APP/Contents/bin $PATH
