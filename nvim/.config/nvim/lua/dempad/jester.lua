local nnoremap = require("dempad.keymap").nnoremap

local silent = { silent = true }

nnoremap("<leader>tn", function()
    require("jester").run()
end, silent)
nnoremap("<leader>tf", function()
    require("jester").run_file()
end, silent)
