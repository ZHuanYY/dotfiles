;; 文本区域上下移动
(use-package drag-stuff
  :bind (("<M-up>". drag-stuff-up)
         ("<M-down>" . drag-stuff-down)))

;; 快速粘贴
(defun duplicate (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
   (interactive "p")
   (let (beg end (origin (point)))
     (if (and mark-active (> (point) (mark)))
         (exchange-point-and-mark))
     (setq beg (line-beginning-position))
     (if mark-active
        (exchange-point-and-mark))
     (setq end (line-end-position))
     (let ((region (buffer-substring-no-properties beg end)))
       (dotimes (i arg)
         (goto-char end)
         (newline)
         (insert region)
         (setq end (point)))
       (goto-char (+ origin (* (length region) arg) arg)))))

(global-set-key (kbd "C-d") 'duplicate)

;; 高级搜索替换 ivy-counsel-swiper三剑客
(use-package ivy
  :defer 1
  :demand
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-initial-inputs-alist nil
        ivy-count-format "%d/%d "
        enable-recursive-minibuffers t
        ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c g" . counsel-git)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
                swiper-include-line-number-in-search t))

;; 自动补全
(use-package company
  :config
  (setq company-dabbrev-code-everywhere t
        company-dabbrev-code-modes t
        company-dabbrev-code-other-buffers 'all
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case t
        company-dabbrev-other-buffers 'all
        company-require-match nil
        company-minimum-prefix-length 1
        company-show-numbers t
        company-tooltip-limit 20
        company-idle-delay 0
        company-echo-delay 0
        company-tooltip-offset-display 'scrollbar
        company-begin-commands '(self-insert-command))
  (push '(company-semantic :with company-yasnippet) company-backends)
  :hook ((after-init . global-company-mode)))

;; 括号补全
(use-package electric-pair-mode
  :ensure nil
  :hook (prog-mode . electric-pair-mode)
  :config (setq electric-pair-pairs '((?\" . ?\")
                                      (?\' . ?\')
                                      (?\( . ?\))
                                      (?\[ . ?\])
                                      (?\{ . ?\}))
              electric-pair-text-pairs electric-pair-pairs)
  )

(use-package hideshow
  :ensure
  nil
  ;; :diminish hs-minor-mode
  :hook
  (prog-mode . hs-minor-mode)
  :bind
  ("C-c h h" . hs-hide-block)
  ("C-c h s" . hs-show-block))

;; 注释反注释
(global-set-key (kbd "C-/") 'comment-line)

(provide 'code-edit)
