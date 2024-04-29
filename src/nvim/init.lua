require ("config.keymaps")
require ("config.lazy")
require ("config.autocommands")
require ("config.options")

function FormatOnSave()
    local current_buffer = vim.api.nvim_get_current_buf()
    vim.cmd('silent! write') -- Save the current buffer before formatting
    vim.cmd('silent! !clang-format -i ' .. vim.api.nvim_buf_get_name(current_buffer))
    vim.cmd('silent! edit') -- Reload the buffer after formatting
end

vim.cmd('autocmd BufWritePre *.h,*.hpp,*.cc,*.cpp lua FormatOnSave()')
