    (use-package projectile
      :ensure t
      :bind ("C-c p" . projectile-command-map)
      :config
      (projectile-global-mode t) 
    (setq projectile-completion-system 'ivy))

    ;; (use-package counsel-projectile
    ;;   :ensure t
    ;;   :config
    ;;   (counsel-projectile-on)q)



(provide 'init-projectile)


