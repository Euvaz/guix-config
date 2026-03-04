(define-module (config home services environment)
  #:use-module (gnu home services)
  #:use-module (guix gexp)

  #:export (home-environment-variables-configuration-service-type))

(define (home-environment-variables-configuration-gexp config)
  '(("EDITOR" . "emacs -nw")
    ("GTK_ICON_THEME" . "Qogir-Dark")
    ("GTK_THEME" . "Flat-Remix-GTK-Blue-Dark")
    ("PATH" . "${PATH}")
    ("QT_QPA_PLATFORM" . "wayland")
    ("QT_QPA_PLATFORMTHEME" . "gtk3")
    ; ("QT_STYLE_OVERRIDE" . "Flat-Remix-GTK-Blue-Dark")
    ("VISUAL" . "emacs -nw")))

(define home-environment-variables-configuration-service-type
  (service-type (name 'home-profile-environment-variables-service)
                (description "Service for setting up environment variables.")
                (extensions
                 (list (service-extension
                        home-environment-variables-service-type
                        home-environment-variables-configuration-gexp)))
                (default-value #f)))
