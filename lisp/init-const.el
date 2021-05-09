(defconst ahuizotl-homepage
  "https://gnu.org/")

(defconst ahuizotl099-custom-exaple-file
  (expand-file-name "custom-exaple.el" user-emacs-directory)
  "Custom file after startup.")

(defconst ahuizotl-custom-post-file
  (expand-file-name "custom-post.el" user-emacs-directory))

(defconst ahuizotl-custom-post-org-file
  (expand-file-name "custom-post.org" user-emacs-directory))

(defconst sys/linux
  (eq system-type 'gnu/linux))

(defconst emacs/>25p
  (>= emacs-major-version 25))

(defconst emacs/>=26p
  (>= emacs-major-version 26)
  "Emacs is 26 or above.")

(defconst emacs/>=27p
  (>= emacs-major-version 27)
  "Emacs is 27 or above.")

(defconst emacs/>=25.3p
  (or emacs/>=26p
      (and (= emacs-major-version 25) (>= emacs-minor-version 3)))
  "Emacs is 25.3 or above.")

(defconst emacs/>=25.2p
  (or emacs/>=26p
      (and (= emacs-major-version 25) (>= emacs-minor-version 2)))
  "Emacs is 25.2 or above.")

;; Make frame transparency overridable
(defconst efs/frame-transparency nil
  "Set transparency emacs")

(defconst ahuizotl-theme nil
  "Theme load Emacs")

(defconst ahuizotl-title nil
  "Set title emacs")

(provide 'init-const)
