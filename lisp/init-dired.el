(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :custom ((dired-listing-switches "-agho --group-directories-first")))

(use-package dired-single)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package dired-open
  :config
  ;; Doesn't work as expected!
  ;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
  (setq dired-open-extensions '(("png" . "feh")
                                ("jpg" . "feh")
                                ("odt" . "libreoffice7.0")
				("docx" . "libreoffice7.0")
                                ("mkv" . "mpv")
                                ("mp4" . "mpv")
                                ("blend" . "blender")
				("pdf" . "zathura")
				("ogv" . "mpv")
				("webm" . "mpv"))))

(use-package dired-hide-dotfiles
  :ensure t
  :init

  (defun my-dired-mode-hook ()
    "My `dired' mode hook."
    ;; To hide dot-files by default
    (dired-hide-dotfiles-mode)

    ;; To toggle hiding
    (define-key dired-mode-map "." #'dired-hide-dotfiles-mode))

  (add-hook 'dired-mode-hook #'my-dired-mode-hook))

(provide 'init-dired)
