(require 'eclim)
(require 'eclimd)
(global-eclim-mode)
(add-to-list 'eclim-eclipse-dirs "~/opt/eclipse")

(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)
