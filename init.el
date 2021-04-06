(defvar +dumped nil
  "non-nil when a dump file is loaded.
(Because dump.el sets this variable).")

(defmacro +if-dump (then &rest else)
  "Evaluate IF if running with a dump file, else evaluate ELSE."
  (declare (indent 1))
  `(if +dumped
       ,then
     ,@else))

(+if-dump
    (progn
      (setq load-path +dumped-load-path)
      (global-font-lock-mode)
      (transient-mark-mode)
      (add-hook 'after-init-hook
                (lambda ()
                  (save-excursion
                    (switch-to-buffer "*scratch*")
                    (lisp-interaction-mode)))))
  ;; add load-path's and load autoload files
  (package-initialize))
  
;; load theme
;;(when window-system
;;  (+if-dump
;;      (enable-theme 'doom-one-light)
;;    (load-theme 'doom-one-light)))
;; for spacemacs just
(load-theme 'spacemacs-light t)

(defun neo-dump ()
  "Dump Emacs."
  (interactive)
  (let ((buf "*dump process*"))
    (make-process
     :name "dump"
     :buffer buf
     :command (list "emacs" "--batch" "-q"
                    "-l" (expand-file-name "dump.el"
                                           user-emacs-directory)))
    (display-buffer buf)))

(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(setq custom-file (expand-file-name "elisp/init-custom.el" user-emacs-directory))
(load-file custom-file)

(require 'init-packages)
(require 'init-ui)
(require 'init-completion)
(require 'init-enhance)
(require 'init-org)
; (require 'init-meow)
