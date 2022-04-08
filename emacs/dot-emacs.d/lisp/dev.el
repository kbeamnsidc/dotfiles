;;; dev-lsp --- Dev modes setup -- lsp
;;; Commentary:
;;; Code:

;; ----------------------------------------------------------
;; LSP - lsp-mode
;; ----------------------------------------------------------
(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq
   read-process-output-max (* 1024 1024)
   lsp-enable-snippet nil
   lsp-idle-delay 0.500
   lsp-pyls-plugins-pydocstyle-enabled t
   lsp-pyls-plugins-yapf-enabled t
   lsp-pyls-plugins-flake8-enabled t
   lsp-pyls-plugins-pycodestyle-enabled nil
   lsp-pyls-plugins-pyflakes-enabled nil))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  (setq
   lsp-ui-sideline-enable t
   lsp-ui-sideline-show-diagnostics t
   lsp-ui-sideline-show-hover t
   lsp-ui-sideline-show-code-actions t
   ;; ----------------------------------------
   lsp-ui-peek-enable t
   lsp-ui-peek-list-width 60
   lsp-ui-peek-peek-height 25
   ;; ----------------------------------------
   lsp-ui-doc-enable t
   lsp-ui-doc-use-childframe t
   lsp-ui-doc-show-with-cursor t))

(use-package lsp-treemacs
  :ensure t
  :after lsp)

(use-package dap-mode
  :ensure t
  :commands dap-debug
  :config
  (dap-auto-configure-mode 1)
  ;; (dap-ui-mode 1)
  ;; (dap-tooltip-mode 1)
  (require 'dap-python)
  (setq dap-python-debugger 'debugpy)
  (require 'dap-node)
  (dap-node-setup))

;; ----------------------------------------------------------
;; JavaScript & TypeScript
;; ----------------------------------------------------------
;; https://github.com/codesuki/add-node-modules-path
(use-package add-node-modules-path
  :ensure t
  :pin melpa-stable
  :hook (js-mode typescript-mode))

;; https://github.com/emacs-typescript/typescript.el
(use-package typescript-mode
  :ensure t
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

;; ----------------------------------------------------------
;; Julia
;; ----------------------------------------------------------
;; https://github.com/JuliaEditorSupport/julia-emacs
(use-package julia-mode
  :ensure t)

;; ----------------------------------------------------------
;; Python
;; ----------------------------------------------------------
;; Use built-in python mode

;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "-i")

;; https://github.com/galaunay/poetry.el
;; (use-package poetry
;;   :ensure t)

;; https://github.com/jorgenschaefer/pyvenv
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1))

;; https://github.com/wbolster/emacs-python-pytest
;; (use-package python-pytest
;;   :ensure t
;;   :commands (python-pytest-dispatch)
;;   :bind ("C-c u" . python-pytest-dispatch))

;; https://github.com/nnicandro/emacs-jupyter
;; (use-package jupyter
;;   :ensure t)

;; ----------------------------------------------------------
;; Scheme
;; ----------------------------------------------------------
;; https://www.nongnu.org/geiser/
(use-package geiser-mit
  :ensure t)

(use-package geiser-racket
  :ensure t)

(provide 'dev)

;;; dev-lsp.el ends here
