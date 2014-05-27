(require 'dash)
(require 'window-jump)
(require 'window-numbering)

(window-numbering-mode)

(defun other-window-directed (option arg)
  "Changes the point to the selected window."
  (interactive "c[o] other window [0-9] go to window 0-9 [hjkl]/[bnpf] go left/bottom/top/right\nP")
  (cl-flet* ((char-in (char list)
                      (-any? (lambda (current-char) (char-equal char current-char))
                             list))
             (get-direction (char)
                            (cond ((char-in char '(?h ?b)) wj-vec-left)
                                  ((char-in char '(?j ?n)) wj-vec-down)
                                  ((char-in char '(?k ?p)) wj-vec-up)
                                  ((char-in char '(?l ?f)) wj-vec-right))))
    (cond ((char-equal ?o option)
           (call-interactively #'other-window))
          ((and (<= ?0 option)
                (>= ?9 option))
           (select-window-by-number (string-to-number (char-to-string option))
                                    arg))
          ((get-direction option)
           (window-jump (get-direction option))))))

(global-set-key "\C-co" 'other-window-directed)

;; We remove the default keybindings for window-numbering-mode
(-dotimes 10
  (lambda (n)
    (define-key window-numbering-keymap
      (kbd (concat "M-" (number-to-string n))) nil)))
