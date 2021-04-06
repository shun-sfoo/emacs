;; see the article https://archive.casouri.cat/note/2020/painless-transition-to-portable-dumper/index.html
(require 'package)
;; load autoload files and populate load-path’s
(package-initialize)

(setq +dumped-load-path load-path
      +dumped t)

;; (package-initialize) doens’t require each package, we need to load
;; those we want manually
;; exculde parinfer-rust-mode
(dolist (package '(ivy which-key company org rainbow-delimiters dashboard all-the-icons org-superstar))
  (require package))

;; pre-load themes spacemacs-theme no use because can't require spacemacs-theme
;;(load-theme 'doom-one-light t t)

;; dump image
(dump-emacs-portable "~/.config/emacs/emacs.pdmp")
