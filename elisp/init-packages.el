(provide 'init-packages)

;; auto done in dump and init.el
;;(require 'package)
;;(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-selected-packages
      '(ivy
         spacemacs-theme
         exec-path-from-shell
         which-key
         company
         all-the-icons
         dashboard
         org-superstar
         rainbow-delimiters
         parinfer-rust-mode))

(mapcar (lambda (p)
          (unless (package-installed-p p)
            (package-install p t)))
        package-selected-packages)
