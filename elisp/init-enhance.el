(provide 'init-enhance)

;; which-key
(require 'which-key)
(setq which-key-idle-delay 1)
(which-key-mode)

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; parinfer rust mode
(require 'parinfer-rust-mode)
(setq parinfer-rust-auto-download t)
(add-hook 'emacs-lisp-mode-hook 'parinfer-rust-mode)
