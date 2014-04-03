(mapc (lambda (submode)
        (add-to-list 'semantic-default-submodes submode))
      '(global-semantic-idle-scheduler-mode
        global-semanticdb-minor-mode
        global-semantic-idle-summary-mode
        global-semantic-mru-bookmark-mode))

(semantic-mode 1)
(require 'malabar-mode)
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

(load-file
 (locate-file "malabar-flycheck"
              (list (file-name-directory
                     (find-lisp-object-file-name 'malabar-mode 'function)))
              '(".elc" ".el")))
