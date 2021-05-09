;; emms
(use-package emms
  :ensure t
  :config
  (require 'emms-setup)
  (require 'emms-player-mpd)
  (require 'emms-player-simple)
  (require 'emms-source-file)
  (require 'emms-source-playlist)
  (emms-all)
  (setq emms-seek-seconds 5)
  (setq emms-player-list '(emms-player-mpd))
  (setq emms-info-functions '(emms-info-mpd))
  (setq emms-player-mpd-server-name "localhost")
  (setq emms-player-mpd-server-port "6800")
  (setq emms-info-asynchronously t
	emms-show-all-format "♪ %s")
  (setq emms-player-list '(emms-player-mpg321
                           emms-player-ogg123
			   emms-player-mplayer))
  (setq-default
   emms-player-list '(emms-player-mpv)
   emms-player-mpv-environment '("PULSE_PROP_media.role=music")
   emms-player-mpv-parameters '("--quiet" "--really-quiet" "--no-audio-display" "--force-window=no" "--vo=null" "--no-video"))
  (emms-mode-line -1)
  (emms-playing-time-disable-display))

(setq mpc-host "localhost:6800")

(global-set-key [(f7)] 'emms)
(global-set-key (kbd "C-<f7>") 'emms-add-file)

; choose D-Bus to disseminate messages, if it is running.
(cond
 ;; test to see if D-Bus notifications are available
 ((if (and (require 'dbus nil t)
     (dbus-ping :session "org.freedesktop.Notifications"))
      (progn
  (setq notify-method 'notify-via-dbus-notifications)
  (require 'notifications))))
 ;; could use the message system otherwise
 (t (setq notify-method 'notify-via-message)))

(defun notify-via-notifications (title msg icon)
  "Send notification with TITLE, MSG via `D-Bus'."
  (notifications-notify
   :title title
   :body msg
   :app-icon icon
   :urgency 'low))

(defun notify-via-messages (title msg)
  "Send notification with TITLE, MSG to message."
  (message "APPOINTMENT: %s" msg))

(defun emms-notifications-dbus (track-name)
  "Share track name via `D-Bus'."
  (let ((icon "/usr/share/icons/gnome/24x24/categories/applications-multimedia.png"))
    (notify-via-notifications "EMMS is now playing:" track-name icon)))

(defun emms-notifications-message (track-name)
  "Share track name via Emacs minibuffer."
  (message "EMMS is now playing: %s" track-name))

(setq emms-player-next-function 'emms-notify-and-next)

(defun emms-notify-and-next ()
  "Send a notification of track and start next."
  (emms-next-noerror)
  (let ((track-name (emms-track-description (emms-playlist-current-selected-track))))
    (cond
     ((eq notify-method 'notify-via-dbus-notifications)
      (emms-notifications-dbus track-name))
     (t (emms-notifications-message track-name)))))

(provide 'init-emms)
