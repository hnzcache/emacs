(setq gdb-many-windows t
      gdb-show-main t)

(use-package realgud
  :ensure t
  )
(use-package realgud-jdb
  :ensure t)
(use-package realgud-lldb
  :bind (("C-c d" . lldb))
  :ensure t)



(provide 'init-debug)
