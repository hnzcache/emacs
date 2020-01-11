(use-package swiper
	     :ensure t
	     :bind (("C-s" . swiper-isearch)
		    ("C-r" . swiper-isearch)
		    ("C-c C-r" . ivy-resume)
		    ("M-x" . counsel-M-x)
		    ("C-x C-f" . counsel-find-file)
		    ("<f1> f" . counsel-describe-function)
		    ("<f1> v" . counsel-describe-variable)
		    ("<f1> l" . counsel-find-library)
		    ("<f2> i" . counsel-info-lookup-symbol)
		    ("<f2> u" . counsel-unicode-char)
		    ("C-c g" . counsel-git)
		    ("C-c j" . counsel-git-grep)
		    ("C-c k" . counsel-ag)
		    ("C-x l" . counsel-locate)
		    ("C-S-o" . counsel-rhythmbox)
		   )
	     :config
	     (progn
	       (ivy-mode 1)
	       (setq ivy-use-virtual-buffers t)
	       (setq ivy-display-style 'fancy)
	       (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
	       ))




(provide 'init-swiper)
