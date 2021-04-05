(provide 'init-packages)

;; emacs-china
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

(require 'package)
(package-initialize)

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
	org-fancy-priorities
        ))

(mapcar (lambda (p)
          (unless (package-installed-p p)
            (package-install p t)))
        package-selected-packages)
