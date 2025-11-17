;;; packages.el -*- lexical-binding: t; -*-
;;; Commentary:
;; Package specification.
;;; Code:

;; Initialize package archives
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Bootstrap use-package
(eval-when-compile (require 'use-package))
(setq use-package-verbose t
      use-package-compute-statistics t)

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
        corfu-preselect 'prompt
        text-mode-ispell-word-completion nil)
  :bind (:map corfu-map
              ("TAB" . #'corfu-next)
              ([tab] . #'corfu-next)
              ("S-TAB" . #'corfu-previous)
              ([backtab] . #'corfu-previous)))

(use-package smartparens
  :ensure t
  :hook (prog-mode text-mode))

(use-package org
  :config
  (setq org-todo-keywords '((sequence "TODO(t)" "PROG(p)" "|" "DONE(d)")
                            (sequence "BACKLOG(b)" "|" "CANCELLED(c@)")))
  :mode ("\\.org\\'" . org-mode))

(use-package ob
  :after org
  :config
  (setq org-confirm-babel-evaluate nil
        org-edit-src-content-indentation 0)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (shell . t))))

(use-package emms
  :ensure t
  :config
  (setq emms-player-list '(emms-player-mpv))
  (emms-all)
  (emms-add-directory-tree "~/Music")
  :commands (emms))

(use-package magit
  :ensure t
  :commands (magit-status magit))

(use-package magit-todos
  :ensure t
  :after magit
  :config (magit-todos-mode 1))

(use-package geiser
  :ensure t
  :commands (geiser run-geiser)
  :config (setq geiser-mode-start-repl-p t
                geiser-repl-query-on-kill-p nil))

(use-package geiser-guile
  :ensure t
  :commands (geiser-guile run-guile))

(use-package sly
  :ensure t
  :commands (sly sly-connect)
  :config (setq sly-lisp-implementations
                '((sbcl ("sbcl") :coding-system utf-8-unix))))

(use-package treesit
  :defer t
  :init
  (setq treesit-language-source-alist
        '((bash "https://github.com/tree-sitter/tree-sitter-bash")
          (cmake "https://github.com/uyha/tree-sitter-cmake")
          (css "https://github.com/tree-sitter/tree-sitter-css")
          (go "https://github.com/tree-sitter/tree-sitter-go")
          (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
          (html "https://github.com/tree-sitter/tree-sitter-html")
          (json "https://github.com/tree-sitter/tree-sitter-json")
          (python "https://github.com/tree-sitter/tree-sitter-python")
          (toml "https://github.com/tree-sitter/tree-sitter-toml")
          (yaml "https://github.com/ikatyang/tree-sitter-yaml"))))

(use-package bash-ts-mode
  :init
  (add-to-list 'major-mode-remap-alist '(sh-mode . bash-ts-mode))
  :mode ("\\.sh\\'" . bash-ts-mode))

(use-package cmake-ts-mode
  :mode ("\\.cmake\\'" . cmake-ts-mode))

(use-package css-ts-mode
  :init
  (add-to-list 'major-mode-remap-alist '(css-mode . css-ts-mode))
  :mode ("\\.css\\'" . css-ts-mode))

(use-package go-ts-mode
  :mode ("\\.go\\'" . go-ts-mode))

(use-package go-mod-ts-mode
  :mode ("go\\.mod\\'" . go-mod-ts-mode))

(use-package html-ts-mode
  :config
  (add-to-list 'major-mode-remap-alist '(mhtml-mode . html-ts-mode))
  :mode ("\\.html\\'" . html-ts-mode))

(use-package json-ts-mode
  :config
  (add-to-list 'major-mode-remap-alist '(js-json-mode . json-ts-mode))
  :mode ("\\.json\\'" . json-ts-mode))

(use-package python-ts-mode
  :config
  (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
  :mode ("\\.py[iw]?\\'" . python-ts-mode))

(use-package toml-ts-mode
  :config
  (add-to-list 'major-mode-remap-alist '(conf-toml-mode . toml-ts-mode))
  :mode ("\\.toml\\'" . toml-ts-mode))

(use-package yaml-ts-mode
  :mode ("\\.ya?ml\\'" . yaml-ts-mode))

(use-package zig-mode
  :ensure t
  :mode ("\\.zig\\'" . zig-mode))

;;; packages.el ends here
