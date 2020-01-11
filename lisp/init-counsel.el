(use-package counsel
	     :ensure t
	     :bind
	     (("M-y" . counsel-yank-pop)
	      :map ivy-minibuffer-map
	      ("M-y" . ivy-next-line)))

(setq counsel-find-file-ignore-regexp
        (concat
         ;; File names beginning with # or .
         "\\(?:\\`[#.]\\)"
         ;; File names ending with # or ~
         "\\|\\(?:\\`.+?[#~]\\'\\)"))





(provide 'init-counsel)
