(provide 'init-org)

(setq org-agenda-files (list "~/git/org/"))

(setq org-startup-indented t)
;; org-superstar
(require 'org-superstar)
(add-hook 'org-mode-hook (lambda ()(org-superstar-mode 1)))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; 设置任务流程
(setq org-todo-keywords
      '((sequence "TODO(t!)" "NEXT(n!)" "|" "DONE(d!)")
        (sequence  "BLOCKED(s@/!)" "HANGING(h@/!)" "|" "CANCELLED(a@/!)")))

;; 设置任务样式
(setq org-todo-keyword-faces
      '(("TODO" .   (:foreground "red" :weight bold))
        ("NEXT" .   (:foreground "blue" :weight bold))
        ("DONE" .   (:foreground "forest green" :weight bold))
        ("BLOCKED" .   (:foreground "orange" :weight bold))
        ("HANGING" .   (:foreground "magenta" :weight bold))
        ("CANCELLED" .   (:foreground "forest green" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("BLOCKED" ("BLOCKED" . t))
              ("HANGING" ("BLOCKED") ("HANGING" . t))
              (done ("BLOCKED") ("HANGING"))
              ("TODO" ("BLOCKED") ("CANCELLED") ("HANGING"))
              ("NEXT" ("BLOCKED") ("CANCELLED") ("HANGING"))
              ("DONE" ("BLOCKED") ("CANCELLED") ("HANGING")))))

;; == capture settings
(setq org-directory "~/git/org")
(setq org-default-notes-file "~/git/org/refile.org")

;; I use C-c c to start capture mode
(global-set-key (kbd "C-c c") 'org-capture)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/git/org/refile.org")
               "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/git/org/refile.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/git/org/refile.org")
               "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/git/org/diary.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/git/org/refile.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/git/org/refile.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/git/org/refile.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/git/org/refile.org")
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))


