local opt = vim.opt
-- 字体
opt.guifont = "Hack:h20"

-- 行号
opt.number = true
opt.relativenumber = true

-- 缩进
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 自动折行
opt.wrap = false

-- 自动折叠
opt.foldlevel = 100

-- 光标行提示
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索无视大小写
opt.ignorecase = true
opt.smartcase = true

-- 系统剪切板
opt.clipboard:append("unnamedplus")

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
theme = "tokyonight-storm"
-- 可选主题
-- tokyonight
--   day
--   moon
--   night
--   storm(default)
-- catppuccin
--   latte
--   frappe
--   macchiato
--   mocha(default)

-- 编码格式
opt.fileencoding = "utf-8"
