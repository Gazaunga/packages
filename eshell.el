; Terminal in emacs
(use-package multi-term
  :defer 2
  :diminish
  :commands multi-term)

(use-package eshell-prompt-extras
  :defer 2
  :diminish eshell-mode
  :config
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-lambda)))

(use-package eshell-z
  :defer 2
  :diminish
  :config
  (add-hook 'eshell-mode-hook
            (defun my-eshell-mode-hook ()
              (require 'eshell-z))))

(use-package esh-help
  :defer 2
  :diminish
  :config (setup-esh-help-eldoc)  ;; To use eldoc in Eshell
  )

(use-package eshell-bookmark
  :defer 2
  :diminish
  :config
  (add-hook 'eshell-mode-hook 'eshell-bookmark-setup))

(use-package eshell-did-you-mean
  :defer 2
  :config (eshell-did-you-mean-setup))

(use-package eshell-git-prompt
  :defer 2
  :config (eshell-git-prompt-use-theme 'git-radar))

;; (use-package esh-autosuggest
;;   :hook (eshell-mode . esh-autosuggest-mode)
;;   ;; If you have use-package-hook-name-suffix set to nil, uncomment and use the
;;   ;; line below instead:
;;   ;; :hook (eshell-mode-hook . esh-autosuggest-mode)
;;   )

(use-package exec-path-from-shell
  :diminish
  :defer 2
  :config
  (exec-path-from-shell-initialize))
