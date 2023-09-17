;; 语法检查
(use-package flycheck
  :hook
  (prog-mode . flycheck-mode)
  :bind
  ("M-n" . flycheck-next-error)
  ("M-p" . flycheck-previous-error))

;; (use-package flymake
;;  :ensure nil
;;  :diminish (flymake " flym.")
;;  :hook (prog-mode . flymake-mode)
;;  :bind(("M-n" . flymake-goto-next-error)
;;        ("M-p" . flymake-goto-prev-error)))

;; emacs29自带eglot（不确定好不好用）
;; (use-package eglot
;;    :ensure
;;    nil
;;    :hook
;;    (before-save . eglot-format-buffer)
;;    (prog-mode . eglot-ensure)
;;    :bind
;;    ("<f2>" . eglot-rename)
;;    ("C-." . eglot-code-actions))

;; lsp
(use-package lsp-mode
  :hook
  ((before-save . lsp-format-buffer)
   ;; (prog-mode . lsp-deferred)
   ((rust-mode
     c-mode) . lsp-deferred))
  :bind
  (:map lsp-mode-map
	(("<f2>" . lsp-rename)
	 ("C-." . lsp-execute-code-action)
	 ("C-o". lsp-describe-thing-at-point)))
  :commands
  (lsp lsp-deferred)
  :init
  (setq lsp-keep-workspace-alive nil
        lsp-enable-indentation t
        lsp-enable-on-type-formatting nil
        lsp-auto-guess-root t
        lsp-enable-snippet t
        lsp-restart t
        lsp-completion-enable t
        lsp-enable-symbol-highlighting t
        lsp-inlay-hint-enable t
	lsp-eldoc-enable-hover nil
	lsp-eldoc-render-all t
	lsp-auto-execute-action nil)
  :config
  (use-package lsp-clients
    :ensure
    nil
    :functions
    (lsp-format-buffer lsp-organize-imports)))

(use-package yasnippet
  :hook
  (prog-mode . yas-global-mode))

(use-package lsp-treemacs
  :config
  (lsp-treemacs-sync-mode))

(provide 'lsp)
