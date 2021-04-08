;; -*- lexical-binding: t; -*-
(provide 'init-completion)
(require 'orderless)
;; selectrum
(selectrum-mode +1)
;; to make sorting and filtering more intelligent
(selectrum-prescient-mode +1)
;; to save your command history on disk, so the sorting gets more
;; intelligent over time
(prescient-persist-mode +1)
;; orderless
(setq completion-styles '(orderless))
;; Optional performance optimization
;; by highlighting only the visible candidates.
(setq orderless-skip-highlighting (lambda () selectrum-is-active))
(setq selectrum-highlight-candidates-function #'orderless-highlight-matches)
(require 'consult)
(require 'marginalia)
(marginalia-mode)

;; company
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)
(global-company-mode)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "<tab>") #'company-complete)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))
