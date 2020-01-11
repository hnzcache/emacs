(use-package company-tabnine
  :ensure t)

(use-package company
:ensure t
:config
(setq tab-always-indent 'complete)
;;(add-hook 'after-init-hook 'company-quickhelp-mode)
(global-company-mode 1)

(add-to-list 'completion-styles 'initials t)
(add-to-list 'company-backends #'company-tabnine)


;;(define-key company-active-map (kbd "C-n") 'company-select-next)

;;(define-key company-active-map (kbd "C-p") 'company-select-previous)

(setq company-idle-delay 0

          company-minimum-prefix-length 3

          company-require-match nil

          company-dabbrev-ignore-case nil

          company-show-numbers t

          company-transformers '(company-sort-by-backend-importance)

          company-continue-commands '(not helm-dabbrev)

          company-dabbrev-downcase nil)
)



(use-package company-lsp
  :ensure t
  :commands company-lsp
  :init
  (progn
    (add-hook 'python-mode-hook
			(lambda ()
			  (add-to-list (make-local-variable 'company-backends) '(company-lsp company-files))))
      (add-hook 'java-mode-hook
			(lambda ()
			  (add-to-list (make-local-variable 'company-backends) '(company-lsp company-files))))
          (add-hook 'c-mode-hook
			(lambda ()
			  (add-to-list (make-local-variable 'company-backends) '(company-lsp company-files))))
    (add-hook 'c++-mode-hook
			(lambda ()
			  (add-to-list (make-local-variable 'company-backends) '(company-lsp company-files)))))


  :config
  (progn
    (setq company-lsp-enable-recompletion t
	    company-lsp-async t
	    company-lsp-cache-candidates 'auto
	    company-lsp-match-candidate-predicate 'company-lsp-match-candidate-prefix)))

(use-package company-auctex
  :ensure t
  :mode (".tex\\'" . LaTeX-mode)
  :init
  (add-hook 'LaTeX-mode-hook
	      (lambda ()
		(add-to-list (make-local-variable 'company-backends)
			     '(company-auctex-labels
			       company-auctex-bibs
			       company-auctex-macros
			       company-auctex-symbols
			       company-auctex-environments)))))

(provide 'init-company)
