(define-module (config home services desktop)
  #:use-module (gnu)
  #:use-module (gnu home services)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages zig)
  #:use-module (gnu packages zig-xyz)

  #:export (home-desktop-service-type))

(define (home-desktop-profile-service config)
  (list brightnessctl
        btop
        curl
        direnv
        ebtables
        emacs-next-pgtk
        emacs-org-texlive-collection
        flatpak
        font-fira-code
        font-google-noto-emoji
        foot
        git
        numactl
        openssh
        openssl
        pavucontrol
        pinentry
        sway
        swaybg
        swayidle
        swaylock
        wmenu
        zathura
        zathura-pdf-mupdf
        zig
        zig-zls
        zsh))

(define home-desktop-service-type
  (service-type (name 'home-desktop-config)
                (description "Applies personal desktop configuration.")
                (extensions
                 (list (service-extension
                        home-profile-service-type
                        home-desktop-profile-service)))
                (default-value #f)))
