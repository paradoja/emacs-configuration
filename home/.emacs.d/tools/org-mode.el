(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (ruby . t)
   (ditaa . t)
   (plantuml . t)))

(setq-default org-confirm-babel-evaluate nil)
(setq-default org-ditaa-jar-path (locate-file "ditaa" exec-path '("" ".jar")))
(setq-default org-plantuml-jar-path (locate-file "plantuml" exec-path '("" ".jar")))
(define-key org-mode-map (kbd "C-,") 'magit-status)
