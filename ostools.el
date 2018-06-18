(use-package try
  :diminish
  :defer 2)

(use-package image-file                 ; Visit images as images
  :init (auto-image-file-mode))

(use-package launch                     ; Open files in external programs
  :defer t)
