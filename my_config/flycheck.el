(require 'use-package)
(use-package flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
