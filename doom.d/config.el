(setq doom-leader-key "SPC"
      doom-localleader-key ",")

(map! :leader
      "p a" #'projectile-toggle-between-implementation-and-test)

(map! :leader
      "w =" #'balance-windows-area)

(map! :map cider-repl-mode-map
      (:localleader
       "b" #'cider-switch-to-last-clojure-buffer))

(map! :map (clojure-mode-map clojurescript-mode-map)
      (:localleader
       "b" #'cider-switch-to-repl-buffer))

(setq doom-font (font-spec :family "Hack Nerd Font Mono"
                           :size 11))

(setq doom-themes-treemacs-enable-variable-pitch nil)

(with-eval-after-load "treemacs" (treemacs-follow-mode t))

;(setq cider-clojure-cli-global-options "-A:test:local -m nrepl.cmdline --middleware '[\"refactor-nrepl.middleware/wrap-refactor\", \"cider.nrepl/cider-middleware\"]'")
;(setq cider-clojure-cli-global-options nil)

;(add-to-list 'warning-suppress-types '(undo discard-info))

;; make ligatures work
;(mac-auto-operator-composition-mode)

(setq lsp-ui-sideline-show-code-actions nil)
(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-doc-show-with-cursor nil)

(add-hook 'lisp-mode-hook #'evil-cleverparens-mode)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; so vagrant jack-in works
;;(setq nrepl-use-ssh-fallback-for-remote-hosts t)

;; -- MY CHANGES --
(map! :map (clojure-mode-map clojurescript-mode-map)
      (:localleader
       "f b" #'cider-format-buffer
       "f r" #'cider-format-region))

;;(setq doom-theme 'doom-vibrant)
;;(setq doom-theme 'doom-dracula)
;;(setq doom-theme 'doom-ephemeral)
(setq doom-theme 'doom-monokai-pro)

(setq fill-column-indicator 1)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; (setq fill-column 80)
;; (setq display-fill-column-indicator-column 80)
;;
;; (global-display-fill-column-indicator-mode)
;;
;; (map! :leader
;;       "t t" #'+neotree/open)
;;
;; tide - config
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (flycheck-select-checker 'javascript-eslint)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))
;;
;; ;; aligns annotation to the right hand side
;; (setq company-tooltip-align-annotations t)
;;
;; (use-package tide
;;   :ensure t
;;   :after ((typescript-mode company flycheck)
;;           (rjsx-mode company flycheck))
;;   :hook ((typescript-mode . tide-setup)
;;          (typescript-mode . tide-hl-identifier-mode)
;;          (rjsx-mode . tide-setup)
;;          (rjsx-mode . tide-hl-identifier-mode)))
;;
;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
;; (add-hook 'rjsx-mode-hook #'setup-tide-mode)
;;
;; ;; tide - config end
;;
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
;; (add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))
;;
;; ;; start the lsp on open
;; (add-hook 'css-mode-hook 'lsp)
;; (add-hook 'scss-mode-hook 'lsp)
;; (add-hook 'clojure-mode-hook 'lsp)
;; (add-hook 'rjsx-mode-hook 'lsp)
;; (add-hook 'js2-mode-hook 'lsp)
;; (add-hook 'typescript-mode-hook 'lsp)
;;
;; prettier setup
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'css-mode-hook 'prettier-js-mode)
(add-hook 'scss-mode-hook 'prettier-js-mode)

;;
;; ;; node-repl setup
;; (map! :map (rjsx-mode-map typescript-mode-map)
;;   (:localleader
;;     ("'"   #'nodejs-repl)
;;     ("b"   #'nodejs-repl-switch-to-repl)
;;     ("e e" #'nodejs-repl-send-line)
;;     ("e r" #'nodejs-repl-send-region)
;;     ("e f" #'nodejs-repl-send-buffer)
;;     ("e b" #'nodejs-repl-send-buffer)))
;;
;; (setq doom-modeline-buffer-file-name-style 'truncate-with-project)
