(use-package tex-site
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
	      ;; (add-to-list TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
              (rainbow-delimiters-mode)
              (company-mode)
              ;; (smartparens-mode)
              (turn-on-reftex)
              (setq reftex-plug-into-AUCTeX t)
              (reftex-isearch-minor-mode)
              (setq TeX-PDF-mode t)
              (setq TeX-source-correlate-method 'synctex)
              (setq TeX-source-correlate-start-server t)))

  ;; (add-hook 'LaTeX-mode-hook #'my-latex-mode-hook)

  ;;    (defun my-latex-mode-hook ()
  ;;      (add-to-list 'TeX-command-list
  ;;                   '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t)))
     
;; (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t"TeX-run-TeX nil t))
	      ;; (setq Tex-command-default "XeLaTeX")))

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
           #'TeX-revert-document-buffer)

;; to use pdfview with auctex
(add-hook 'LaTeX-mode-hook 'pdf-tools-install)

;; to use pdfview with auctex
(setq TeX-view-program-selection '((output-pdf "pdf-tools"))
       TeX-source-correlate-start-server t)
(setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view"))))



(use-package reftex
  :ensure t
  :defer t
  :config
  (setq reftex-cite-prompt-optional-args t)); Prompt for empty optional arguments in cite

(use-package cdlatex
  :ensure t
  :diminish cdlatex-mode
  :commands (turn-on-cdlatex
	       cdlatex-mode)
  :init
  (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
  (add-hook 'org-mode-hook 'turn-on-cdlatex)
  :config
  (setq cdlatex-simplify-sub-super-scripts nil
	  cdlatex-paired-parens "$[{("
	  cdlatex-sub-super-scripts-outside-math-mode nil
	  cdlatex-insert-auto-labels-in-env-templates nil))


(provide 'init-tex)
