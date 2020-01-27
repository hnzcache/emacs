(prefer-coding-system 'utf-8)
 (set-default-coding-systems 'utf-8)


(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(display-battery-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time-mode 1)

(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

(global-font-lock-mode t)
(setq-default transient-mark-mode t)

(setq make-backup-files nil)
(setq auto-save-default nil)
(delete-selection-mode t)

(setq make-pointer-invisible t)

;; (setq inhibit-splash-screen t)
;; (setq initial-scratch-message
;;       "Happy Hacking Emacs!♡ you!")



(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq select-enable-clipboard t)


;; (use-package smartparens
;; :ensure t
;;   :hook (prog-mode . smartparens-mode)
;;   :custom
;;   (sp-escape-quotes-after-insert nil)
;;   :config
;;   (require 'smartparens-config))

(setq-default show-paren-delay 0)
(show-paren-mode t)

;;linum mode settings
(use-package linum-relative
  :ensure t
  :config
  ;; Use `display-line-number-mode` as linum-mode's backend for smooth performance
  
  (setq linum-relative-backend 'display-line-numbers-mode))

(setq display-line-numbers-type 'visual)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'linum-relative-mode)


;; ;; auto save
;;  (auto-save-visited-mode t)
;;  (setq  auto-save-default t
;; 	 auto-save-timeout 20
;; 	 auto-save-interval 20)
;;  (defvar emacs-autosave-directory
;;    (concat user-emacs-directory "autosaves/"))

;;  (unless (file-exists-p emacs-autosave-directory)
;;    (make-directory emacs-autosave-directory))

;;  (setq auto-save-file-name-transforms
;; 	`((".*" ,emacs-autosave-directory t)))
 ;; backup
 (setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
	kept-new-versions 10
	kept-old-versions 0
	delete-old-versions t
	backup-by-copying t
	vc-make-backup-files t)
 (setq delete-by-moving-to-trash t)

;; save desktop
(use-package desktop
  :ensure t
  :config
  (add-to-list 'desktop-globals-to-save 'register-alist)
  (setq desktop-lazy-verbose nil
	desktop-restore-eager 15)
  (desktop-save-mode 1))


  (use-package recentf
    :ensure nil
    :init
    (add-hook 'find-file-hook (lambda () (unless recentf-mode
						 (recentf-mode)
						 (recentf-track-opened-file))))
    :config
    (progn
      (setq recentf-max-saved-items 500
	    recentf-auto-cleanup 'never)
	    ;; recentf-exclude '("/.emacs.d/pyim/" "/.elfeed/"))
      (recentf-mode 1)))


(provide 'init-general)
