(use-package cc-mode
  :bind (:map c-mode-base-map
         ("C-c c" . compile))
  :hook (c-mode-common . (lambda ()
			   ;; (display-line-numbers-mode)
			   ;; (linum-relative-mode)
                            (c-set-style "bsd")
                            (setq tab-width 8)
                            (setq c-base-offset 8))))
;;(add-hook 'c-mode-common-hook 'linum-relative-mode)

;; (use-package google-c-style
;;   :ensure t
;;   :config
;;   (add-hook 'c-mode-common-hook 'google-set-c-style)
;;   (add-hook 'c-mode-common-hook 'google-make-newline-indent)
;;   )

;;; clang-format configuration
(use-package clang-format
  :ensure t
  :config
  (progn
    (defun clang-format-on-save ()
      (add-hook 'before-save-hook #'clang-format-buffer nil 'local))
    (add-hook 'c++-mode-hook 'clang-format-on-save)
    (add-hook 'c-mode-hook 'clang-format-on-save)
    )
  )

(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "/usr/bin/ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))

;; (setq lldb-executable "usr/bin/lldb")


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



 (require 'compile)
 (add-hook 'c-mode-common-hook
           (lambda ()
	     (unless (file-exists-p "Makefile")
	       (set (make-local-variable 'compile-command)
                    ;; emulate make's .c.o implicit pattern rule, but with
                    ;; different defaults for the CC, CPPFLAGS, and CFLAGS
                    ;; variables:
                    ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
		    (let ((file (file-name-nondirectory buffer-file-name)))
                      (format "%s -o %s %s %s %s"
                              (or (getenv "CC") "clang")
                              (file-name-sans-extension file)
                              (or (getenv "CPPFLAGS") "-DDEBUG=9")
;;                              (or (getenv "CFLAGS") "-ansi -pedantic -Wall -g")
			      (or (getenv "CFLAGS") "-std=c11 -pedantic -Wall -g")
			      file))))))
(provide 'init-cc-mode)
