(define-module (config home guix-home)
  #:use-module (gnu)
  #:use-module (gnu home)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services dotfiles)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services sound)
  #:use-module (config home services desktop)
  #:use-module (config home services environment)

  #:export (%guix-home))

(define %guix-home
  (home-environment
   (services
    (list (service home-dotfiles-service-type
                   (home-dotfiles-configuration
                    (directories '("../../files/"))))
          (service home-desktop-service-type)
          (service home-environment-variables-configuration-service-type)
          (service home-bash-service-type)
          (service home-pipewire-service-type)
          (service home-dbus-service-type)))))

;; Instantiate Guix Home
%guix-home
