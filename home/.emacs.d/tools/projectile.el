(require 'projectile)
(projectile-global-mode)

; If we have ag (the silver searcher) we use projectile-ag instead of
; projectile-ack
(when (fboundp 'ag-regexp)
  (define-key projectile-mode-map (kbd "C-c p a") 'projectile-ag))

; Removing Projectile from the mode line
(setq-default projectile-mode-line "")
(defun projectile-update-mode-line ())
