(use-package posframe :ensure t)


(use-package hl-line
  :ensure t
  :init
  (add-hook 'prog-mode-hook (lambda () (hl-line-mode t)))
  (add-hook 'text-mode-hook (lambda () (hl-line-mode t))))

(use-package all-the-icons 
:ensure t
:defer 0.5)

(use-package all-the-icons-ivy
:ensure t
  :after (all-the-icons ivy)
  :custom (all-the-icons-ivy-buffer-commands '(ivy-switch-buffer-other-window ivy-switch-buffer))
  :config
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-dired-jump)
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-find-library)
  (all-the-icons-ivy-setup))


(use-package all-the-icons-dired
:ensure t
)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)


(use-package beacon
  :ensure t
  :diminish beacon-mode
  :config
  (setq beacon-blink-when-window-scrolls nil
	  beacon-dont-blink-major-modes '(t pdf-view-mode)
	  beacon-size 10)
  (beacon-mode 1))

(use-package rainbow-delimiters
  :ensure t
  :commands rainbow-delimiters-mode
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'text-mode-hook 'rainbow-delimiters-mode))

(use-package highlight-parentheses
  :ensure t
  :diminish highlight-parentheses-mode
  :config
  (add-hook  'prog-mode-hook #'highlight-parentheses-mode)
  (setq hl-paren-delay 0.2)
  (setq hl-paren-colors '("Springgreen3"
			    "IndianRed1"
			    "IndianRed3"
			    "IndianRed4"))
  (set-face-attribute 'hl-paren-face nil :weight 'ultra-bold))

;; (use-package highlight-indentation
;;   :ensure t
;;   :diminish highlight-indentation-mode
;;   :commands highlight-indentation-mode
;;   :init
;;   (add-hook 'prog-mode-hook #'highlight-indentation-mode))

(use-package highlight-numbers
  :ensure t
  :commands highlight-numbers-mode
  :init
  (add-hook 'prog-mode-hook 'highlight-numbers-mode))


(use-package highlight-symbol
  :ensure t
  :diminish highlight-symbol-mode
  :config
  (setq highlight-symbol-idle-delay 0.5
	  highlight-symbol-occurrence-message '(explicit nivigation temporary)))


  ; deletes all the whitespace when you hit backspace or delete
  (use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))
  

  (use-package multiple-cursors
  :ensure t)

  ; expand the marked region in semantic increments (negative prefix to reduce region)
  (use-package expand-region
  :ensure t
  :config 
  (global-set-key (kbd "C-=") 'er/expand-region))

(setq save-interprogram-paste-before-kill t)


(global-auto-revert-mode 1) ;; you might not want this
(setq auto-revert-verbose nil) ;; or this
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "<f6>") 'revert-buffer)



(provide 'init-face)
