--[[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
--map('i', 'jk', '<esc>', {noremap=true})
map('n', '<space>f', ':Telescope find_files <enter>', {noremap=true})
map('n', '<space>n', ':NvimTreeToggle <enter>', {noremap=true})
map('i', '<Tab>', '<C-x><C-o>', {noremap=true})
map('n', '<space>t', ':TransparentEnable <enter>', {noremap=true})
map('n', '<space>td', ':TransparentDisable <enter>', {noremap=true})
