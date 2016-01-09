(require 'repl-toggle)
(require 'psci)
(add-hook 'purescript-mode-hook 'inferior-psci-mode)
(add-to-list 'rtog/mode-repl-alist '(purescript-mode . psci))
