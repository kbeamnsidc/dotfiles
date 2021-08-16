;;; lsp-eglot --- Dev modes setup -- lsp-eglot
;;; Commentary:
;;; Code:

;; ----------------------------------------------------------
;; LSP - eglot
;; ----------------------------------------------------------
;; https://github.com/joaotavora/eglot
(use-package eglot
  :ensure t
  :hook ((python-mode . eglot-ensure)
         (js-mode . eglot-ensure)
         (typescript-mode . eglot-ensure)
         (fortran-mode . eglot-ensure)
         (f90-mode . eglot-ensure))
  :config
  (define-key eglot-mode-map (kbd "C-c f") 'eglot-format)
  (define-key eglot-mode-map (kbd "C-c a") 'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c h") 'eldoc)
  (define-key eglot-mode-map (kbd "C-c d") 'eglot-find-declaration)
  (define-key eglot-mode-map (kbd "C-c i") 'eglot-find-implementation)
  (define-key eglot-mode-map (kbd "C-c t") 'eglot-find-typeDefinition)
  (define-key eglot-mode-map (kbd "M-.") 'xref-find-definitions)
  (define-key eglot-mode-map (kbd "M-?") 'xref-find-references))

(provide 'lsp-eglot)

;;; dev-lsp.el ends here
