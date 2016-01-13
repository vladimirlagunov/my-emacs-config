(require 'ggtags)


(add-hook 'c-mode-hook 
          (lambda () (ggtags-mode 1)))

(add-hook 'c++-mode-hook 
          (lambda () (ggtags-mode 1)))

(provide 'config_my_c)
