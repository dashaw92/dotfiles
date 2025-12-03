;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(catppuccin-theme cider markdown-mode rainbow-delimiters smartparens))
 '(tool-bar-mode nil))

(defun open-init-el ()
  "Open ~/.emacs.d/init.el"
  (interactive)
  (find-file "~/.emacs"))
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

(setq catppuccin-flavor 'macchiato) ; or 'latte, 'macchiato, or 'mocha
(load-theme 'catppuccin t)

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
