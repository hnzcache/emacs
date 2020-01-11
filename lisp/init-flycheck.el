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



(provide 'init-flycheck)
