(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(flymake-eslint))
 '(safe-local-variable-values
   '((projectile-project-type . clojure-cli)
     (cider-ns-refresh-show-log-buffer . f)
     (cider-ns-refresh-after-fn . "config.system/start-system!")
     (cider-ns-refresh-before-fn . "config.system/stop-system!")
     (cider-clojure-cli-aliases . "-M:test:local:tasks"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
