(provide 'init-ui)

;; Set default font size
(defvar neo/default-font-size 160)
(set-face-attribute 'default nil :font "Inconsolata" :height neo/default-font-size)

;; load theme
;;(when window-system
;;  (+if-dump
;;      (enable-theme 'doom-one-light)
;;    (load-theme 'doom-one-light)))

(load-theme 'spacemacs-light t)
