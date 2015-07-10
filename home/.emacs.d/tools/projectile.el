(require 'projectile)
(projectile-global-mode)

; If we have ag (the silver searcher) we use projectile-ag instead of
; projectile-ack
(when (fboundp 'ag-regexp)
  (define-key projectile-mode-map (kbd "C-c p a") 'projectile-ag))

; Removing Projectile from the mode line
(setq-default projectile-mode-line "")
(defun projectile-update-mode-line ())

; Change default switch-project to select open buffers if there are
; any, instead of find-file
(defun custom-projectile-open-project-buffer-or-file (&optional arg)
  "If the project has any open buffers, it will try to open one
  of them. Otherwise it will prompt to open a project file."
  (interactive "P")
  (if (eq (projectile-project-buffer-names) '())
      (projectile-find-file arg)
    (projectile-switch-to-buffer)))

(setq projectile-switch-project-action
      'custom-projectile-open-project-buffer-or-file)
