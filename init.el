;; Ahizotl Emacs

(when (version< emacs-version "25.1")
  (error "Requieres un emacs mayor a la version 25.1"))

(defvar ahuizotl-gc-cons-threshold (if (display-graphic-p) 16000000 1600000))

(defvar ahuizotl-gc-cons-upper-limit (if (display-graphic-p) 40000000 100000000))

(defvar ahuizotl-gc-timer (run-with-idle-timer 10 t #'garbage-collect))

(defvar default-file-name-handler-alist file-name-handler-alist)

(setq file-name-handler-alist nil)

(setq ahuizotl-gc-cons-threshold ahuizotl-gc-cons-upper-limit
      gc-cons-percentage 0.5)
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq file-name-handler-alist default-file-name-handler-alist)
	    (setq gc-cons-threshold ahuizotl-gc-cons-threshold
                  gc-cons-percentage 0.1)

	    (if (boundp 'after-focus-change-function)
		(add-function :after after-focus-change-function
			      (lambda ()
				(unless (frame-focus-state)
				  (garbage-collect))))
	      (add-hook 'focus-out-hook 'garbage-collect))
	    (defun my-minibuffer-setup-hook ()
	      (setq gc-cons-threshold ahuizotl-gc-cons-upper-limit))

	    (defun my-minibuffer-exit-hook ()
	      (setq gc-cons-threshold ahuizotl-gc-cons-threshold))

	    (add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
	    (add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hoo)))

(defun update-load-path (&rest _)
  "Upadte `load-path'"
  (dolist (dir '("site-lisp" "lisp"))
    (push (expand-file-name dir user-emacs-directory) load-path)))

(defun add-subdirs-to-load-path (&rest _)
  (let  ((default-directory (expand-file-name "site-lisp" user-emacs-directory)))
    (normal-top-level-add-subdirs-to-load-path)))

(advice-add #'package-initialize :after #'update-load-path)
(advice-add #'package-initialize :after #'add-subdirs-to-load-path)

(update-load-path)

(require 'init-package)
(require 'init-fonts)
(require 'init-dashboard)
(require 'init-ui)
(require 'init-dired)
(require 'init-lsp)
(require 'init-ivy)
(require 'init-term)
(require 'init-company)
(require 'init-org)
(require 'init-keymap)
(require 'init-treemacs)
(require 'init-typescript)
(require 'init-emms)
(require 'init-magit)
(require 'init-web)
(require 'init-auctex)
(require 'init-lua)
(require 'init-python)
(require 'init-gdscript)
;;(require 'init-mu4e)
(require 'init-sage)
(require 'init-c)
;;(require 'init-yasnipped)
(require 'init-lisp)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(custom-safe-themes
   '("e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" default))
 '(fci-rule-color "#6272a4")
 '(jdee-db-active-breakpoint-face-colors (cons "#1E2029" "#bd93f9"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1E2029" "#50fa7b"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1E2029" "#565761"))
 '(objed-cursor-color "#ff5555")
 '(package-selected-packages
   '(kiwix all-the-icons-gnus telega elfeed org-pomodoro company-irony sage-shell-mode gdscript-mode pyvenv python-mode lua-mode pdf-tools rainbow-mode emmet-mode forge magit emms ts-comint prettier-js tide rjsx-mode typescript-mode treemacs-all-the-icons treemacs-projectile general org-roam visual-fill-column org-bullets org-plus-contrib company-web company-box company vterm eshell-git-prompt eterm-256color all-the-icons-ivy-rich ivy-prescient ivy-rich dap-mode lsp-ivy lsp-treemacs lsp-ui lsp-mode dired-hide-dotfiles dired-open all-the-icons-dired dired-single rainbow-delimiters counsel-projectile projectile helpful which-key command-log-mode all-the-icons-ibuffer centaur-tabs doom-modeline keycast all-the-icons doom-themes no-littering dashboard use-package))
 '(pdf-view-midnight-colors (cons "#f8f8f2" "#282a36"))
 '(rustic-ansi-faces
   ["#282a36" "#ff5555" "#50fa7b" "#f1fa8c" "#61bfff" "#ff79c6" "#8be9fd" "#f8f8f2"])
 '(send-mail-function 'smtpmail-send-it)
 '(vc-annotate-background "#282a36")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50fa7b")
    (cons 40 "#85fa80")
    (cons 60 "#bbf986")
    (cons 80 "#f1fa8c")
    (cons 100 "#f5e381")
    (cons 120 "#face76")
    (cons 140 "#ffb86c")
    (cons 160 "#ffa38a")
    (cons 180 "#ff8ea8")
    (cons 200 "#ff79c6")
    (cons 220 "#ff6da0")
    (cons 240 "#ff617a")
    (cons 260 "#ff5555")
    (cons 280 "#d45558")
    (cons 300 "#aa565a")
    (cons 320 "#80565d")
    (cons 340 "#6272a4")
    (cons 360 "#6272a4")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dashboard-heading ((t (:inherit (font-lock-string-face bold)))))
 '(org-document-info ((t (:height 1.8 :underline nil))))
 '(org-document-title ((t (:height 2.5 :underline nil)))))
