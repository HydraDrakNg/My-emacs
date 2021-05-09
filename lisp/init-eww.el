(use-package elfeed
  :ensure t
  :config
  (setq elfeed-feeds (quote
		      (("https://www.reddit.com/r/emacs.rss" reddit emacs)))))

(use-package eww
  :ensure nil
)

(provide 'init-eww)
