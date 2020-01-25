(setq max-lisp-sc 10000)
(setq max-specpdl-size 10000)


;; (setq url-proxy-services   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;; 			     ("http" . "127.0.0.1:1080")
;; 			     ("https" . "127.0.0.1:1080")))


(setq package-enable-at-startup nil)
(require 'package)

(setq package-archives '(

                         ("gnu"   . "https://elpa.emacs-china.org/gnu/")

                         ("melpa" . "https://elpa.emacs-china.org/melpa/")

                         ))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))



(use-package diminish
  :ensure t)
(require 'diminish)
(setq use-package-verbose t)







(push (expand-file-name "~/.config/emacs/lisp") load-path)
(defconst *is-a-linux* (eq system-type 'gnu/linux))


;;load path

(setenv "PATH"
        (concat
         "/usr/local/texlive/2019/bin/x86_64-linux" ":"
	 "/usr/bin" ":"
	 "/usr/local/bin" ":"
	 "/usr/java/jdk-13/bin" ":"
         (getenv  "PATH")
         )
    )
(let (
        (mypaths
         '(
           "/usr/local/texlive/2019/bin/x86_64-linux"
	   	 "/usr/bin"
		 "/usr/local/bin"
		 
           ))
        )
    (setq exec-path (append exec-path mypaths) )
    )



(require 'init-general)
(require 'init-face)
(require 'init-cc-mode)
(require 'init-ivy)
(require 'init-swiper)
(require 'init-counsel)
(require 'init-projectile)
(require 'init-dired)
(require 'init-flycheck)
(require 'init-spell)
(require 'init-treemacs)
(require 'init-jump)
(require 'init-yasnippet)
(require 'init-pdf)
(require 'init-company)
(require 'init-tex)
(require 'init-hydra)
(require 'init-helm)
(require 'init-lsp)
(require 'init-python)
(require 'init-scheme)
(require 'init-nasm)
(require 'init-git)
;;(require 'init-leetcode)





(use-package vterm
  :ensure t)












(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "APPL" :slant normal :weight normal :height 158 :width normal))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0)))))
(use-package molokai-theme
  :ensure t
  :config
  (load-theme 'molokai t))
(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(all-the-icons-ivy-buffer-commands '(ivy-switch-buffer-other-window ivy-switch-buffer))
 '(ccls-executable "/usr/bin/ccls")
 '(ccls-sem-highlight-method 'font-lock)
 '(package-selected-packages
   '(geiser company-anaconda anaconda-mode molokai-theme dap-mode lsp-java lsp-treemacs yasnippet-snippets use-package treemacs-projectile treemacs-magit treemacs-icons-dired synosaurus stickyfunc-enhance rainbow-delimiters org-pdfview multiple-cursors lsp-ui irony-eldoc hungry-delete highlight-symbol highlight-parentheses highlight-numbers function-args flycheck-irony flycheck-color-mode-line expand-region dumb-jump dired-subtree dired-narrow dictionary counsel company-tabnine company-lsp company-irony-c-headers company-irony company-c-headers company-auctex beacon all-the-icons-ivy all-the-icons-dired))
 '(sp-escape-quotes-after-insert nil))

(setq make-pointer-invisible t)
