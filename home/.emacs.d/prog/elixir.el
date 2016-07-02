(require 'use-package)
(require 'repl-toggle)

(use-package elixir-mode
  :init
  (add-to-list 'rtog/mode-repl-alist '(purescript-mode . psci)))
(use-package alchemist)
(use-package ac-alchemist)
