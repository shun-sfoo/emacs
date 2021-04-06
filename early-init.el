;; emacs-china
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Display line number
(global-display-line-numbers-mode)
;; Show matching parentheses
(show-paren-mode 1)

;; 设置光标的样式为竖线
(setq-default cursor-type 'bar)

(setq default-frame-alist '((height . 40) (width . 150)))

(global-hl-line-mode)

;; 保存上次光标所在位置
(require 'saveplace)
(setq-default save-place t)
(save-place-mode 1)

;;(menu-bar-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)

;; 让Emacs到达顶部和底部时不要发出声音
(setq ring-bell-function 'ignore)

;; 在mode-line显示文件大小
(size-indication-mode t)

;; 在 mode line 上显示时间,格式: 年-月-日 时:分
(setq display-time-format "%H:%M")
(setq display-time-default-load-average nil)
(display-time-mode 1)

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

;; 禁止生成~备份文件
(setq make-backup-files nil)

;; 禁止auto-save
(setq auto-save-default nil)

;; for parinfer-rust-mode specified
(add-hook 'org-mode-hook (lambda () (electric-pair-local-mode 1)))

(global-prettify-symbols-mode 1)
(defun my-add-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          ("->" . 8594)    ; →
          ("=>" . 8658)    ; ⇒
          ("map" . 8614))))   ; ↦

(add-hook 'prog-mode-hook 'my-add-pretty-lambda)

;; Use a hook so the message doesn't get clobbered by other messages.
(add-hook 'emacs-startup-hook
    (lambda ()
        (message "Emacs ready in %s with %d garbage collections."
            (format "%.2f seconds"
                (float-time
                    (time-subtract after-init-time before-init-time)))
            gcs-done)))

;; use space instead of tabs
(setq-default indent-tabs-mode nil);  # put this in your .emacs file
