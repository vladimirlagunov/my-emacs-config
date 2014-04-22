(require 'jabber)

(custom-set-variables
  '(jabber-account-list (quote (("werehuman@jabber.ru" (:connection-type . ssl)))))
  '(jabber-alert-info-message-hooks (quote (jabber-info-echo jabber-info-display jabber-info-notify-send)))
  '(jabber-chat-fill-long-lines nil)
  '(jabber-history-enabled t))


(defvar libnotify-program "/usr/bin/notify-send")

(defun notify-send (title message)
  (start-process "notify" " notify"
		 libnotify-program "--expire-time=4000" title message))

(defun libnotify-jabber-notify (from buf text proposed-alert)
  "(jabber.el hook) Notify of new Jabber chat messages via libnotify"
  (when (or jabber-message-alert-same-buffer
            (not (memq (selected-window) (get-buffer-window-list buf))))
    (if (jabber-muc-sender-p from)
        (notify-send (format "(PM) %s"
                       (jabber-jid-displayname (jabber-jid-user from)))
               (format "%s: %s" (jabber-jid-resource from) text)))
      (notify-send (format "%s" (jabber-jid-displayname from))
             text)))

(add-hook 'jabber-alert-message-hooks 'libnotify-jabber-notify)


(provide 'config_my_jabber)
