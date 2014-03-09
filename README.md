Emacs configuration prepared to be used with [Homesick](https://github.com/technicalpickles/homesick).

## Submodules

To load git submodules run:

```
git submodule init
git submodule update
```

## Required programs

- [Ack](http://beyondgrep.com/) is expected to be installed and in the path.
- SHM executable is needed:
```
cd ~/.emacs.d/prog/haskell/structured-haskell-mode
cabal install
```
(cabal-install) is of course needed.

## Other requirements

`~/.authinfo.el` is expected to have identity information. At least,
the following or similar is needed:
```lisp
(setq rcirc-authinfo '(("server" nickserv "nick" "password")))
```

`~/.hipchat.el` is expected to have the hipchat configuration, something similar to:
```lisp
(setq hipchat-number                          "...")
(setq hipchat-nick                            "...")
(setq hipchat-username (concat hipchat-number "..."))
(setq hipchat-server                          "...")
(setq hipchat-nickname                        "...")
(setq hipchat-auto-join                       '("room1" "room2"))
(setq hipchat-password                        "...")
```
