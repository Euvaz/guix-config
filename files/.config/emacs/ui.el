;;; ui.el -*- lexical-binding: t; -*-
;;; Commentary:
;; UI tweaks.
;;; Code:

;; Disable UI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Theme options
(setq modus-themes-italic-constructs t)

;; Load theme and define font
(load-theme 'modus-vivendi-tinted t)
(set-face-attribute 'default nil :font "Fira Code" :height 160)
(set-face-attribute 'italic nil :font "Victor Mono" :height 160)

;;; Variables:

;; Adjust startup behavior
(setq initial-scratch-message nil
      initial-major-mode 'emacs-lisp-mode
      inhibit-startup-screen t)

;; Wayland optimization
(setq-default pgtk-wait-for-event-timeout 0)

;;; ui.el ends here
