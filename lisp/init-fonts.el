;;Font size
(defvar ahuizotl/default-font-size 130)
(defvar ahuizotl/default-variable-font-size 130)
(defvar ahuizotl/default-font "Fira Code Nerd Font Mono Bold")
(defvar ahuizotl/default-font-org "Mononoki Nerd Font Mono Bold")

(defun efs/set-font-faces ()
  (message "Setting faces!")
  (set-face-attribute 'default nil :font ahuizotl/default-font :height ahuizotl/default-font-size)

  ;; Set the fixed pitch face
  (set-face-attribute 'fixed-pitch nil :font ahuizotl/default-font :height ahuizotl/default-font-size)

  ;; Set the variable pitch face
  (set-face-attribute 'variable-pitch nil :font ahuizotl/default-font-org :height ahuizotl/default-variable-font-size :weight 'regular))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                ;; (setq doom-modeline-icon t)
		(setq centaur-tabs-set-icons t)
                (with-selected-frame frame
                  (efs/set-font-faces))))
  (efs/set-font-faces))

(provide 'init-fonts)
