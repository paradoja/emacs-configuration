(package-initialize)

(if (file-exists-p "~/.cask/cask.el")
    (require 'cask "~/.cask/cask.el")
  (require 'cask "/usr/local/share/emacs/site-lisp/cask.el"))
(cask-initialize)

;;; Cosas generales
(load-file "~/.emacs.d/general/general.el")

;;; Programas, herramientas y aplicaciones
(load-file "~/.emacs.d/tools/tools.el")

;;; Programación, lenguajes y herramientos
(load-file "~/.emacs.d/prog/prog.el")

;;; Cosas específicas de algunos sistemas
(load-file "~/.emacs.d/pers/pers.el")
