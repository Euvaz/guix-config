(define-module (config home guix-home)
               #:use-module (gnu)
               #:use-module (gnu home)
               #:use-module (gnu home services desktop)
               #:use-module (gnu home services dotfiles)
               #:use-module (gnu home services shells)
               #:use-module (gnu home services sound)
               #:use-module (gnu packages terminals)

               #:export (%guix-home))

(define %guix-home
  (home-environment
    (packages
      (list foot))

    (services
      (list (service home-dotfiles-service-type
                     (home-dotfiles-configuration
                       (directories '("../../files/"))))
            (service home-bash-service-type)
            (service home-pipewire-service-type)
            (service home-dbus-service-type)))))

;; Instantiate Guix Home
%guix-home
