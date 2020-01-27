(use-package flycheck
  :ensure t
  :config
  (progn
    (add-hook 'c-mode-hook 'flycheck-mode)
    (add-hook 'c++-mode-hook 'flycheck-mode)
    (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
    (setq-default flycheck-flake8-maximum-line-length 160)
    )   
  )

(use-package flycheck-color-mode-line
  :ensure t
  :after (flycheck)
  :config
  (progn
    (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
    )   
  )



(use-package flycheck-irony
  :ensure t
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
  )

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))




(provide 'init-flycheck)
