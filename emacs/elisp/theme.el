;;;; 主题
;; atom
(use-package atom-one-dark-theme
  :init (load-theme 'atom-one-dark t))

;; all-the-icons
(use-package all-the-icons
  :if (display-graphic-p))

(provide 'theme)
