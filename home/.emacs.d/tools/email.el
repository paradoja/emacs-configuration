(require 'use-package)

;;; For downloading messages mbsync (outside emacs) is used to sync
;;; messages between IMAP accounts and a local Maildir directory. Then
;;; notmuch (also installable outside emacs) is used to index these.
;;; The notmuch emacs client provides a minimal emacs client.

;;; https://notmuchmail.org/emacstips/

;;; M-x notmuch
;;; Everywhere
;;;  `-> q go back
;;;
;;; In hello view
;;;  `-> G reload emails (mbsync gmail && notmuch new from bash)
;;;  `-> j jump to standard places
;;;  `-> m write email
;;;      `-> C-c C-C send email
;;;
;;; In an email:
;;;  `-> R reply
;;;  `-> F forward

;;; TODO: Signature

(use-package notmuch
  :bind (:map notmuch-hello-mode-map
         ("R" . reload-email)))

(require 's) ; TODO: use-package it

; TODO : this should probably not be here
(defmacro run-after-process (process-list func)
  `(let ((first-process ,process-list))
     ; TODO: add (process-status process-list) check in case the process finished
     (set-process-sentinel first-process
                           (lambda (_process event)
                             (if (string= (s-trim event) "finished")
                                 ,func)))))

(defun reload-email ()
  (interactive)
  (run-after-process (start-process "sync email" "*Messages*" "mbsync" "gmail")
                     (run-after-process
                      (start-process "reindex email" "*Messages*" "notmuch" "new")
                      (progn
                        (notmuch-poll-and-refresh-this-buffer)
                        (message "Email updated")))))

(setq notmuch-search-oldest-first nil ; newer first
      message-citation-line-format "On %a, %d %b %Y, %f wrote:"
      message-citation-line-function 'message-insert-formatted-citation-line)
