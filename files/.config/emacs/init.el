;;; init.el -*- lexical-binding: t; -*-
;;; Commentary:
;; Opinionated Emacs config.
;;; Code:

(setq initial-scratch-message nil
      initial-major-mode 'emacs-lisp-mode
      inhibit-startup-screen t)

;; Disable UI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Utilize separate custom-set-variables file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; Wayland optimization
(setq-default pgtk-wait-for-event-timeout 0)

;; Disable backup files
(setq make-backup-files nil)

;; Enable final newlines
(setq require-final-newline t)

;; Define indentation rules
(setq-default indent-tabs-mode nil)

;; Display line numbers
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Load theme and define font
(load-theme 'modus-vivendi t)
(set-face-attribute 'default nil :font "Fira Code" :height 160)
(set-face-attribute 'italic nil :font "Victor Mono" :height 160)

;; Initialize package archives
(require 'package)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Package configuration
(use-package vertico
  :ensure t
  :init
  (setq enable-recursive-minibuffers t)
  :config
  (vertico-mode t))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  (corfu-history-mode)
  :config
  (setq corfu-auto t
        corfu-cycle t
        corfu-on-exact-match nil
        corfu-preselect 'prompt)
  :bind (:map corfu-map
              ("TAB" . corfu-next)
              ([tab] . corfu-next)
              ("S-TAB" . corfu-previous)
              ([backtab] . corfu-previous)))

(use-package lsp-mode
  :ensure t
  :defer t
  :commands (lsp lsp-deferred)
  :config
  (setq gc-cons-threshold 100000000
        read-process-output-max (* 1024 1024)
        lsp-completion-provider :none)
  (defun corfu-lsp-setup ()
    (setq-local completion-styles '(orderless)
                completion-category-defaults nil))
  (add-hook 'lsp-completion-mode-hook #'corfu-lsp-setup))

(use-package magit
  :ensure t
  :defer t
  :commands (magit-status magit))

(use-package zig-mode
  :ensure t
  :defer t
  :mode ("\\.zig\\'" . zig-mode))

;; Tree-sitter language sources
(setq treesit-language-source-alist
      '((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
        (css . ("https://github.com/tree-sitter/tree-sitter-css"))
        (go . ("https://github.com/tree-sitter/tree-sitter-go"))
        (gomod . ("https://github.com/camdencheek/tree-sitter-go-mod" "main" "src"))
        (html . ("https://github.com/tree-sitter/tree-sitter-html"))
        (python . ("https://github.com/tree-sitter/tree-sitter-python"))
        (yaml . ("https://github.com/ikatyang/tree-sitter-yaml"))))

;;; init.el ends here
