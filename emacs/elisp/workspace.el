;; 文件树
(use-package treemacs
  :bind
  ("M-0" . treemacs-select-window)
  ("<f8>" . treemacs)
  :config
  (treemacs-load-all-the-icons-with-workaround-font "Hack")
  (setq treemacs-follow-mode nil
	treemacs-follow-after-init t
	treemacs-project-follow-cleanup t
	treemacs-filewatch-mode t
	treemacs-persist-file nil ;; 会话保持
	)
  (treemacs-define-RET-action 'file-node-closed  #'treemacs-visit-node-close-treemacs)
  (define-key treemacs-mode-map (kbd "<f2>") 'treemacs-rename-file))


(use-package treemacs-all-the-icons)

(use-package projectile
  :config
  (projectile-mode +1))

(use-package treemacs-projectile
  :bind
  ("C-c t p" . treemacs-projectile)
  ("C-x t r" . treemacs-remove-project)
  ("C-x p t" . projectile-treemacs) )

(require 'treemacs)
(require 'projectile)
(defun projectile-treemacs ()
  "添加当前buffer的项目根目录到treemacs"
  (interactive)
  (let ((projects (treemacs-workspace->projects (treemacs-current-workspace)))
	(root (projectile-project-root)))
    (if root
	(if (member root projects)
	    (message "工作区已包含当前项目")
	  (progn (treemacs-add-project-to-workspace root)
		 (message "工作区内添加项目: %s" root)))
      (message "未找到项目根目录"))
    )
  )

(defun treemacs-remove-project ()
  "从工作区移除项目"
  (interactive)
  (treemacs-remove-project-from-workspace)
  )

(use-package treemacs-icons-dired
  :hook
  (dired-mode . treemacs-icons-dired-mode))

;; 标签栏
(use-package centaur-tabs
  :hook
  (dired-mode . centaur-tabs-local-mode)
  :bind
  ("C-<tab>" . centaur-tabs-forward)
  ("<backtab>" . centaur-tabs-backward)
  ("C-<right>" . centaur-tabs-forward-group)
  ("C-<left>" . centaur-tabs-backward-group)
  ("M-<right>" . centaur-tabs-move-current-tab-to-right)
  ("M-<left>" . centaur-tabs-move-current-tab-to-left)
  ("C-<iso-lefttab>" . centaur-tabs-ace-jump)
  ("C-c t u" . centaur-tabs-kill-unmodified-buffers-in-current-group)
  ("C-c t k" . centaur-tabs-kill-other-buffers-in-current-group)
  :config
  (centaur-tabs-headline-match)
  (setq centaur-tabs-style "bar" ;; 标签栏样式
	centaur-tabs-height 32 ;; 标签栏高度
	centaur-tabs-set-icons t
	centaur-tabs-plain-icons t
	centaur-tabs-gray-out-icons 'buffer
	centaur-tabs-set-bar 'left ;; 左划线
	;; centaur-tabs-set-bar 'over ;; 上划线
	;; centaur-tabs-set-bar 'under ;; 下划线 注: 不使用spacsmacs的话，要带上下一句
	;; x-underline-at-descent-line t
	;; centaur-tabs-label-fixed-length 0 ;; 选项卡宽度 0为动态
	centaur-tabs-set-close-button t
	centaur-tabs-set-modified-marker t
	;; centaur-tabs-cycle-scope 'tabs
	))
(centaur-tabs-mode)


(use-package ivy-posframe
  :init
  (setq ivy-posframe-display-functions-alist 
	'((counsel-M-x . ivy-posframe-display-at-frame-center)
	  (counsel-find-file . ivy-posframe-display-at-frame-center)
	  (ivy-switch-buffer . ivy-posframe-display-at-frame-center)
	  (t . ivy-posframe-display-at-frame-center))))
(ivy-posframe-mode t)

(use-package vterm
  :bind
  ("C-t" . vterm)
  (:map vterm-mode-map
	("C-<right>" . centaur-tabs-forward-group)
	("C-<left>" . centaur-tabs-backward-group)
	("M-<right>" . centaur-tabs-move-current-tab-to-right)
	("M-<left>" . centaur-tabs-move-current-tab-to-left)
	("<f9>" . vterm-toggle)))

(use-package vterm-toggle
  :bind
  ("<f9>" . vterm-toggle))

(provide 'workspace)
