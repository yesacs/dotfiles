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
;;(setq cider-clojure-cli-global-options nil)

;(add-to-list 'warning-suppress-types '(undo discard-info))

;; make ligatures work
(mac-auto-operator-composition-mode)

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

;;(setq doom-theme 'doom-dracula)
(setq doom-theme 'doom-palenight)

(add-hook 'after-init-hook #'global-prettier-mode)

(setq company-tooltip-align-annotations t)
