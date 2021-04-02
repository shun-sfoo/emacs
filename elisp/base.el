;; Set default font size
(defvar bruce/default-font-size 110)
(set-face-attribute 'default nil :font "Monaco" :height bruce/default-font-size)

;; Custom file
(defvar bruce/custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Package repositories
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

; (defconst private-dir  (expand-file-name "private" user-emacs-directory))
; (defconst temp-dir (format "%s/cache" private-dir) "elisp temp directories")

;; Emacs customizations
(setq custom-file                        bruce/custom-file
      make-backup-files                  nil
      display-line-numbers-type          'relative
      ; inhibit-startup-message            t
      use-package-always-ensure          t)

;; Keep buffers automatically up to date
(global-auto-revert-mode t)

;; Display line number
(global-display-line-numbers-mode)

;; Show matching parentheses
(show-paren-mode 1)


(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Need to load custom file to avoid being overwritten
;; more at https://www.gnu.org/software/emacs/manual/html_node/emacs/Saving-Customizations.html
(if (file-exists-p bruce/custom-file)
  (load custom-file))

;; Delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'base)
