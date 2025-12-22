;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f9d423fcd4581f368b08c720f04d206ee80b37bfb314fa37e279f554b6f415e9"
     default))
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(auto-dark catppuccin-theme cider company markdown-mode
	       rainbow-delimiters smartparens))
 '(tool-bar-mode nil))

(menu-bar-mode -1)
(column-number-mode)
(global-company-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMonoNL Nerd Font" :foundry "JB" :slant normal :weight regular :height 98 :width normal)))))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'smartparens-config)

(load-theme 'catppuccin t)

(require 'auto-dark)
(use-package auto-dark
  :ensure t
  :config
  (ignore-errors
    (setq auto-dark-themes '((catppuccin) (catppuccin)))

    (add-hook 'auto-dark-dark-mode-hook
              (lambda ()
                (setq catppuccin-flavor 'macchiato)
                (catppuccin-reload)))

    (add-hook 'auto-dark-light-mode-hook
              (lambda ()
                (setq catppuccin-flavor 'latte)
                (catppuccin-reload)))

    (auto-dark-mode 1)))

(defun open-init-el ()
  "Open ~/.emacs.d/init.el"
  (interactive)
  (find-file "~/.emacs"))

(defun setup-clojure ()
  (smartparens-mode)
  (rainbow-delimiters-mode))

(add-hook 'clojure-mode-hook 'setup-clojure)

(if (window-system)
    (set-frame-size (selected-frame) 155 45))

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq use-dialog-box nil)
(global-display-line-numbers-mode t)
(put 'dired-find-alternate-file 'disabled nil)
