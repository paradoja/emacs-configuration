; General
(add-hook 'clojure-mode-hook
           (lambda () (paredit-mode +1)))

(add-hook 'cider-mode-hook #'eldoc-mode)


;; ;; highlight expression on eval
;; (require 'highlight)
;; (require 'nrepl-eval-sexp-fu)
;; (setq nrepl-eval-sexp-fu-flash-duration 0.5)
