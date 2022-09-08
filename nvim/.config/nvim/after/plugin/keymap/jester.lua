local nnoremap = require("dempad.keymap").nnoremap

nnoremap("<leader>+tn", function() require("jester").run() end, silent)
nnoremap("<leader>+tf", function() require("jester").run_file() end, silent)
