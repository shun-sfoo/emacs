;; -*- lexical-binding: t; -*-
(provide 'init-keybinds)

(defmacro +macro/global-map (keys func)
  `(define-key global-map (kbd ,keys) ,func))

;; normal
(+macro/global-map "C-x C-b" #'consult-buffer)
(+macro/global-map "C-x C-h" #'consult-recent-file)

;; org
(+macro/global-map "C-x C-a" #'org-agenda)
(+macro/global-map "C-c C-c" #'org-capture)
