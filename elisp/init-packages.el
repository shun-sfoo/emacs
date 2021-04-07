(provide 'init-packages)

;; auto done in dump and init.el
;;(require 'package)
;;(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-selected-packages
      '(
        selectrum
        selectrum-prescient
        orderless
        consult
        marginalia
        embark
        spacemacs-theme
        exec-path-from-shell
        which-key
        company
        org-superstar
        rainbow-delimiters
        meow
        parinfer-rust-mode))

(mapcar (lambda (p)
          (unless (package-installed-p p)
            (package-install p t)))
        package-selected-packages)

