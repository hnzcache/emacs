;;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;(display-battery-mode 1)
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

;; (setq inhibit-splash-screen t)
;; (setq initial-scratch-message
;;       "Happy Hacking Emacs!♡ you!")



(setq initial-frame-alist (quote ((fullscreen . maximized))))
(setq select-enable-clipboard t)


(use-package smartparens
:ensure t
  :hook (prog-mode . smartparens-mode)
  :custom
  (sp-escape-quotes-after-insert nil)
  :config
  (require 'smartparens-config))

(setq-default show-paren-delay 0)
(show-paren-mode t)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'linum-relative-mode)

(provide 'init-general)
