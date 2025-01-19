;; Disable UI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Utilize separate custom-set-variables file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; Define indentation rules
(setq indent-tabs-mode nil)

;; Display line numbers
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Load theme and define font
(load-theme 'wombat)
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

;; Install and configure treesit-auto
(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (setq treesit-auto-langs '(bash commonlisp elisp go go-mod python yaml))
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; Define tree-sitter language sources
(setq treesit-language-source-alist
      '((bash . ("https://github.com/tree-sitter/tree-sitter-bash" "master" "src"))
        (commonlisp ("https://github.com/theHamsta/tree-sitter-commonlisp" "master" "src"))
        (elisp . ("https://github.com/Wilfred/tree-sitter-elisp" "main" "src"))
        (go . ("https://github.com/tree-sitter/tree-sitter-go" "master" "src"))
        (go-mod . ("https://github.com/camdencheek/tree-sitter-go-mod" "main" "src"))
        (python . ("https://github.com/tree-sitter/tree-sitter-python" "master" "src"))
        (yaml . ("https://github.com/ikatyang/tree-sitter-yaml" "master" "src"))))
