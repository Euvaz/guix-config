(define-module (config home services desktop)
  #:use-module (gnu)
  #:use-module (gnu home services)
  #:use-module (gnu packages admin) ; btop
  #:use-module (gnu packages compression) ; unzip
  #:use-module (gnu packages curl) ; curl
  #:use-module (gnu packages emacs) ; emacs-next-pgtk
  #:use-module (gnu packages emacs-xyz) ; emacs-org-texlive-collection
  #:use-module (gnu packages fonts) ; font-awesome, font-fire-code, font-google-noto-emoji, font-victor-mono
  #:use-module (gnu packages gnupg) ; gnupg, pinentry
  #:use-module (gnu packages linux) ; brightnessctl, ebtables, numactl
  #:use-module (gnu packages node) ; node
  #:use-module (gnu packages package-management) ; flatpak
  #:use-module (gnu packages pdf) ; zathura, zathura-pdf-mupdf
  #:use-module (gnu packages pulseaudio) ; pavucontrol
  #:use-module (gnu packages python) ; python
  #:use-module (gnu packages python-xyz) ; python-lsp-server
  #:use-module (gnu packages rust-apps) ; eza, ripgrep
  #:use-module (gnu packages shells) ; zsh
  #:use-module (gnu packages shellutils) ; direnv
  #:use-module (gnu packages ssh) ; openssh
  #:use-module (gnu packages statistics) ; r
  #:use-module (gnu packages terminals) ; foot
  #:use-module (gnu packages tls) ; openssl
  #:use-module (gnu packages tor-browsers) ; mullvadbrowser
  #:use-module (gnu packages version-control) ; git
  #:use-module (gnu packages virtualization) ; qemu, virt-manager
  #:use-module (gnu packages wm) ; sway, swaybg, swayidle, swaylock, wmenu
  #:use-module (gnu packages xdisorg) ; wl-clipboaard

  #:export (home-desktop-service-type))

(define (home-desktop-profile-service config)
  (list brightnessctl
        btop
        curl
        direnv
        ebtables
        emacs-next-pgtk
        emacs-org-texlive-collection
        eza
        flatpak
        font-awesome
        font-fira-code
        font-google-noto-emoji
        font-victor-mono
        foot
        git
        gnupg
        mullvadbrowser
        node
        numactl
        openssh
        openssl
        pavucontrol
        pinentry
        python
        python-lsp-server
        qemu
        r
        ripgrep
        sway
        swaybg
        swayidle
        swaylock
        unzip
        virt-manager
        wl-clipboard
        wmenu
        zathura
        zathura-pdf-mupdf
        zsh))

(define home-desktop-service-type
  (service-type (name 'home-desktop-config)
                (description "Applies personal desktop configuration.")
                (extensions
                 (list (service-extension
                        home-profile-service-type
                        home-desktop-profile-service)))
                (default-value #f)))
