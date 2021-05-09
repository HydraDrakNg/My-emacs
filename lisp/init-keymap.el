(use-package general
  :config
  (general-create-definer efs/leader-keys
    :prefix "C-x c"
    :global-prefix "C-x c")
  
  (efs/leader-keys
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))

(use-package hydra
  :defer t)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("p" text-scale-increase "in")
  ("n" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(efs/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))

(global-set-key (kbd "C-x C-g C-s") 'centaur-tabs-counsel-switch-group)
(global-set-key (kbd "C-x b") 'ibuffer)
(global-set-key (kbd "C-x C-b") 'counsel-switch-buffer)
(global-set-key (kbd "C-x C-S-b") 'counsel-switch-buffer-other-window)
(global-set-key (kbd "C-x C-d") 'counsel-dired)
(global-set-key (kbd "C-x d") 'list-directory)

(provide 'init-keymap)
