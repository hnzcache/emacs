(use-package avy
	     :ensure t
	     :bind (	     ("M-g w" . avy-goto-word-1)
			     ("C-c C-j" . avy-resume)
			     ("C-:" . avy-goto-char)
			     ("C-'" . avy-goto-char-2)
			     ("M-g f" . avy-goto-line)
			     ("M-g e" . avy-goto-word-0)))

(use-package ace-window
	     :ensure t
	     :init
	     (progn
	       (setq aw-scope 'global) ;; was frame
	       (global-set-key (kbd "C-x O") 'other-frame)
	       (global-set-key [remap other-window] 'ace-window)
	       (custom-set-faces
		'(aw-leading-char-face
		  ((t (:inherit ace-jump-face-foreground :height 2.0))))) 
	       ))

(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config 
  ;; (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
:init
(dumb-jump-mode)
  :ensure
)

(provide 'init-jump)
