(use-package hydra
  :ensure t
  :config
  (setq hydra-hint-display-type 'my/posframe)
  (defun my/hydra-posframe-show (str)
    (require 'posframe)
    (posframe-show
     " *hydra-posframe*"
     :string str
     :point (point)
     :internal-border-color "gray50"
     :internal-border-width 2
     :poshandler #'posframe-poshandler-frame-top-center))
  (defun my/hydra-posframe-hide ()
    (posframe-hide " *hydra-posframe*"))
  (setq hydra-hint-display-alist
	  (list (list 'my/posframe #'my/hydra-posframe-show #'my/hydra-posframe-hide))
	  hydra--work-around-dedicated nil)
      (setq alan--general-lsp-hydra-heads
        '(;; Xref
          ("d" xref-find-definitions "Definitions" :column "Xref")
          ("D" xref-find-definitions-other-window "-> other win")
          ("r" xref-find-references "References")
          ("s" alan/helm-lsp-workspace-symbol-at-point "Helm search")
          ("S" alan/helm-lsp-global-workspace-symbol-at-point "Helm global search")

          ;; Peek
          ("C-d" lsp-ui-peek-find-definitions "Definitions" :column "Peek")
          ("C-r" lsp-ui-peek-find-references "References")
          ("C-i" lsp-ui-peek-find-implementation "Implementation")

          ;; LSP
          ("p" lsp-describe-thing-at-point "Describe at point" :column "LSP")
          ("C-a" lsp-execute-code-action "Execute code action")
          ("R" lsp-rename "Rename")
          ("t" lsp-goto-type-definition "Type definition")
          ("i" lsp-goto-implementation "Implementation")
          ("f" helm-imenu "Filter funcs/classes (Helm)")
          ("C-c" lsp-describe-session "Describe session")

          ;; Flycheck
          ("l" lsp-ui-flycheck-list "List errs/warns/notes" :column "Flycheck"))

        alan--misc-lsp-hydra-heads
        '(;; Misc
          ("q" nil "Cancel" :column "Misc")
          ("b" pop-tag-mark "Back")))

  ;; Create general hydra.
  (eval `(defhydra alan/lsp-hydra (:color blue :hint nil)
           ,@(append
              alan--general-lsp-hydra-heads
              alan--misc-lsp-hydra-heads)))

  (add-hook 'lsp-mode-hook
            (lambda () (local-set-key (kbd "<f2>") 'alan/lsp-hydra/body))))  



;; (defhydra hydra-lsp  (:exit t :hint nil)

;;   "
;;  Buffer^^               Server^^                   Symbol
;; -------------------------------------------------------------------------------------
;;  [_f_] format           [_M-r_] restart            [_d_] declaration  [_i_] implementation  [_o_] documentation
;;  [_m_] imenu            [_S_]   shutdown           [_D_] definition   [_t_] type            [_r_] rename
;;  [_x_] execute action   [_M-s_] describe session   [_R_] references   [_s_] signature"
;;   ("d" lsp-find-declaration)
;;   ("D" lsp-find-definitions)
;;   ("R" lsp-find-references)
;;   ("i" lsp-find-implementation)
;;   ("t" lsp-find-type-definition)
;;   ("s" lsp-signature-help)
;;   ("o" lsp-describe-thing-at-point)
;;   ("r" lsp-rename)

;;   ("f" lsp-format-buffer)
;;   ("m" lsp-ui-imenu)
;;   ("x" lsp-execute-code-action)

;;   ("M-s" lsp-describe-session)
;;   ("M-r" lsp-restart-workspace)
;;   ("S" lsp-shutdown-workspace))
;; (global-set-key (kbd "<f2>") 'hydra-lsp/body)


(provide 'init-hydra)
