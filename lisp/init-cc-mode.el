(use-package linum-relative
  :ensure t
  :config
   ;; Use `display-line-number-mode` as linum-mode's backend for smooth performance
  (setq linum-relative-backend 'display-line-numbers-mode))
(use-package cc-mode
  :bind (:map c-mode-base-map
         ("C-c c" . compile))
  :hook (c-mode-common . (lambda ()
			   (display-line-numbers-mode)
			   (linum-relative-mode)
                            (c-set-style "bsd")
                            (setq tab-width 8)
                            (setq c-base-offset 8))))
(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "/usr/bin/ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))

(setq lldb-executable "usr/bin/lldb")

(use-package company-c-headers
  :ensure t
  :config
  (progn
    (setq company-c-headers-path-system '(
                                          "/usr/include/c++/9.2.0"
                                          "/usr/include/x86_64-linux-gnu/c++/9.2.0"
                                          "/usr/include/c++/9.2.0/backward"
                                          "/usr/lib/gcc/x86_64-pc-linux-gnu/9.2.0/include"
                                          "/usr/local/include"
                                          "/usr/lib/gcc/x86_64-pc-linux-gnu/9.2.0/include-fixed"
                                          "/usr/include"
                                          ))
    (add-to-list 'company-backends 'company-c-headers)
    )
  )
(use-package irony
  :ensure t
  :config
  (progn
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'objc-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    )
  )


(use-package irony-eldoc
  :ensure t
  :config
  (add-hook 'irony-mode-hook #'irony-eldoc)
  )

(use-package company-irony
  :ensure t
  :after(company)
  :config
  (progn
    (add-to-list 'company-backends 'company-irony)
    )
  )

(use-package company-irony-c-headers
  :ensure t
  :after(company)
  :config
  (progn
    (add-to-list
     'company-backends '(company-irony-c-headers company-irony))
    )
  )

(use-package flycheck-irony
  :ensure t
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
  )

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(use-package function-args
  :ensure t
  :config
  (progn
    (fa-config-default)
    (require 'semantic)
    (set-default 'semantic-case-fold t)
    ;; (semantic-add-system-include "~/software/boost_1_64_0/" 'c++-mode)
    (require 'semantic/bovine/c)
    (add-to-list 'semantic-lex-c-preprocessor-symbol-file
		 "/usr/lib/gcc/x86_64-pc-linux-gnu/9.2.0/include/stddef.h")
    )
  )

(use-package stickyfunc-enhance
  :ensure t
  :init
  (progn
    (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
    (semantic-mode 1)
    )
  )

(provide 'init-cc-mode)
