(use-package nasm-mode
  :ensure t
  :config
(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode)))

(provide 'init-nasm)
