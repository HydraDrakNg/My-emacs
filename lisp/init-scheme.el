(use-package geiser
  :ensure t
  :hook (scheme-mode ' geiser-mode)
  :init
  (setq geiser-active-implementations '(chicken-guile)))

(provide 'init-scheme)
