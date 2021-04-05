(provide 'init-completion)

;; ivy
(ivy-mode)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; company
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)
(global-company-mode)
