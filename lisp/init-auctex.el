(with-eval-after-load 'tex
(setq TeX-source-correlate-method 'synctex)
(TeX-source-correlate-mode)
(setq TeX-source-correlate-start-server t)

(add-to-list 'TeX-view-program-selection
'(output-pdf "Zathura")))

;; PDF view
(use-package pdf-tools
  :config
  (pdf-tools-install))

(provide 'init-auctex)
