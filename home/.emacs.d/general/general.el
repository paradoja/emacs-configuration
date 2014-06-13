;;; Custom conf.
(setq custom-file "~/.emacs.d/general/custom.el")
(load custom-file 'noerror)

;;; Cambios de configuraciones de teclas
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(require 'smex)
(defun call-smex (&optional arg)
  (interactive "P")
  (if arg
      (smex-major-mode-commands)
    (smex)))
(global-set-key "\M-x" 'call-smex)
(global-set-key "\C-x\C-m" 'call-smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ; M-x estándar
(global-set-key (kbd "C-c C-o") 'occur) ; tb. M-s o durante isearch
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
(winner-mode 1) ; C-c ←, C-c →

;; Automáticamente marcar como ejecutable scripts
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;;; Cambios visuales
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq custom-theme-directory "~/.emacs.d/themes/")
(load-theme 'tango-2-modified)
; (set-default-font "Inconsolata-13")
(set-frame-font "Ubuntu Mono-13")

;;; Comandos avanzados habilitados
(put 'set-goal-column  'disabled nil); C-x C-n
(put 'narrow-to-region 'disabled nil); C-x n n
(put 'upcase-region    'disabled nil); C-x C-u
(put 'downcase-region  'disabled nil); C-x C-l

;;; Ido http://emacslife.blogspot.com/2008/02/icicles.html
(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-auto-merge-work-directories-length -1)

;;; Uniquify, cambios en cómo mostrar los buffers http://trey-jackson.blogspot.com.es/2008/01/emacs-tip-11-uniquify.html
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;;; Smart Mode Line
(require 'smart-mode-line)
(sml/setup)
(add-to-list 'sml/replacer-regexp-list '("^~/.homesick/repos/emacs-files.git/home/.emacs.d/" ":ED:"))
(mapc (lambda (mode)
        (add-to-list 'sml/hidden-modes (format " %s" mode)))
 (list "Paredit"    ; paredit-mode
       "FlyC"       ; flycheck-mode
       "Undo-Tree"  ; undo-tree-mode
       "AC"         ; auto-complete-mode
       "yas"        ; yas/minor-mode
       "rt"         ; ruby-tools-mode
       "REl"        ; ruby-electric-mode
       "MRev"))     ; magit-auto-revert-mode
; I prefer to invert the colour scheme
(custom-theme-set-variables
 'smart-mode-line
 '(sml/active-foreground-color   "gray60")
 '(sml/active-background-color   "#404045")
 '(sml/inactive-foreground-color "gray60")
 '(sml/inactive-background-color "black"))
(setq-default sml/col-number-format  "%3l")
(setq-default sml/line-number-format "%3l")
(setq-default sml/numbers-separator  "")
(setq-default sml/col-number-format  "%3c")

;;; Cambios en paquetes generales
(load "~/.emacs.d/general/key-chords")
