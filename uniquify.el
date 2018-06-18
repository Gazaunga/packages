;; meaningful names for buffers with the same name
(use-package uniquify
  :ensure nil
  :init
  (setq uniquify-buffer-name-style 'reverse
        uniquify-after-kill-buffer-p t                   ;; rename after killing uniquified
        uniquify-separator "/"
        uniquify-ignore-buffers-re "^\\*"                ;; don't muck with special buffers
        ))
