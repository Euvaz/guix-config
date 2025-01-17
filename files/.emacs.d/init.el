;; Disable UI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Display line numbers
(setq display-line-numbers-type 'relative)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Load theme and define font
(load-theme 'wombat)
(set-face-attribute 'default nil :font "Fira Code" :height 160)

;; Install and configure Magit
(use-package magit
  :ensure t)
