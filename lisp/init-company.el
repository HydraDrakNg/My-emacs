(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-f") #'company-select-first)
  (define-key company-active-map (kbd "M-n") #'company-select-next)
  (define-key company-active-map (kbd "M-p") #'company-select-previous)
  )

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package company-web
  :bind(( "C-x w" . company-web-html)))

(dolist (mode '(org-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (company-mode 0))))

(provide 'init-company)
