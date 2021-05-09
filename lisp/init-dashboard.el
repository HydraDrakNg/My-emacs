(require 'init-const)
(require 'init-custom)

(unless emacs/>=25.3p (setq ahuizotl-dashboard nil))
(when ahuizotl-dashboard
  (use-package dashboard
    :diminish (dashboard-mode page-break-lines-mode)
    :functions (all-the-icons-faicon
		all-the-icons-material-scale-factor
		winner-undo
		winner-forward)
    :custom-face (dashboard-heading ((t (:inherit (font-lock-string-face bold)))))
    :ensure t
    :init
    (progn
      (setq dashboard-items '((recents . 5)
			      (projects . 2)))
      (setq dashboard-show-shortcuts nil)
      (setq dashboard-center-content t)
      (setq dashboard-banner-logo-title "Ahuizotl emacs")
      (setq dashboard-set-file-icons t)
      (setq dashboard-set-heading-icons t)
      (setq dashboard-startup-banner "~/.emacs.d/logo.txt")
      (setq dashboard-set-navigator t)
      (setq dashboard-set-footer t)
      (setq dashboard-footer-messages '("I am a saint in the church of emacs"))
      (setq dashboard-navigator-buttons
	    `(((,nil
		"Homepage"
		"Open Homepage Org File"
		(lambda (&rest _ ) (find-file "~/.emacs.d/README.org")))
	       (,nil
		"Config"
		"Open File init"
		(lambda (&rest _ ) (find-file "~/.emacs.d/init.el")))
	       (,nil
		"Theme"
		"Open File init"
		(lambda (&rest _ ) (find-file "~/.emacs.d/lisp/init-ui.el")))
	      ))))
    :config
    (dashboard-setup-startup-hook)))

(provide 'init-dashboard)
