(use-package pyim
  :ensure t
  :demand t
  :config
  ;; active basedict 
  (use-package pyim-basedict
    :ensure t
    :config (pyim-basedict-enable))

  ;; (setq default-input-method "pyim")

  ;;quan pin
  (setq pyim-default-scheme 'quanpin))



(provide 'init-inputway)
