;;; init.el -*- lexical-binding: t; -*-
;;; Commentary:
;; Opinionated Emacs config.
;;; Code:

(load (concat user-emacs-directory "editor.el"))
(load (concat user-emacs-directory "packages.el"))
(load (concat user-emacs-directory "ui.el"))

;; Initialize package archives
(require 'package)
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Utilize separate custom-set-variables file
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

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
