(use-package evil
  :ensure t
  :init
  (evil-mode 1))
(use-package evil-surround
  :ensure t
  :init
  (progn
    (global-evil-surround-mode 1)
    (global-set-key [(meta z)] 'undo-tree-undo)
    (global-set-key [(meta shift z)] 'undo-tree-redo)))
;; this one bugs for js?
(use-package evil-matchit
  :ensure t
  :init
  (global-evil-matchit-mode 1))
(use-package evil-nerd-commenter
  :ensure t
  :init
  (progn
    (evilnc-default-hotkeys)
    ;; default binding is M-;
    (global-set-key (kbd "M-/") 'evilnc-comment-or-uncomment-lines)))
(use-package evil-leader
  :ensure t
  :init
  (progn
    (global-evil-leader-mode 1)
    (evil-leader/set-leader "SPC")))
(use-package ace-jump-mode
  :ensure t
  :init
  (progn
    (evil-leader/set-key "SPC" 'evil-ace-jump-char-mode)))

;; TODO: check evil-exchange, evil-snipe, evil-lisp-state, evil-escape
