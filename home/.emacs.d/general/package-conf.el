;;; Hiding some minor modes from the mode line
(mapc (lambda (mode)
        (let ((mode-line-cons (assq mode minor-mode-alist)))
          (and mode-line-cons
               (setcar (cdr mode-line-cons) nil))))
      (list 'projectile-mode
            'yas/minor-mode
            'paredit-mode
            'undo-tree-mode
            'ruby-tools-mode
            'flycheck-mode
            'ibus-mode
            'ruby-electric-mode
            'magit-auto-revert-mode
            'auto-complete-mode))
