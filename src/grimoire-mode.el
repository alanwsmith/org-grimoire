;; Variables

(defconst grimoire-buffer "*Grimoire*"
  "Name of the Grimoire buffer")

;; Framework

;; (defvar grimoire-mode-hook nil
;;   "Grimoire Hook"
;;   )

;; (defun grimoire-mode ()
;;   "Major mode for the an Org Mode Grimoire"
;;   ; (selectrum-mode +1)
;;   (message "Initializing Grimoire")
;;   (kill-all-local-variables)
;;   (setq major-mode 'grimoire-mode)
;;   (setq mode-name "Grimoire")
;;   (run-hooks 'grimoire-mode-hook))


;; (defun grimoire-search-completion-dynamic (prefix)
;;   `("ax", "bx", "cx", "dx")
;;   )

;; (defun grimoire-search-completion (input predicate flag)
;;   `("ax", "bx", "cx", "dx")
;;   )

;; (defun grimoire-search-old-1 ()
;;   (interactive)
;;   (completing-read
;;    "Grimoire Search: "
;;    `grimoire-search-completion
;;    )
;;   )


;; (defun grimoire-search ()
;;   (interactive)
;;   (selectrum-completing-read
;;   ; (completing-read
;;    "Grimoire Search: "
;;    ; `selectrum-refine-candidates-function
;;    `(("a" 1) ("b" 2) ("c" 3))
;;    )
;;   )

;; (defun update-thing ()
;;   (switch-to-buffer grimoire-buffer)
;;   (insert "xxxxx")
;;   )


;; (defun grimoire-search-completion-selectrum (user-input current-list)
;;   ; (update-thing)
;;   `("ex", "fx", "gx", "hx")
;;   )

;; (setq selectrum-refine-candidates-function
;;       #'grimoire-search-complection-selectrumx)


;; (defun grimoire-search-function (prompt collection &optional
;;             predicate require-match initial-input
;;             hist def _inherit-input-method)
;;   (switch-to-buffer grimoire-buffer)
;;   (insert "HERE")
;;       )

; (setq completing-read-function 'grimoire-search-function)

;; (defun grimoire-output ()
;;   (switch-to-buffer grimoire-buffer)
;;   (insert (completing-read
;;            "Grimoire Search"
;;            '(
;;              ("a" 1)
;;              ("b" 2)
;;              ("c" 3)
;;              )
;;            )
;;           )
;;    )

;; (defun grimoire ()
;;   "Test to see if this provides grimoire"
;;   (interactive)
;;   (switch-to-buffer grimoire-buffer)
;;   (if (not (eq major-mode 'grimoire-mode))
;;       (grimoire-mode)
;;       )
;;   (grimoire-output)
;;   )


; (provide 'grimoire)


(defvar page-to-open nil
  "The page to open when the search is done")


(defun aws-helm-test ()
    (interactive)
    (switch-to-buffer grimoire-buffer)
    (helm :sources (helm-build-async-source "aws-helm-source"
                      :candidates-process
                      (lambda ()
                        (switch-to-buffer grimoire-buffer)
                        ; (insert helm-pattern)
                        ; (start-process "echo" nil "echo" (shell-quote-argument helm-pattern))))
                        (start-process "echo" nil "echo" "a\nb\nc\nd\ne")
                        )
                      )
      :buffer "*helm async source*")

)


; (insert candidate)

;; (defun aws-helm-test ()
;;   (interactive)
;;   (helm :sources 'aws-helm-source
;;         :buffer "*helm my command*"))


