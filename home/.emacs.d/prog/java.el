(require 'eclim)
(require 'eclimd)
(global-eclim-mode)
(defvar eclim-possible-workspaces '("~/curro"))

(add-to-list 'eclim-eclipse-dirs "~/opt/eclipse")

(require 'f)
(require 'dash)
(let ((valid-paths (-filter #'f-exists?
                            eclim-possible-workspaces)))
  (when (not (null valid-paths))
    (setq-default eclimd-default-workspace
                  (car valid-paths))))

(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)
