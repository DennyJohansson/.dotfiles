-- ?tab=readme-ov-file
-- <leader>a	+ai	n
-- <leader>aa	Toggle (CopilotChat)	n, v
-- <leader>aq	Quick Chat (CopilotChat)	n, v
-- <leader>ax	Clear (CopilotChat)	n, v
local chat = require('CopilotChat')
-- local actions = require('CopilotChat.actions')
-- local integration = require('CopilotChat.integrations.fzflua')

chat.setup({
    question_header = '',
    answer_header = '',
    error_header = '',
    allow_insecure = true,
    mappings = {
        submit_prompt = {
            insert = '',
        },
        reset = {
            normal = '',
            insert = '',
        },
    },
    prompts = {
        Explain = {
            mapping = '<leader>ae',
            description = '[A]I [E]xplain',
        },
        Review = {
            mapping = '<leader>ar',
            description = '[A]I [R]eview',
        },
        Tests = {
            mapping = '<leader>at',
            description = '[A]I [T]ests',
        },
        Fix = {
            mapping = '<leader>af',
            description = '[A]I [F]ix',
        },
        Optimize = {
            mapping = '<leader>ao',
            description = '[A]I [O]ptimize',
        },
        Docs = {
            mapping = '<leader>ad',
            description = '[A]I [D]ocumentation',
        },
        CommitStaged = {
            mapping = '<leader>ac',
            description = '[A]I Generate [C]ommit',
        },
    },
})

vim.keymap.set('n', "<leader>aq",
  function()
    local input = vim.fn.input("Quick Chat: ")
    if input ~= "" then
      require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
    end
  end,
  {
    desc =
    "[A]i [Q]uick chat",
  })
-- utils.au('BufEnter', {
--     pattern = 'copilot-*',
--     callback = function()
--         vim.opt_local.relativenumber = false
--         vim.opt_local.number = false
--     end,
-- })

-- local function pick(pick_actions)
--   return function()
--     integration.pick(pick_actions(), {
--       fzf_tmux_opts = {
--         ['-d'] = '45%',
--       },
--     })
--   end
-- end

vim.keymap.set({ 'n', 'v' }, '<leader>aa', chat.toggle, { desc = '[A]I Toggle' })
vim.keymap.set({ 'n', 'v' }, '<leader>ax', chat.reset, { desc = '[A]I Reset' })
-- vim.keymap.set({ 'n', 'v' }, '<leader>ah', pick(actions.help_actions), { desc = '[A]I [H]elp Actions' })
-- vim.keymap.set({ 'n', 'v' }, '<leader>ap', pick(actions.prompt_actions), { desc = '[A]I [P]rompt Actions' })
