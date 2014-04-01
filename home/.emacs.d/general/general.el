;;; Custom conf.
(setq custom-file "~/.emacs.d/general/custom.el")
(load custom-file 'noerror)

;;; Cambios de configuraciones de teclas
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(defun call-smex (&optional arg)
  (interactive "P")
  (if arg
      (smex-major-mode-commands)
    (smex)))
(global-set-key "\M-x" 'call-smex)
(global-set-key "\C-x\C-m" 'call-smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ; M-x estándar
(global-set-key (kbd "C-c o") 'occur) ; tb. M-s o durante isearch
(global-set-key (kbd "C-x C-b") 'ibuffer)
(define-key global-map (kbd "RET") 'newline-and-indent)

;;; Servidor
(setenv "EDITOR" "/usr/bin/emacsclient")

;;; Cambios específicos propios de comportamiento y edición
(require 'iso-transl)
(setq-default indent-tabs-mode nil) ; no tabs
(global-font-lock-mode 1)
(show-paren-mode)
(column-number-mode 1)
(add-hook 'before-save-hook 'delete-trailing-whitespace) ; no whitespace
(global-undo-tree-mode)
(key-chord-mode 1)
(setq-default truncate-lines t)
(global-auto-complete-mode 1)
; Enhanced rectangle edition, global mark mode and easy register use
(cua-selection-mode t)
(setq-default cua-delete-selection nil)

;; Automáticamente marcar como ejecutable scripts
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;;; Cambios visuales
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq custom-theme-directory "~/.emacs.d/themes/")
(load-theme 'tango-2-modified)
; (set-default-font "Inconsolata-13")
(set-frame-font "Ubuntu Mono-13")

;;; Comandos avanzados habilitados
(put 'set-goal-column 'disabled nil) ; C-x C-n
(put 'narrow-to-region 'disabled nil); C-x n n

;;; Ido http://emacslife.blogspot.com/2008/02/icicles.html
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(flx-ido-mode t)
(setq ido-use-faces nil)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-auto-merge-work-directories-length -1)

;;; Uniquify, cambios en cómo mostrar los buffers http://trey-jackson.blogspot.com.es/2008/01/emacs-tip-11-uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;;; Cambios en paquetes generales
(load "~/.emacs.d/general/package-conf.el")
(load "~/.emacs.d/general/key-chords")
