;; Disable UI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Utilize separate custom-set-variables file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; Disable backup files
(setq make-backup-files nil)

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
(use-package magit
  :ensure t
  :defer t
  :commands (magit-status magit))

(use-package lsp-mode
  :ensure t
  :defer t
  :commands (lsp lsp-deferred))

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
