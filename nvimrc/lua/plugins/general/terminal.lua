return {
    'numToStr/FTerm.nvim',
    lazy = true,
    config = function()
        if vim.fn.has("unix") == 1 then
            require("FTerm").setup({ cmd = V.terminal.unix })
        elseif vim.fn.has("win32") == 1 then
            require("FTerm").setup({ cmd = V.terminal.windows })
        end
    end
}
