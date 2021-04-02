(use-package evil
  :init
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1))

(use-package evil-escape
  :config
  (setq-default evil-escape-key-sequence "jk")
  (evil-escape-mode 1))

(provide 'vim)
