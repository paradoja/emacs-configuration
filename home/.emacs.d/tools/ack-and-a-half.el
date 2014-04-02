(setq-default ack-and-a-half-executable
              (or (executable-find "ag") ; silver searcher
                  (executable-find "ack")
                  (executable-find "ack-grep")))
