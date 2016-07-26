(require 'use-package)
(use-package go-mode)

(add-hook 'go-mode-hook
          (lambda () (progn
                       (ggtags-mode t)
                       (auto-highlight-symbol-mode t))))

(provide 'config_my_go)
