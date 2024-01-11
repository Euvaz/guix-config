local packer = nil

local function init()
    if packer == nil then
        packer = require('packer')
        packer.init()
    end

    local use = packer.use
    packer.reset()

    use('wbthomason/packer.nvim')

    use({
        'RRethy/nvim-base16',
        config = function()
            require('base16-colorscheme').setup({
                base00 = '#16161D', base01 = '#2c313c', base02 = '#3e4451', base03 = '#6c7891',
                base04 = '#565c64', base05 = '#abb2bf', base06 = '#9a9bb3', base07 = '#c5c8e6',
                base08 = '#e06c75', base09 = '#d19a66', base0A = '#e5c07b', base0B = '#98c379',
                base0C = '#56b6c2', base0D = '#0184bc', base0E = '#c678dd', base0F = '#a06949',
            })
        end
    })
    use({
        'windwp/nvim-autopairs',
        requires = 'hrsh7th/nvim-cmp',
        config = function()
            local autopairs = require('nvim-autopairs')
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')

            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

            autopairs.setup({})
        end,
    })
end

local plugins = setmetatable({}, {
    __index = function(_, key)
        init()
        return packer[key]
    end,
})

return plugins
