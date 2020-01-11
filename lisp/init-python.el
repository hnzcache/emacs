(use-package anaconda-mode
  :ensure t
  :init
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package company-anaconda
  :ensure t
  :after anaconda
  :init
  (progn
    (add-hook 'python-mode-hook
		(lambda ()
		  (add-to-list (make-local-variable 'company-backends) '(company-anaconda company-capf company-files company-dabbrev))))
    (add-hook 'inferior-python-mode-hook
		(lambda ()
		  (add-to-list (make-local-variable 'company-backends) '(company-anaconda company-capf company-files company-dabbrev))))
    ))





(provide 'init-python)
