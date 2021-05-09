;; HTML
(use-package emmet-mode
  :bind(("C-x j" . emmet-expand-line)))

(use-package rainbow-mode
  :hook (css-mode . rainbow-mode))

(provide 'init-web)
