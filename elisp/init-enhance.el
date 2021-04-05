(provide 'init-enhance)

;; which-key
(require 'which-key)
(setq which-key-idle-delay 1)
(which-key-mode)

;; dashboard
(require 'dashboard)
(setq show-week-agenda-p t)
(setq dashboard-items '((recents . 15) (agenda . 5)))
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-startup-banner nil)
(dashboard-setup-startup-hook)

;; exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
