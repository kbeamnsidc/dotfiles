;;; lsp-lm --- LSP using lsp-mode and related pkgs -- lsp-lm
;;; Commentary:
;;; Code:

;; ----------------------------------------------------------
;; LSP - lsp-mode
;; ----------------------------------------------------------
;; https://emacs-lsp.github.io/lsp-mode/
;; https://github.com/emacs-lsp/lsp-mode
(use-package lsp-mode
  :ensure t
  :hook ((python-mode . lsp)
         (js-mode . lsp)
         (typescript-mode . lsp)
         (fortran-mode . lsp)
         (f90-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq
   read-process-output-max (* 1024 1024)
   lsp-idle-delay 0.500
   lsp-clients-typescript-tls-path "npx typescript-language-server"
   lsp-pyls-plugins-pydocstyle-enabled t
   lsp-pyls-plugins-yapf-enabled t
   lsp-pyls-plugins-flake8-enabled t
   lsp-pyls-plugins-pycodestyle-enabled nil
   lsp-pyls-plugins-pyflakes-enabled nil))
(setq lsp-keymap-prefix "C-c l")

;; https://emacs-lsp.github.io/lsp-ui/
;; https://github.com/emacs-lsp/lsp-ui
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
   lsp-ui-doc-position 'bottom
   ))

(use-package dap-mode
  :ensure t
  :config
  (dap-ui-mode 1)
  (dap-tooltip-mode 1)
  (setq dap-python-debugger 'debugpy)
  (require 'dap-python))


(provide 'lsp-lm)

;;; dev-lsp.el ends here
