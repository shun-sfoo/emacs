(provide 'init-enhance)

;; which-key
(require 'which-key)
(setq which-key-idle-delay 1)
(which-key-mode)

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

