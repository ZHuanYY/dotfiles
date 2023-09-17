(add-to-list 'load-path
  (expand-file-name
    (concat user-emacs-directory "elisp")))

(setq custom-file
    (expand-file-name "elisp/custom.el" user-emacs-directory))

(require 'init-use-package)
(require 'options)
(require 'theme)
(require 'mode-line)
(require 'my-org)
(require 'buffer-manage)
(require 'code-edit)
(require 'program-mode)
(require 'highight)
(require 'lsp)
(require 'workspace)

