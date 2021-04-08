;; -*- lexical-binding: t; -*-
(provide 'init-hook)
(require 'init-base)

(require 'parinfer-rust-mode)
(setq parinfer-rust-auto-download t)

(setq hook-list '(
                  ;; for parinfer-rust-mode specified
                  (org-mode-hook . (lambda () (electric-pair-local-mode 1)))
                  (prog-mode-hook . my-add-pretty-lambda)
                  (prog-mode-hook . (lambda () (rainbow-delimiters-mode 1)))
                  ;; parinfer rust mode
                  (emacs-lisp-mode-hook . (lambda () (parinfer-rust-mode 1)))))

(mapcar (lambda (h)
          (add-hook (car h) (cdr h)))
        hook-list)

;; Use a hook so the message doesn't get clobbered by other messages.
;;(add-hook 'emacs-startup-hook
;;          (lambda ()
;;            (message "Emacs ready in %s with %d garbage collections."
;;                     (format "%.2f seconds"
;;                             (float-time)
;;                             (time-subtract after-init-time before-init-time
;;                                            gcs-done)
