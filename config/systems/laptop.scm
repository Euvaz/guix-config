(define-module (config systems laptop)
  #:use-module (gnu)
  #:use-module (gnu packages firmware)
  #:use-module (gnu services desktop)
  #:use-module (gnu services guix)
  #:use-module (gnu services xorg)
  #:use-module (gnu services virtualization)
  #:use-module (gnu system nss)

  #:use-module (nongnu packages linux)
  #:use-module (nongnu system linux-initrd)

  #:use-module (config home guix-home)
  #:use-module (config systems guix-base))

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
                                   "acadaf63-afd1-4a00-95c6-2074661ad159"))
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
                  (supplementary-groups '("wheel" "netdev" "audio" "video" "libvirt")))
                 %base-user-accounts))

   ;; OVMF and base packages
   (packages
    (append
     (list ovmf-x86-64)
     %guix-base-packages))

   ;; Desktop environment, virtualization, and base services
   (services
    (cons*
     (service guix-home-service-type
              `((,%user-name ,%guix-home)))
     (service libvirt-service-type)
     (service virtlog-service-type)
     (extra-special-file "/usr/share/OVMF/OVMF_CODE.fd"
                         (file-append ovmf "/share/firmware/ovmf_code_x64.bin"))
     (extra-special-file "/usr/share/OVMF/OVMF_VARS.fd"
                         (file-append ovmf "/share/firmware/ovmf_vars_x64.bin"))
     (modify-services %desktop-services
                      ;; Remove gdm-service-type
                      (delete gdm-service-type))))

   ;; Allow DNS resolution of .local hosts
   (name-service-switch %mdns-host-lookup-nss)))

;; Instantiate Guix
%guix
