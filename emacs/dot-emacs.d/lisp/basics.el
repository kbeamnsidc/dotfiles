;;; basics --- basic configuration
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
      (set-frame-size (selected-frame) 90 56)))

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

;; (use-package no-littering
;;   :ensure t)

(setq bookmark-default-file "~/.emacs.d/var/bookmarks")
(setq bookmark-save-flag 1)

;; (use-package dashboard
;;   :ensure t
;;   :config
;;   (dashboard-setup-startup-hook)
;;   (setq dashboard-set-init-info t)
;;   (setq dashboard-items '((recents  . 5)
;;                         (bookmarks . 5)
;;                         (projects . 5)
;;                         (agenda . 5)
;;                         (registers . 5))))

(provide 'basics)

;;; basics.el ends here
