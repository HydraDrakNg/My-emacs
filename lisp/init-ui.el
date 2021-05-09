(require 'init-custom)
(require 'init-const)
(require 'init-func)

(setq display-time-format "Date: %H:%M  %Y-%m-%d")
(setq display-time-default-load-average nil)
(display-time-mode)

(use-package no-littering)

(setq ahuizotl-theme 'doom-dracula)
(setq efs/frame-transparency '(90 . 90))
(setq ahuizotl-title "Ahuizotl Emacs")

;; no-littering doesn't set this by default so we must place
;; auto save files in the same path as it uses for sessions
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell

(set-default 'cursor-type 'bar)		

(setq visible-bell t)

(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Set frame transparency
(set-frame-parameter (selected-frame) 'alpha efs/frame-transparency)
(add-to-list 'default-frame-alist `(alpha . ,efs/frame-transparency))
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Backup file Title and parentesis complete
(setq make-backup-files nil)
(electric-pair-mode 1)
(setq frame-title-format ahuizotl-title)
(blink-cursor-mode 0)
(show-paren-mode 1)

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
		vterm-mode-hook
                treemacs-mode-hook
		dired-mode-hook
		eww-mode-hook
                eshell-mode-hook
		emms-playlist-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


(use-package doom-themes)

(load-theme ahuizotl-theme t)

(use-package all-the-icons
  :ensure t)

(use-package keycast
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 35)
	   (doom-modeline-bar-width 5)
	   (doom-modeline-major-mode-color-icon t)
	   (doom-modeline-buffer-file-name-style 'truncate-except-project)))

(setq doom-modeline-icon t)

(setq tab-bar-new-tab-choice "*scratch")
(setq tab-bar-close-button-show nil
      tab-bar-new-button nil)
(setq tab-bar-show nil)

(use-package centaur-tabs
  :ensure t
  :config
;;  (centaur-tabs-change-fonts "Mononoki Mono Nerd Font" 100)
  (centaur-tabs-counsel-switch-group)
  :init
  (setq centaur-tabs-style "box"
	centaur-tabs-set-bar 'left
	centaur-tabs-set-icons t
	centaur-tabs-gray-out-icons 'buffer
	centaur-tabs-height 24
	centaur-tabs-set-modified-marker t
	centaur-tabs-modifier-marker "*")
  (centaur-tabs-mode 1)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward))

(global-hl-line-mode)

(use-package all-the-icons-ibuffer
  :ensure t
  :init (all-the-icons-ibuffer-mode 1))

(use-package command-log-mode)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Documents/Progects")
    (setq projectile-project-search-path '("~/Documents/Progects")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-ui)
