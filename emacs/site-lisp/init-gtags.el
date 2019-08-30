;; GNU Global interface

(use-package helm-gtags
  :requires helm
  :hook
  ((c-mode c++-mode java-mode js-mode python-mode) . helm-gtags-mode)
  :custom
  (helm-gtags-prefix-key "\C-cg")
  (helm-gtags-suggested-key-mapping t)
  (helm-gtags-auto-update t)
  (helm-gtags-use-input-at-cursor t)
  (helm-gtags-pulse-at-cursor t)
  :bind
  (:map helm-gtags-mode-map
        ("M-." . helm-gtags-dwim)
        ("M-," . helm-gtags-pop-stack)
        ("C-c g a" . helm-gtags-tags-in-this-function)
        ("C-c g c" . helm-gtags-create-tags)
        ("C-c g <" . helm-gtags-previous-history)
        ("C-c g >" . helm-gtags-next-history)))

(provide 'init-gtags)
