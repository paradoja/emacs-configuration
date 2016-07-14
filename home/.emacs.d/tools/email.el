(require 'use-package)

;;; For downloading messages mbsync (outside emacs) is used to sync
;;; messages between IMAP accounts and a local Maildir directory. Then
;;; notmuch (also installable outside emacs) is used to index these.
;;; The notmuch emacs client provides a minimal emacs client.

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

(use-package notmuch)

(setq notmuch-search-oldest-first nil ; newer first
      )
