;; 安装use-package
(setq package-check-signature nil)
(require 'package)
(unless (bound-and-true-p package--initialized)
  (package-initialize))
(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(doom-modeline atom-one-dark-theme restart-emacs use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;;(add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

;; use-package配置
(eval-and-compile
    (setq use-package-always-ensure t) ;不用每个包都手动添加:ensure t关键字
    (setq use-package-always-defer t) ;默认都是延迟加载，不用每个包都手动添加:defer t
    (setq use-package-always-demand nil)
    (setq use-package-expand-minimally t)
    (setq use-package-verbose t))

(provide 'init-use-package)
