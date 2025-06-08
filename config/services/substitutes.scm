(define-module (config services substitutes)
  #:use-module (gnu) ; %default-substitute-urls
  #:use-module (gnu packages package-management) ; guix-for-channels
  #:use-module (guix packages) ; origin
  #:use-module (guix download) ; url-fetch

  #:export (substitutes->services
            %guix-substitute-urls
            %guix-authorized-keys))

(define %guix-substitute-urls
  (cons* "https://substitutes.nonguix.org"
         "https://ci.guix.gnu.org"
         %default-substitute-urls))

(define %guix-authorized-keys
  (cons* (origin
          (method url-fetch)
          (uri "https://substitutes.nonguix.org/signing-key.pub")
          (file-name "nonguix.pub")
          (hash
           (content-hash
            "0j66nq1bxvbxf5n8q2py14sjbkn57my0mjwq7k1qm9ddghca7177")))
         %default-authorized-guix-keys))

(define* (substitutes->services config #:key channels)
  (guix-configuration
   (inherit config)
   (channels channels)
   (guix (guix-for-channels channels))
   (substitute-urls %guix-substitute-urls)
   (authorized-keys %guix-authorized-keys)))
