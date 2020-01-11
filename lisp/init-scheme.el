(use-package geiser
  :ensure t
  :config
  (progn
    (setq geiser-mode-start-repl-p t)
    (setq scheme-program-name "scheme")
    (setq geiser-chez-binary "scheme")
    (setq geiser-active-implementations '(chez))
    (setq geiser-mode-eval-last-sexp-to-buffer t)
    (setq geiser-mode-eval-to-buffer-prefix "\n;;=> ")))










(provide 'init-scheme)
