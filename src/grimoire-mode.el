(require 'helm)
(require 'helm-lib)
(require 'helm-utils)

;; See .spacemacs for setting grimoire-mode-directory

(defconst grimoire-mode-buffer "*Grimoire*"
  "Name of the Grimoire buffer")

(defvar grimoire-mode-helm-buffer-line 0
  "Storage for the current line position of
the helm buffer")

(defvar grimoire-mode-helm-buffer-line-adjusted 0
  "Adjusted to accont for the fact the results
start on the second line")

(defvar grimoire-mode-get-search-content-script
  "/Users/alan/workshop/grimoire-mode/src/get-search-content"
  "Path to the script that returns the content to populate
the grimoire preview"
  )

(defvar grimoire-mode-get-search-results-script
  "/Users/alan/workshop/grimoire-mode/src/get-search-results"
  "Path to the script that returns the content to populate the
results in the grimoire"
  )

(defun grimiore-mode-test (candidate)

  (switch-to-buffer grimoire-mode-buffer)

  (if (string= candidate "Ready...")
      (message "No file selected.")
    (find-file(concat grimoire-mode-directory "/" candidate))
  )

  )

(defun grimoire-mode-handle-selection (return-value)

  ;; ;; (message return-value)
  ;; (if (string= return-value nil)
  ;;     (message "No file selected.")
  ;; (if (string= return-value "Ready...")
  ;;     (message "No file selected.")
  ;;   (progn
  ;;     (message (concat "Loading: " return-value) )
  ;;     (find-file(concat grimoire-mode-directory "/" return-value))
  ;;     (org-mode)
  ;;     )))


  )

(defun grimoire-mode-update-preview ()
  ;; (setq grimoire-mode-helm-buffer-line
  ;;       (with-current-buffer helm-buffer (string-to-number (format-mode-line "%l"))))
  ;; (setq grimoire-mode-helm-buffer-line-adjusted
  ;;       (max (- grimoire-mode-helm-buffer-line 2) 0) )
  ;; ;; (message (number-to-string grimoire-mode-helm-buffer-line))
  ;; (switch-to-buffer grimoire-mode-buffer)
  ;; (erase-buffer)
  ;; (if (string= helm-pattern "")
  ;;     (message "No file selected")
  ;;   (call-process
  ;;  "/bin/bash"
  ;;  nil
  ;;  grimoire-mode-buffer
  ;;  nil
  ;;  grimoire-mode-get-search-content-script
  ;;  helm-pattern
  ;;  (number-to-string grimoire-mode-helm-buffer-line-adjusted)))
  ;; (goto-char (point-min))
  )


(defun grimiore-mode-preview (candidate)
  (switch-to-buffer grimoire-mode-buffer)
  (erase-buffer)
  (if (string= candidate "Ready...")
      (message "No file selected.")
    (find-file(concat grimoire-mode-directory "/" candidate))
    (insert-into-buffer grimoire-mode-buffer)
    (kill-buffer (current-buffer))
    )
   (goto-char (point-min))
  )

(defun grimoire-mode-search-v0.10 ()
  (interactive)
  (grimoire-mode-handle-selection(helm :sources
        (helm-build-async-source "Grimoire Search"
          :follow 1
          :follow-delay 0.001
          :persistent-action 'grimiore-mode-preview
          :candidates-process
          (lambda ()
            ; (grimoire-mode-update-preview)
            (start-process
             "search"
             nil
             "/bin/bash"
             grimoire-mode-get-search-results-script
             helm-pattern)))
        :buffer "*helm grimoire search*"))
  (kill-buffer grimoire-mode-buffer))

