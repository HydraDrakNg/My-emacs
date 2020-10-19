
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


(add-to-list 'load-path "/home/HydraNg/.emacs.d/powerline")
(add-to-list 'load-path "/home/HydraNg/.emacs.d/emmet-mode")
(add-to-list 'custom-theme-load-path "~/.emacs.d/monokai")
(add-to-list 'custom-theme-load-path "~/.emacs.d/dracula")
(add-to-list 'load-path "~/.emacs.d/web-mode")
(add-to-list 'load-path "~/.emacs.d/mode-icons")
(add-to-list 'load-path "~/.emacs.d/ac-html")

(require 'emmet-mode)

(load-theme 'dracula t)

(require 'package) (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t) ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities` ;; and `package-pinned-packages`. Most users will not need or want to do this. ;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t) (package-initialize)c

(require 'mode-icons)
(require 'web-mode)
(require 'powerline)
(powerline-default-theme)
(require 'ac-html)

;IdoMode
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)

(global-set-key "\C-x\C-j" 'emmet-expand-line)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1ab3f571633bd3db52e07c4003e185a8b16306f0379b9faf7eadd28974ceb0f7" "24714e2cb4a9d6ec1335de295966906474fdb668429549416ed8636196cb1441" default))
 '(delete-selection-mode nil)
 '(package-selected-packages '(ido-vertical-mode company-web auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
