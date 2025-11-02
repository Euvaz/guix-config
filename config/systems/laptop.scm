(define-module (config systems laptop)
  #:use-module (gnu)
  #:use-module (gnu packages firmware)
  #:use-module (gnu services desktop)
  #:use-module (gnu services guix)
  #:use-module (gnu services xorg)
  #:use-module (gnu system nss)

  #:use-module (nongnu packages linux)
  #:use-module (nongnu system linux-initrd)

  #:use-module (config home guix-home)
  #:use-module (config systems guix-base)
  #:use-module (config systems core guix-channels)
  #:use-module (config systems core substitutes))

(define %user-name "virgil")

(define %guix
  (operating-system
   (inherit %guix-base)
   (host-name "laptop.local")

   ;; Linux kernel and initrd
   (kernel linux)
   (initrd microcode-initrd)

   ;; Additional firmware
   (firmware (cons* iwlwifi-firmware
                    %base-firmware))

   ;; Bootloader with EFI
   (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))))

   ;; Mapped devices for encrypted root partition
   (mapped-devices (list (mapped-device
                          (source (uuid
                                   "8acf1a74-f881-42c3-ab4c-6a8e07465b45"))
                          (target "cryptroot")
                          (type luks-device-mapping))))

   ;; File systems with encryption
   (file-systems (cons* (file-system
                         (mount-point "/")
                         (device "/dev/mapper/cryptroot")
                         (type "btrfs")
                         (dependencies mapped-devices))
                        (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "06B2-C813"
                                       'fat32))
                         (type "vfat"))
                        %base-file-systems))

   ;; User account, base user accounts, and groups
   (users (cons* (user-account
                  (name %user-name)
                  (comment "Virgil")
                  (group "users")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                 %base-user-accounts))

   ;; Base packages
   (packages %guix-base-packages)

   ;; Desktop environment and base services
   (services
    (cons*
     (service guix-home-service-type
              `((,%user-name ,%guix-home)))
     (modify-services %desktop-services
                      ;; Remove gdm-service-type
                      (delete gdm-service-type)
                      (guix-service-type
                       config =>
                       (substitutes->services config
                                              #:channels %guix-channels)))))))

;; Instantiate Guix
%guix
