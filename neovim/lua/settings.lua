local M = {}

M.settings = function()
    vim.api.nvim_set_var("cursorword_disable_at_startup" , false)
    vim.api.nvim_set_var("cursorword_min_width"          , 2    )
    vim.api.nvim_set_var("loaded_perl_provider"          , 0    )
    vim.api.nvim_set_var("loaded_ruby_provider"          , 0    )

    vim.o.number = true
    vim.o.relativenumber = true
    vim.o.expandtab = true
    vim.o.tabstop = 8
    vim.o.shiftwidth = 4
    vim.o.smarttab = true
    vim.o.softtabstop = 1
    vim.o.mouse = 'a'
    vim.o.encoding = "UTF-8"
    vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
    vim.o.signcolumn = "yes"
    vim.o.completeopt = "menu,preview"
    vim.o.hlsearch = true
    vim.o.updatetime = 300
    vim.o.timeoutlen = 500
    vim.o.backup = false
    vim.o.ruler = false
    vim.o.writebackup = false
    vim.o.fillchars = "stl: ,stlnc: ,vert: "
    vim.o.cmdheight = "0"
    vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
    vim.o.foldmethod = "indent"
    vim.o.foldlevelstart = -1
    vim.o.foldcolumn = "1"
    vim.o.laststatus = 1
    vim.o.hidden = false

    vim.api.nvim_command([[autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2]])

    vim.api.nvim_create_autocmd("FileType", {
        command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"
    })
end

M.theme = function()
    vim.api.nvim_create_autocmd("ColorScheme", {
        command = [[
            hi Pmenu guibg=NONE ctermbg=NONE ctermfg=3 guifg=3                                |
            hi PmenuSel guibg=NONE ctermbg=NONE ctermfg=10 guifg=10                           |
            hi PmenuSbar guibg=NONE ctermbg=NONE ctermfg=NONE guifg=NONE                      |
            hi PmenuThumb guibg=5 ctermbg=5 ctermfg=5 guifg=5                                 |
            hi Conceal guibg=NONE ctermbg=NONE ctermfg=1 guifg=1                              |
            hi CocFloating guibg=NONE ctermbg=NONE ctermfg=3 guifg=3                          |
            hi CocMenuSel guibg=NONE ctermbg=NONE ctermfg=10 guifg=10                         |
            hi CocInlayHint guibg=NONE ctermbg=NONE ctermfg=15 guifg=15                       |
            hi MatchParen guibg=NONE ctermbg=NONE ctermfg=15 guifg=15                         |
            hi Folded guibg=NONE ctermbg=NONE ctermfg=5 guifg=5                               |
            hi FoldColumn guibg=NONE ctermbg=NONE ctermfg=5 guifg=5                           |
            hi DiffAdd ctermbg=NONE guifg=NONE                                                |
            hi VertSplit cterm=NONE gui=NONE                                                  |
            hi SignColumn ctermbg=NONE guibg=NONE                                             |
            hi Normal guibg=NONE ctermbg=NONE ctermfg=13 guifg=13                             |
            hi EndOfBuffer guibg=NONE ctermbg=NONE ctermfg=NONE guifg=NONE                    |
            hi CursorWord cterm=underline gui=underline                                       |
            hi CursorLineNr cterm=NONE gui=NONE                                               |
            hi CursorLine cterm=none gui=none ctermbg=none ctermfg=none guibg=none guifg=none |
            hi CursorColumn ctermfg=11 ctermbg=NONE guifg=11 guibg=NONE                       |
            hi Constant guibg=NONE ctermbg=NONE ctermfg=6 guifg=6                             |
            hi Number guibg=NONE ctermbg=NONE ctermfg=12 guifg=12                             |
            hi Special guibg=NONE ctermbg=NONE ctermfg=11 guifg=11                            |
            hi SpecialChar guibg=NONE ctermbg=NONE ctermfg=3 guifg=3                          |
            hi String guibg=NONE ctermbg=NONE ctermfg=6 guifg=6                               |
            hi Type cterm=italic ctermfg=10 gui=italic guifg=10                               |
            hi Keyword cterm=italic ctermfg=11 gui=italic guifg=11                            |
            hi PreProc cterm=italic ctermfg=12 gui=italic guifg=12                            |
            hi Todo ctermfg=11 ctermbg=NONE guifg=11 guibg=NONE                               |
            hi Visual ctermfg=NONE ctermbg=8 guifg=NONE guibg=8                               |
            hi DiffAdd ctermfg=2 ctermbg=NONE guifg=2 guibg=NONE                              |
            hi DiffChange ctermfg=5 ctermbg=NONE guifg=5 guibg=NONE                           |
            hi DiffDelete ctermfg=1 ctermbg=NONE guifg=1 guibg=NONE                           |
            hi DiffText ctermfg=6 ctermbg=NONE guifg=6 guibg=NONE                             |
            hi StatusLine cterm=NONE ctermfg=13 ctermbg=NONE                                  |
            hi StatusLineNC cterm=NONE ctermfg=13 ctermbg=NONE                                |
            hi Twilight ctermfg=8
        ]]
    })

    vim.api.nvim_command([[colorscheme ]] .. _G.V.colorscheme)
end

M.setup = function()
    M.theme()

    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function() M.settings() _G.V.post_setup_callback() end
    })
end

return M
