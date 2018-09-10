(use-package org
  :ensure org-plus-contrib
  :pin org
  :defer 4
  :diminish org-mode-hook
  :bind ("C-c x c" . org-capture)
  ("C-c x l" . org-store-link)
  ("C-c x a" . org-agenda)
  ("C-c x b" . org-switchb)
  :config
  ;; (define-key global-map "\C-c xl" 'org-store-link)
  ;; (defbine-key global-map "\C-c xa" 'org-agenda)
  (setq org-log-done t)
  ;; make tab act as if it were issued in a buffer of the languageâ€™s major mode.
  (setq org-src-tab-acts-natively t)
  ;; enable spell-checking in org-mode.
  (add-hook 'org-mode-hook 'flyspell-mode))

;; bullets instead of a list of asterisks
(use-package org-bullets
  :defer 4
  :config
  ;; downward-pointing arrow instead of the usual ellipsis
  (setq org-ellipsis "⤵")
  (setq org-src-fontify-natively t)
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

(use-package toc-org
  :config (add-hook 'org-mode-hook 'toc-org-enable))

(use-package htmlize
  :defer 4)

(use-package ox-twbs
  :defer 4)

;; (use-package org-pdfview
;;  :defer 4
;;  :init
;;  (eval-after-load 'org '(require 'org-pdfview))
  ;;  (add-to-list 'org-file-apps '("\\.pdf\\'" . (lambda (file link) (org-pdfview-open link))))
;;  )


;; --------------------------------------------------
;; Definitions
;; --------------------------------------------------

(setq org-src-fontify-natively t
      org-default-notes-file "~/dots/emacs/.emacs.d/organize.org"  ;; tell Org where to put captured notes.
      org-src-window-setup 'current-window
      org-src-strip-leading-and-trailing-blank-lines t
      org-src-preserve-indentation t
      org-src-tab-acts-natively t)


(add-hook 'org-mode-hook
          '(lambda ()
             (visual-line-mode 1)))
;; (let*
;;     ((variable-tuple (cond
;;                       ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                       ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                       ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                       ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                       (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;      (base-font-color     (face-foreground 'default nil 'default))
;;      (headline           `(:inherit default :weight normal :foreground ,base-font-color)))

;;   (custom-theme-set-faces 'user
;;                           `(org-level-8 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-7 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-6 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-5 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-4 ((t (,@headline ,@variable-tuple))))
;;                           `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.33))))
;;                           `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.33))))
;;                           `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.33))))
;;                           `(org-document-title ((t (,@headline ,@variable-tuple :height 1.33 :underline nil))))))

;; (setq org-startup-indented 'f)
;; (setq org-directory "~/org")
;; (setq org-special-ctrl-a/e 't)
;; (setq org-default-notes-file (concat org-directory "/notes.org"))
;; (define-key global-map "\C-c xc" 'org-capture)
;; (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; (setq org-src-fontify-natively 't)
;; (setq org-src-tab-acts-natively t)
;; (setq org-src-window-setup 'current-window)

;; Improved version of org narrow block. It loads a temporary file in the given major mode
;;--------------------------------------------------

(defun narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
                Intelligently means: region, org-src-block, org-subtree, or defun,
                whichever applies first.
                Narrowing to org-src-block actually calls `org-edit-src-code'.

                With prefix P, don't widen, just narrow even if buffer is already
                narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing command.
         ;; Remove this first conditional if you don't want it.
         (cond ((org-in-src-block-p)
                (org-edit-src-code)
                (delete-other-windows))
               ((org-at-block-p)
                (org-narrow-to-block))
               (t (org-narrow-to-subtree))))
        (t (narrow-to-defun))))
(define-key ctl-x-map "n b" #'narrow-or-widen-dwim)
(eval-after-load 'org-src
  '(define-key org-src-mode-map
     "\C-x\C-s" #'org-edit-src-exit))

;;; Put emacs in org-mode everytime you open a file in .org, .ref, .notes, or an encrypted version of it.

(setq auto-mode-alist
  '(
    ("\\.org$" . org-mode)  
    ("\\.org.gpg$" . org-mode)  
    ("\\.ref$" . org-mode)
    ("\\.ref.gpg$" . org-mode)
    ("\\.notes$" . org-mode)
))
