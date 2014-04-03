(projectile-global-mode)

; If we have ag (the silver searcher) we use projectile-ag instead of
; projectile-ack
(when (fboundp 'ag-regexp)
  (define-key projectile-mode-map (kbd "C-c p a") 'projectile-ag))
