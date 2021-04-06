(provide 'init-org)

(setq org-agenda-files (list "~/org-mode/"))

;; org-superstar
(require 'org-superstar)
(add-hook 'org-mode-hook (lambda ()(org-superstar-mode 1)))

;; 设置任务流程
(setq org-todo-keywords
      '((sequence "未开始(p!)" "进行中(t!)" "阻塞中(s!)" "|" "已完成(d!)" "已取消(a@/!)")))

;; 设置任务样式
(setq org-todo-keyword-faces
      '(("未开始" .   (:foreground "red" :weight bold))
        ("阻塞中" .   (:foreground "red" :weight bold))
        ("进行中" .      (:foreground "orange" :weight bold))
        ("已完成" .      (:foreground "green" :weight bold))
        ("已取消" .     (:background "gray" :foreground "black"))))
