(use-package ivy
	     :ensure t
	     :diminish (ivy-mode)
	     :bind (("C-x b" . ivy-switch-buffer))
	     :config
	     (ivy-mode 1)
	     (setq ivy-use-virtual-buffers t)
	     (setq ivy-count-format "%d/%d ")
	     (setq ivy-display-style 'fancy))
;;This is ido mode
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-everywhere t)
(ido-mode 1)





(provide 'init-ivy)
