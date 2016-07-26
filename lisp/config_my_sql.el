(require 'use-package)
(use-package sqlup-mode)

(add-hook 'sql-mode-hook 'sqlup-mode)

(provide 'config_my_sql)
