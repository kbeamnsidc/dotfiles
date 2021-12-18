;;; min --- basic configuration
;;; Commentary:
;;; Code:

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

;; https://github.com/bbatsov/crux
(use-package crux
  :ensure t
  :bind (("M-p" . crux-smart-open-line-above)
         ("M-n" . crux-smart-open-line)))

;; https://github.com/bbatsov/solarized-emacs
(use-package solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-light t)
  (setq solarized-use-less-bold t))

;; https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :pin melpa-stable
  :defer t
  :config
  (exec-path-from-shell-initialize))

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

;; https://github.com/akermu/emacs-libvterm
(use-package vterm
  :ensure t
  :bind ("C-c t" . vterm)
  :config
  (setq vterm-max-scrollback (* 8 1024)))

;; ----------------------------------------------------------
;; Add default behavior to all programming modes
;; ----------------------------------------------------------
(add-hook 'prog-mode-hook
	  (lambda ()
	    (set (make-local-variable 'comment-auto-fill-only-comments) t)
	    (auto-fill-mode t)
	    (add-hook 'before-save-hook 'delete-trailing-whitespace)))

;; https://github.com/jorgenschaefer/pyvenv
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1))

(provide 'min)

;;; min.el ends here
