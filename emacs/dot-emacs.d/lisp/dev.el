;;; dev-lsp --- Dev modes setup -- lsp
;;; Commentary:
;;; Code:

;; ----------------------------------------------------------
;; Add default behavior to all programming modes
;; ----------------------------------------------------------
(add-hook 'prog-mode-hook
	  (lambda ()
	    (set (make-local-variable 'comment-auto-fill-only-comments) t)
	    (auto-fill-mode t)
	    (add-hook 'before-save-hook 'delete-trailing-whitespace)))

;; ----------------------------------------------------------
;; JavaScript & TypeScript
;; ----------------------------------------------------------
;; https://github.com/codesuki/add-node-modules-path
;; (use-package add-node-modules-path
;;   :ensure t
;;   :pin melpa-stable
;;   :hook (js-mode typescript-mode))

;; https://github.com/emacs-typescript/typescript.el
;; (use-package typescript-mode
;;   :ensure t)

;; https://github.com/rymndhng/jest-test-mode
;; (use-package jest-test-mode
;;   :ensure t
;;   :defer t
;;   :commands jest-test-mode
;;   :init
;;   (add-hook 'typescript-mode-hook 'jest-test-mode)
;;   (add-hook 'js-mode-hook 'jest-test-mode))

;; ----------------------------------------------------------
;; Python
;; ----------------------------------------------------------
;; Built-in python mode
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

(provide 'dev)

;;; dev-lsp.el ends here
