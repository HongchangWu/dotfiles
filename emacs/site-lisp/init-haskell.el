;; Haskell mode
(require 'haskell-mode)
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'paredit-nonlisp)
(with-eval-after-load 'haskell
  (define-key haskell-mode-map "{" 'paredit-open-curly)
  (define-key haskell-mode-map "}" 'paredit-close-curly-and-newline)
  (define-key haskell-mode-map "\'" 'paredit-singlequote)
  (define-key haskell-mode-map [f8] 'haskell-navigate-imports)
  (define-key haskell-mode-map (kbd "C-c C-h") 'helm-hoogle)
  (add-hook 'before-save-hook 'haskell-mode-stylish-buffer))
(custom-set-variables
 '(haskell-interactive-popup-errors nil)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-type 'auto)
 '(haskell-tags-on-save t)
 '(haskell-font-lock-symbols t))

(require 'hindent)
(add-hook 'haskell-mode-hook #'hindent-mode)

(require 'company-ghc)
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

(provide 'init-haskell)