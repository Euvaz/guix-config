;;; packages.el -*- lexical-binding: t; -*-
;;; Commentary:
;; Package specification.
;;; Code:

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
              ("TAB" . corfu-next)
              ([tab] . corfu-next)
              ("S-TAB" . corfu-previous)
              ([backtab] . corfu-previous)))

(use-package ob
  :after org
  :config
  (setq org-confirm-babel-evaluate nil
        org-edit-src-content-indentation 0)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((R . t)
     (python . t)
     (shell . t))))

(use-package lsp-mode
  :ensure t
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
  :commands (magit-status magit))

(use-package zig-mode
  :ensure t
  :mode ("\\.zig\\'" . zig-mode))

;;; packages.el ends here
