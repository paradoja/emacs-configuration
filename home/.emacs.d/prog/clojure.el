; General
(add-hook 'clojure-mode-hook
           (lambda () (paredit-mode +1)))

; nREPL
(add-hook 'nrepl-interaction-mode-hook
          'nrepl-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-hook 'nrepl-mode-hook 'subword-mode)
(add-hook 'nrepl-mode-hook 'rainbow-delimiters-mode)

(defun my-nrepl-mode-setup ()
  (require 'nrepl-ritz))
(add-hook 'nrepl-interaction-mode-hook 'my-nrepl-mode-setup)

; Compojure
(add-hook 'clojure-mode-hook
          (lambda () (define-clojure-indent
                       (defroutes 'defun)
                       (GET 2)
                       (POST 2)
                       (PUT 2)
                       (DELETE 2)
                       (HEAD 2)
                       (ANY 2)
                       (context 2))))

;; ;; highlight expression on eval
;; (require 'highlight)
;; (require 'nrepl-eval-sexp-fu)
;; (setq nrepl-eval-sexp-fu-flash-duration 0.5)
