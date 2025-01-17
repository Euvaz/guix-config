;; Disable UI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

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

(package-initialize
  (unless package-archive-contents
    (package-refresh-contents)))

;; Install and configure Magit
(use-package magit
  :ensure t)
