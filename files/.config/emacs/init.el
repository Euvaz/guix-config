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
(load-theme 'modus-vivendi)
(set-face-attribute 'default nil :font "Fira Code" :height 160)

;; Initialize package archives
(require 'package)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Install and configure magit
(use-package magit
  :ensure t)

;; Install and configure lsp-mode
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred))

;; Install and configure zig-mode
(use-package zig-mode
  :ensure t)

;; Define tree-sitter language sources
(setq treesit-language-source-alist
      '((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
        (css . ("https://github.com/tree-sitter/tree-sitter-css"))
        (go . ("https://github.com/tree-sitter/tree-sitter-go"))
        (gomod . ("https://github.com/camdencheek/tree-sitter-go-mod" "main" "src"))
        (html . ("https://github.com/tree-sitter/tree-sitter-html"))
        (python . ("https://github.com/tree-sitter/tree-sitter-python"))
        (yaml . ("https://github.com/ikatyang/tree-sitter-yaml"))))

;; Install tree-sitter language grammars if not already installed
(dolist (source treesit-language-source-alist)
  (unless (treesit-language-available-p (car source))
    (treesit-install-language-grammar (car source))))

;; Add file extension associations
(add-to-list 'auto-mode-alist '("\\.zig\\'" . zig-mode))
