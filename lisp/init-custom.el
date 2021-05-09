(defgroup ahuizotl nil
  "Ahuizotl Emacs customization."
  :group 'convenience
  :link '(url-link :tag "Homepage" "https://www.gnu.org/software/emacs"))

(defcustom ahuizotl-logo (expand-file-name
			  (if (display-graphic-p) "logo.png" "banner.txt")
			  user-emacs-directory)
  "Set Ahuizotl logo"
  :group 'ahuizotl
  :type 'string)

(defcustom ahuizotl-full-name "HydraDarkNg"
  "Set org directory."
  :group 'ahuizotl
  :type 'string)

(defcustom ahuizotl-mail-address ""
  "Set emacs  user"
  :group 'ahuizotl
  :type 'string)

(defcustom ahuizotl-proxy "127.0.0.1:1087"
  "Proxy Using In Emacs"
  :group 'ahuizotl
  :type 'string)

(defcustom ahuizotl-server t
  "Server using Server"
  :group 'ahuizotl
  :type 'boolean)

(defcustom ahuizotl-dashboard t
  "Ahuizotl Dashboard"
  :group 'ahuizotl
  :type 'boolean)

(provide 'init-custom)
