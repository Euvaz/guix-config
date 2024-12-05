(define-module (config home guix-home)
               #:use-module (gnu)
               #:use-module (gnu home)
               #:use-module (gnu home services dotfiles)
               #:use-module (gnu packages rust-apps)
               #:use-module (gnu packages shells)
               #:use-module (gnu packages shellutils)
               #:use-module (gnu packages tmux)
               #:use-module (gnu packages version-control)
               #:use-module (gnu packages vim)

               #:use-module (nongnu packages k8s)

               #:export (%guix-home))

(define %guix-home
  (home-environment
    (packages
      (list direnv
            eza
            git
            kubectl
            neovim
            tmux
            zsh))
  
    (services
      (list (service home-dotfiles-service-type
                     (home-dotfiles-configuration
                       (directories '("../../files/"))))))))
