(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(setq custom-file (expand-file-name "elisp/init-custom.el" user-emacs-directory))
(load-file custom-file)

(require 'init-base)
(require 'init-packages)
(require 'init-ui)
(require 'init-completion)
(require 'init-enhance)
(require 'init-org)
; (require 'init-meow)
