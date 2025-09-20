(define-module (config home services environment)
  #:use-module (gnu home services)
  #:use-module (guix gexp)

  #:export (home-environment-variables-configuration-service-type))

(define (home-environment-variables-configuration-gexp config)
  '(("EDITOR" . "emacs -nw")
    ("PATH" . "${PATH}")
    ("VISUAL" . "emacs -nw")
    ("ZDOTDIR" . "${XDG_CONFIG_HOME}/zsh")))

(define home-environment-variables-configuration-service-type
  (service-type (name 'home-profile-environment-variables-service)
                (description "Service for setting up environment variables.")
                (extensions
                 (list (service-extension
                        home-environment-variables-service-type
                        home-environment-variables-configuration-gexp)))
                (default-value #f)))
