(defun pdox-new-line-and-indent (&optional arg)
  (interactive "p")
  (newline arg)
  (indent-according-to-mode))
