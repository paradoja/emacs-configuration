;;; Custom conf.
(setq custom-file "~/.emacs.d/general/custom.el")
(load custom-file 'noerror)

;;; Cambios de configuraciones de teclas
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(require 'smex) ; Ido for M-x
(global-set-key "\M-x" 'smex)
(global-set-key "\C-xm" 'smex)
(global-set-key "\C-x\C-m" 'smex)
(global-set-key "\C-c\C-m" 'smex-major-mode-commands)
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
(delete-selection-mode -1)
(winner-mode 1) ; C-c ←, C-c →
(setq visual-line-fringe-indicators ; Arrows in visual-line-mode
      '(left-curly-arrow right-curly-arrow))
(require 'guide-key)
(setq guide-key/guide-key-sequence t) ; Everything
(guide-key-mode 1)

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
(load-theme 'tango-2-modified t)
; (set-default-font "Inconsolata-13")
(set-frame-font "Ubuntu Mono-13")

;;; Comandos avanzados habilitados
(put 'set-goal-column  'disabled nil); C-x C-n
(put 'narrow-to-region 'disabled nil); C-x n n
(put 'upcase-region    'disabled nil); C-x C-u;; M-u upcases word
(put 'downcase-region  'disabled nil); C-x C-l;; M-l downcases word

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
(require 'smart-mode-line-dark-theme)
(sml/setup)
;; I prefer to invert the colour scheme
(sml/apply-theme 'dark)
(custom-theme-set-faces
 'smart-mode-line-dark
 '(mode-line ((t :foreground "gray60" :background "#404045")))
 '(mode-line-inactive     ((t :foreground "gray60" :background "black"))))
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
(setq-default sml/col-number-format  "%3l")
(setq-default sml/line-number-format "%3l")
(setq-default sml/numbers-separator  "")
(setq-default sml/col-number-format  "%3c")

;;; Cambios en paquetes generales
(load "~/.emacs.d/general/key-chords")
(load "~/.emacs.d/general/browse-kill-ring")

(global-set-key "\C-\M-y" 'custom-yank-pop)
