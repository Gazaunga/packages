(use-package nov
  :diminish
  :init
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
  :config
  (setq nov-text-width most-positive-fixnum)
  (add-hook 'nov-mode-hook 'visual-line-mode)
  (add-hook 'nov-mode-hook 'visual-fill-column-mode)
  (setq nov-text-width 120
        visual-fill-column-center-text t))
