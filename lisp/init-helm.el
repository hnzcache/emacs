(use-package helm
 :ensure t)

(use-package helm-lsp
  :ensure t
  :config
  (defun alan/helm-lsp-workspace-symbol-at-point ()
    (interactive)
    (let ((current-prefix-arg t))
      (call-interactively #'helm-lsp-workspace-symbol)))

  (defun alan/helm-lsp-global-workspace-symbol-at-point ()
    (interactive)
    (let ((current-prefix-arg t))
      (call-interactively #'helm-lsp-global-workspace-symbol))))





(provide 'init-helm)
