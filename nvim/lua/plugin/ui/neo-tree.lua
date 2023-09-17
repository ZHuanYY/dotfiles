-- 文件系统
-- 默认快捷键
-- <A> 新建文件夹
-- <a> 新建文件或文件夹
-- <d> 删除文件
-- <r> 重命名
-- <y> 复制
-- <x> 剪切
-- <p> 粘贴
-- <c> = <yp>
-- <m> = <xp>
-- <q> 退出
-- <R> 刷新
-- <?> 帮助文档
-- <f> 搜索
-- <H> 隐藏文件切换显示
-- .......

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    keys = {
        {"<leader>e", "<cmd>Neotree toggle<cr>", desc = "开关文件浏览器"},
    },
    opts = {
        close_if_last_window = true,
        enable_git_status = false,
        default_component_configs = {
            indent = {
                indent_size = 2,
                padding = 1, -- extra padding on left hand side
                -- indent guides
                with_markers = false,
                indent_marker = "│",
                last_indent_marker = "└",
                highlight = "NeoTreeIndentMarker",
                -- expander config, needed for nesting files
                with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
        },
        filesystem = {
            filtered_items = {
                hide_gitignored = false,
                always_show = {
                    ".gitignore",
                },
            },
            follow_current_file = {
                enabled = true,
            },
        },
        -- 打开文件后自动隐藏文件系统
        event_handlers = {

          {
            event = "file_opened",
            handler = function(file_path)
              -- auto close
              -- vimc.cmd("Neotree close")
              -- OR
              require("neo-tree.command").execute({ action = "close" })
            end
          },

        },
    },
}
