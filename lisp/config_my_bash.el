(add-hook 'sh-mode-hook
          (lambda ()
            (add-hook 'write-contents-functions
                      (lambda()
                        (save-excursion
                          (delete-trailing-whitespace))))))

(provide 'config_my_bash)
