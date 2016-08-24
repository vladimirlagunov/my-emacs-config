(require 'use-package)
(use-package arduino-mode)

(use-package company-arduino)
(add-hook 'irony-mode-hook 'company-arduino-turn-on)
(add-hook 'arduino-mode-hook 'irony-mode)
(add-hook 'arduino-mode-hook 'company-mode)

(add-to-list 'company-backends 'company-irony)
(add-to-list 'company-backends 'company-c-headers)

(defun my-company-c-headers-get-system-path ()
  "Return the system include path for the current buffer."
  (let ((default '("/usr/include/" "/usr/local/include/")))
    (company-arduino-append-include-dirs default)))
(setq company-c-headers-path-system 'my-company-c-headers-get-system-path)


(provide 'config_my_arduino)
