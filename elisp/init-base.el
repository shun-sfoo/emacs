(provide 'init-base)

;; Set default font size
(defvar bruce/default-font-size 160)
(set-face-attribute 'default nil :font "Inconsolata" :height bruce/default-font-size)

;; Display line number
(global-display-line-numbers-mode)
;; Show matching parentheses
(show-paren-mode 1)


;; 保存上次光标所在位置
(require 'saveplace)
(setq-default save-place t)
(save-place-mode 1)


(tool-bar-mode -1)

(scroll-bar-mode -1)

;;(menu-bar-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)

;; 让Emacs到达顶部和底部时不要发出声音
(setq ring-bell-function 'ignore)

;; 在mode-line显示文件大小
(size-indication-mode t)


;; 禁止生成~备份文件
(setq make-backup-files nil)

;; 禁止auto-save
(setq auto-save-default nil)

(setq default-frame-alist '((height . 40) (width . 150)))

(electric-pair-mode t)
