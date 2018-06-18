(use-package pdf-tools
  :defer 4
  :diminish pdf-tools-modes
  :init (pdf-tools-install)
  :bind ( :map pdf-view-mode-map
               ("n" . pdf-view-next-line-or-next-page)
               ("p" . pdf-view-previous-line-or-previous-page)
               ("C-n" . pdf-view-next-page-command )
               ("C-p" . pdf-view-previous-page-command)))

;; workaround for pdf-tools not reopening to last-viewed page of the pdf:
;; https://github.com/politza/pdf-tools/issues/18#issuecomment-269515117
(defun brds/pdf-set-last-viewed-bookmark ()
  (interactive)
  (when (eq major-mode 'pdf-view-mode)
    (bookmark-set (brds/pdf-generate-bookmark-name))))

(defun brds/pdf-jump-last-viewed-bookmark ()
  (bookmark-set "fake") ; this is new
  (when
      (brds/pdf-has-last-viewed-bookmark)
    (bookmark-jump (brds/pdf-generate-bookmark-name))))

(defun brds/pdf-has-last-viewed-bookmark ()
  (assoc
   (brds/pdf-generate-bookmark-name) bookmark-alist))

(defun brds/pdf-generate-bookmark-name ()
  (concat "PDF-LAST-VIEWED: " (buffer-file-name)))

(defun brds/pdf-set-all-last-viewed-bookmarks ()
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (brds/pdf-set-last-viewed-bookmark))))

(add-hook 'kill-buffer-hook 'brds/pdf-set-last-viewed-bookmark)
(add-hook 'pdf-view-mode-hook 'brds/pdf-jump-last-viewed-bookmark)
(unless noninteractive  ; as `save-place-mode' does
  (add-hook 'kill-emacs-hook #'brds/pdf-set-all-last-viewed-bookmarks))

;; Display page numbers
(define-pdf-cache-function pagelabels)

(add-hook 'pdf-view-mode-hook
          (lambda ()
            (setq-local mode-line-position
                        '(" ["
                          (:eval (nth (1- (pdf-view-current-page))
                                      (pdf-cache-pagelabels)))
                          "/"
                          (:eval (number-to-string (pdf-view-current-page)))
                          "/"
                          (:eval (number-to-string (pdf-cache-number-of-pages)))
                          "]"))))

;; [PDFTOOLS End]
