vim.g.mapleader = " " -- 设置主键
local keymap = vim.keymap
-- keymap.set("mode", "<key>", "command")




-- ---------- 正常模式 ---------- --

keymap.set("n", "<leader>nh", ":nohl<CR>") -- 取消高亮
keymap.set("n","<c-j>","o<esc>k") -- 下方插入一行
keymap.set("n","<c-k>","o<esc>j") -- 上方插入一行

-- ---------- 插入模式 ---------- --

-- ---------- 视觉模式 ---------- --
