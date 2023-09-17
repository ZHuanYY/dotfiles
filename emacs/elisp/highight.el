;; 语义解析
(use-package tree-sitter
  :hook (lsp-mode . tree-sitter-mode)
        (tree-sitter-after-on . tree-sitter-hl-mode)
)

(use-package tree-sitter-langs)

;; 数字高亮 (与tree-sitter-hl冲突)
;; (use-package highlight-numbers
;;   :hook (prog-mode . highlight-numbers-mode)
;;   :config (set-face-attribute 'highlight-numbers-number nil
;;              :foreground "green"))

(provide 'highight)
