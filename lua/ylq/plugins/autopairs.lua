local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
    return
end

autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})

local cmp_autopairs_step, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not cmp_autopairs_step then
    return
end

local cmp_step, cmp = pcall(require, "cmp")
if not cmp_step then
    return
end

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
