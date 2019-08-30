;; Helm

(use-package helm
  :init
  (require 'helm-config)
  :bind
  ("C-c h" . helm-command-prefix)
  ("C-x C-f" . helm-find-files)
  ("C-c h o" . helm-occur)
  ("M-x" . 'helm-M-x)
  (:map helm-map
        ("<tab>" . helm-execute-persistent-action) ; rebind tab to run persistent action
        ("C-i" . helm-execute-persistent-action) ; make TAB work in terminal
        ("C-z"  . helm-select-action) ; list actions using C-z
        )
  :custom
  (helm-M-x-fuzzy-match t)
  :config
  (define-key global-map [remap list-buffers] 'helm-buffers-list)
  (unless (boundp 'completion-in-region-function)
    (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
    (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point)))

(use-package helm-ag
  :after helm
  :custom
  (helm-ag-insert-at-point (quote symbol)))

(provide 'init-helm)
