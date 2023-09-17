(use-package emacs
  :ensure nil
  :bind
  ("C-z" . undo)
  ("C-x C-a" . mark-whole-buffer)
  :init
  (setq default-frame-alist '((font . "Hack:size=30")) ; 设置字体
	;; 设置镜像源
	package-archives
	'(("gnu" . "https://mirrors.ustc.edu.cn/elpa/gnu/")
	  ("melpa" . "https://mirrors.ustc.edu.cn/elpa/melpa/")
	  ("nongnu" . "https://mirrors.ustc.edu.cn/elpa/nongnu/"))
	;; 设置代理
	url-proxy-services
	'(("http"  . "127.0.0.1:7890")
	  ("https" . "127.0.0.1:7890"))
	;; 设置编码格式
	prefer-coding-system 'utf-8
	default-coding-systems 'utf-8
	terminal-coding-system 'utf-8
	keyboard-coding-system 'utf-8
	default-buffer-file-coding-system 'utf-8
	frame-resize-pixelwise t ; 窗口更改按像素改变
	)
  (add-to-list 'default-frame-alist '(fullscreen . maximized)) ; 全屏启动
  (set-fontset-font t 'han (font-spec :name "wqy-microhei")) ; 设置中文备选字体
  (tool-bar-mode -1) ; 关闭工具栏
  (menu-bar-mode -1) ; 关闭菜单栏
  (scroll-bar-mode -1) ; 滚动条
  (fringe-mode -1)
  :config
  (setq inhibit-startup-screen t ; 关闭欢迎文档
	make-backup-files nil ;  禁用自动备份
	auto-save-default nil ; 关闭自动保存
	 display-line-numbers-type t ; 设置行号
	 )
  (defalias 'yes-or-no-p 'y-or-n-p) ; 用y/n来代替yes/no
  (global-display-line-numbers-mode t) ; 启用行号
  (delete-selection-mode) ; 选中区域编辑直接替换
  (subword-mode) ; 对驼峰形，蛇形等命名法的单词支持
  )

(provide 'options)
