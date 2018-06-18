(condition-case nil
    (set-frame-font "Profont For Powerline-12")
  (error
   (set-frame-font "DejaVu Sans Mono-10")))
   
(use-package spaceline
  :defer 2
  :diminish  (spaceline-mode)
  :config
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (setq    spaceline-line-column-p t
           spaceline-line-p t
           powerline-default-separator nil
           spaceline-buffer-encoding-abbrev-p nil
           spaceline-erc-track-p nil
           spaceline-buffer-size-p nil
           spaceline-which-function-p t
           spaceline-buffer-modified-p nil
           spaceline-version-control-p nil
           spaceline-minor-modes-p nil
           spaceline-buffer-position-p nil
           )
  (spaceline-compile))
