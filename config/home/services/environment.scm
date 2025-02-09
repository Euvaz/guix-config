(define-module (config home services environment)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (guix gexp)

  #:export (home-environment-variables-configuration-service-type))

(define (home-environment-variables-configuration-gexp config)
  '(("EDITOR" . "emacs")
    ("VISUAL" . "emacs")
    ("GO111MODULE" . "on")
    ("GOPATH" . "${HOME}/go")
    ("PATH" . "${PATH}:${GOPATH}/bin")))

(define home-environment-variables-configuration-service-type
  (service-type (name 'home-profile-environment-variables-service)
                (description "Service for setting up environment variables.")
                (extensions
                 (list (service-extension
                        home-environment-variables-service-type
                        home-environment-variables-configuration-gexp)))
                (default-value #f)))
