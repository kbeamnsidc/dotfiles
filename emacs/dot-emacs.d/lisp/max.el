;;; max --- basic configuration
;;; Commentary:
;;; Code:

(require 'server)
(if (not (server-running-p))
    (server-start))

(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 1)
(setq blink-cursor-blinks 0)
;;(global-font-lock-mode nil)
(setq font-lock-maximum-decoration nil)

(column-number-mode t)
(global-display-line-numbers-mode)
(setq select-enable-clipboard t)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(random t)

(if (display-graphic-p)
    (progn
      (set-frame-font "Roboto Mono-12")
      ;; TODO: Why do I need to add 1 to each dimension?
      (set-frame-size (selected-frame) 91 56)))

(setq uniquify-buffer-name-style 'forward)
(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))
(set-default 'indent-tabs-mode nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(global-auto-revert-mode t)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq create-lockfiles nil)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq custom-file (locate-user-emacs-file ".custom.el"))
(load custom-file t t)

;; Use ido mode
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode t)

;; keybindings
(global-set-key (kbd "C-x C-b") 'ibuffer)
(windmove-default-keybindings)

(setq bookmark-default-file "~/.emacs.d/var/bookmarks")
(setq bookmark-save-flag 1)

;; https://github.com/abo-abo/ace-window
(use-package ace-window
  :ensure t
  :init
  (bind-key "M-o" 'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)))

;; https://company-mode.github.io/
(use-package company
  :ensure t
  :pin melpa-stable
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-tooltip-idle-delay 0)
  (setq company-idle-delay 0)
  (setq company-tooltip-align-annotations t)
  (global-set-key (kbd "<C-tab>") 'company-complete))

;; https://github.com/bbatsov/crux
(use-package crux
  :ensure t
  :bind (("M-p" . crux-smart-open-line-above)
         ("M-n" . crux-smart-open-line)))

;; https://github.com/Wilfred/deadgrep
(use-package deadgrep
  :ensure t
  :bind
  ("C-c r" . deadgrep))

;; https://github.com/emacs-dashboard/emacs-dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-set-init-info t)
  (setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5))))

;; https://github.com/purcell/default-text-scale
;; C-M-= Increase
;; C-M-- Decrease
(use-package default-text-scale
  :ensure t
  :config (default-text-scale-mode))

;; https://github.com/Silex/docker.el
(use-package docker
  :ensure t)

;; https://github.com/spotify/dockerfile-mode
(use-package dockerfile-mode
  :ensure t)

;; https://github.com/meqif/docker-compose-mode
(use-package docker-compose-mode
  :ensure t)

;; https://github.com/bbatsov/solarized-emacs
(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-light t)
  (setq solarized-use-less-bold t))

;; (use-package simple-modeline
;;   :ensure t
;;   :hook (after-init . simple-modeline-mode))

;; https://gitlab.com/jessieh/mood-line
(use-package mood-line
  :ensure t
  :config
  (mood-line-mode))

;; https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :pin melpa-stable
  :defer t
  :config
  (exec-path-from-shell-initialize))

;; http://www.flycheck.org/en/latest/
(use-package flycheck
  :ensure t)

;; https://github.com/bling/fzf.el
(use-package fzf
  :ensure t
  :bind
  ("C-c f" . fzf))

;; https://gitlab.com/pidu/git-timemachine
(use-package git-timemachine
  :ensure t
  :pin melpa-stable)

;; https://github.com/chrisbarrett/kubernetes-el
(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview))

;; https://magit.vc/
(use-package magit
  :ensure t
  :pin melpa-stable
  :bind
  ("C-c g" . magit-status)
  :config
  (setq magit-last-seen-setup-instructions "1.4.0")
  (setq magit-push-always-verify nil))

;; https://github.com/magnars/multiple-cursors.el
(use-package multiple-cursors
  :ensure t
  :pin melpa-stable
  :bind (("C-S-c C-S-c" . 'mc/edit-lines)
         ("C->" . 'mc/mark-next-like-this)
         ("C-<" . 'mc/mark-previous-like-this)
         ("C-c C-<" . 'mc/mark-all-like-this)))

;; https://github.com/jrblevin/markdown-mode
(use-package markdown-mode
  :ensure t
  :pin melpa
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))

(use-package no-littering
  :ensure t
  :config
  (setq custom-file (no-littering-expand-etc-file-name "custom.el")))

;; TODO: org, org-babel, org-restclient

;; https://github.com/bbatsov/projectile
(use-package projectile
  :ensure t
  :pin melpa-stable
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

;; https://github.com/pashky/restclient.el
(use-package restclient
  :ensure t)

;; https://github.com/Fuco1/smartparens
(use-package smartparens
  :ensure t
  :pin melpa-stable
  :config
  (require 'smartparens-config)
  (show-paren-mode t))

;; https://github.com/TxGVNN/terraform-doc
(use-package terraform-doc
  :ensure t)

;; https://github.com/emacsorphanage/terraform-mode
(use-package terraform-mode
  :ensure t)

;; https://github.com/akermu/emacs-libvterm
(use-package vterm
  :ensure t
  :bind ("C-c t" . vterm)
  :config
  (setq vterm-max-scrollback (* 8 1024)))

;; TODO: vterm-toggle

;; https://github.com/justbur/emacs-which-key/
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (which-key-setup-side-window-right))

;; https://github.com/yaml/yaml-mode
(use-package yaml-mode
  :ensure t)

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
(use-package add-node-modules-path
  :ensure t
  :pin melpa-stable
  :hook (js-mode typescript-mode))

;; https://github.com/emacs-typescript/typescript.el
(use-package typescript-mode
  :ensure t)

;; https://github.com/rymndhng/jest-test-mode
(use-package jest-test-mode
  :ensure t
  :defer t
  :commands jest-test-mode
  :init
  (add-hook 'typescript-mode-hook 'jest-test-mode)
  (add-hook 'js-mode-hook 'jest-test-mode))

;; ----------------------------------------------------------
;; Python
;; ----------------------------------------------------------
;; Built-in python mode
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

;; https://github.com/galaunay/poetry.el
(use-package poetry
  :ensure t)

;; https://github.com/jorgenschaefer/pyvenv
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1))

;; https://github.com/wbolster/emacs-python-pytest
(use-package python-pytest
  :ensure t
  :commands (python-pytest-dispatch)
  :bind ("C-c u" . python-pytest-dispatch))

;; https://github.com/nnicandro/emacs-jupyter
(use-package jupyter
  :ensure t)

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

(provide 'max)

;;; max.el ends here
