(define-module (config systems guix-base)
  #:use-module (gnu)

  #:use-module (guix)

  #:export (%guix-base)
  #:export (%guix-base-packages))

(use-package-modules ssh)
(use-service-modules networking ssh)

(define %guix-base-packages %base-packages)

(define %guix-base
  (operating-system
   (host-name "guix-base.local")
   (locale "en_US.utf8")
   (timezone "America/Chicago")
   (keyboard-layout (keyboard-layout "us"))

   ;; Exclude default firmware
   (firmware '())

   ;; Mapped devices for encrypted root partition
   (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/dev/vda1"))))

   ;; File systems with encryption
   (file-systems (cons* (file-system
                         (mount-point "/")
                         (device "/dev/vda1")
                         (type "btrfs"))
                        %base-file-systems))

   ;; User account, base user accounts, and groups
   (users (cons* (user-account
                  (name "guix-user")
                  (comment "Guix system user")
                  (group "users")
                  (home-directory "/home/guix-user")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                 %base-user-accounts))

   ;; Base packages
   (packages %guix-base-packages)

   ;; Base services
   (services %base-services)))

;; Instantiate Guix Base
%guix-base
