(eval-after-load "scala-mode"
  '(progn
     (define-key scala-mode-map (kbd "RET") 'newline-and-indent)))

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
