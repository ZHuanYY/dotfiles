-- 自动补全
return {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        { "windwp/nvim-autopairs", opts = {} },
    },
    config = function()
        -- 自动补全

        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
            return
        end

        local snip_status_ok, luasnip = pcall(require, "luasnip")
        if not snip_status_ok then
            return
        end

        require("luasnip.loaders.from_vscode").lazy_load()

        -- 下面会用到这个函数
        local check_backspace = function()
            local col = vim.fn.col "." - 1
            return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
        end


        cmp_config = {
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.abort(), -- 取消补全，esc也可以退出
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),

                -- ["<Tab>"] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.select_next_item()
                --     elseif luasnip.expandable() then
                --         luasnip.expand()
                --     elseif luasnip.expand_or_jumpable() then
                --         luasnip.expand_or_jump()
                --     elseif check_backspace() then
                --         fallback()
                --     else
                --         fallback()
                --     end
                -- end, {
                --     "i",
                --     "s",
                -- }),

                -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.select_prev_item()
                --     elseif luasnip.jumpable(-1) then
                --         luasnip.jump(-1)
                --     else
                --         fallback()
                --     end
                -- end, {
                --     "i",
                --     "s",
                -- }),
            }),

            formatting = {
                fields = { "kind", "abbr", "menu" },
                max_width = 0,
                kind_icons = {
                    Array = "",
                    Boolean = "",
                    Class = "",
                    Color = "",
                    Constant = "",
                    Constructor = "",
                    Enum = "",
                    EnumMember = "",
                    Event = "",
                    Field = "",
                    File = "",
                    Folder = "󰉋",
                    Function = "",
                    Interface = "",
                    Key = "",
                    Keyword = "",
                    Method = "",
                    Module = "",
                    Namespace = "",
                    Null = "󰟢",
                    Number = "",
                    Object = "",
                    Operator = "",
                    Package = "",
                    Property = "",
                    Reference = "",
                    Snippet = "",
                    String = "",
                    Struct = "",
                    Text = "",
                    TypeParameter = "",
                    Unit = "",
                    Value = "",
                    Variable = "",
                },

                source_names = {
                    nvim_lsp = "[LSP]",
                    treesitter = "[TS]",
                    emoji = "[Emoji]",
                    path = "[Path]",
                    calc = "[Calc]",
                    cmp_tabnine = "[Tabnine]",
                    vsnip = "[Snippet]",
                    luasnip = "[Snippet]",
                    buffer = "[Buffer]",
                    spell = "[Spell]",
                    orgmode = "[Org]",
                },

                format = function(entry, vim_item)
                    vim_item.kind = string.format("%s", cmp_config.formatting.kind_icons[vim_item.kind])
                    vim_item.menu = cmp_config.formatting.source_names[entry.source.name]
                    local MAX_LABEL_WIDTH = 40
                    local ELLIPSIS_CHAR = "..."
                    local label = vim_item.abbr
                    local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
                    if truncated_label ~= label then
                        vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
                    end
                    return vim_item
                end,


                -- duplicates = {
                --     buffer = 1,
                --     path = 1,
                --     nvim_lsp = 0,
                --     luasnip = 1,
                -- },
                --
                -- duplicates_default = 0,
                -- format = function(entry, vim_item)
                --     local max_width = cmp_config.formatting.max_width
                --     if max_width ~= 0 and #vim_item.abbr > max_width then
                --         vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
                --     end
                --     vim_item.kind = cmp_config.formatting.kind_icons[vim_item.kind]
                --     vim_item.menu = cmp_config.formatting.source_names[entry.source.name]
                --     vim_item.dup = cmp_config.formatting.duplicates[entry.source.name]
                --         or cmp_config.formatting.duplicates_default
                --     return vim_item
                -- end,
            },


            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            -- 这里重要
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
                { name = 'buffer' },
                { name = 'orgmode' },
            })
        }

        cmp.setup(cmp_config)

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline('?', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'cmdline' }
            }, {
                { name = 'path' }
            })
        })
    end,
}

