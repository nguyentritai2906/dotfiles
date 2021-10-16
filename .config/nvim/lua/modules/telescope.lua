local actions = require('telescope.actions')
local utils = require "telescope.utils"

require('telescope').setup{
    pickers = {
        buffers = {
            sort_lastused = true,
            mappings = {
                i = {
                    ["<C-x>"] = actions.delete_buffer,
                }
            }
        }
    },
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-[>"] = actions.close,
            },
        },
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                mirror = false,
                preview_width = 0.6,
                prompt_position = 'top',
            },
            vertical = {
                mirror = false,
            },
        },
        -- file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        -- generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        path_display = {
            "smart",
        },
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
        extensions = {
            -- fzf = {
            --     fuzzy = true,                        -- false will only do exact matching
            --         override_generic_sorter = false, -- override the generic sorter
            --         override_file_sorter = true,     -- override the file sorter
            --         case_mode = "smart_case",        -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
            -- },
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true,
            }
        },

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    }
}

require("telescope").load_extension("gh")
-- require("telescope").load_extension("fzf")
require("telescope").load_extension("fzy_native")
require("telescope").load_extension("project")
require"telescope".load_extension("frecency")

local M = {}

-- requires github extension
function M.gh_issues()
  local opts = {}
  opts.prompt_title = " Issues"
  -- opts.author = '@me'
  require("telescope").extensions.gh.issues(opts)
end

-- @TODOUA: works for basic/default scenarios, file issue or PR
-- Use my fzf-gh for now for PRs
function M.gh_prs()
  local opts = {}
  opts.prompt_title = " Pull Requests"
  -- opts.author = 'joelpalmer'
  -- opts.search = 'is:open is:pr review-requested:@me'
  require("telescope").extensions.gh.pull_request(opts)
end
-- end github functions

function M.rg()
  require("telescope.builtin").grep_string {
    search = vim.fn.input "Rg❯  ",
  }
end

M.project_files = function()
  local _, ret, stderr = utils.get_os_command_output {
    "git",
    "rev-parse",
    "--is-inside-work-tree",
  }

  local gopts = {}
  local fopts = {}

  gopts.prompt_title = "Git Files"
  gopts.prompt_prefix = " ❯ "
  gopts.show_untracked = false

  fopts.hidden = true
  -- @TODOUA: see if TJ's stuff from his 16-Jul-2021 stream helps here
  fopts.file_ignore_patterns = {
    ".vim/",
    ".local/",
    ".cache/",
    "Downloads/",
    ".git/",
    "Dropbox/.*",
    "Library/.*",
    ".rustup/.*",
    "Movies/",
    ".cargo/registry/",
  }

  if ret == 0 then
    require("telescope.builtin").git_files(gopts)
  else
    require("telescope.builtin").find_files(fopts)
  end
end

-- find files in popular dirs
-- function M.find_files()
--     require('telescope.builtin').find_files {
--         prompt_title = 'Find Files',
--         shorten_path = false,
--         -- file_ignore_patterns = { "Dropbox/.*", "Library/.*", "code_smell/.*", ".rustup/.*", "Movies/" },
--         search_dirs = {
--             '~/.oh-my-zsh/custom/'
--         },
--         hidden = true,
--         cwd = '~',
--         width = .25,
--         layout_strategy = 'horizontal',
--         layout_config = {preview_width = 0.65}
--     }
-- end

-- @TODOUA: work HOME dot files into one of these
function M.grep_notes()
  local opts = {}
  opts.hidden = true
  -- opts.file_ignore_patterns = { 'thesaurus/'}
  opts.search_dirs = {
    "~/Documents/notes/",
  }
  opts.prompt_prefix = " ❯  "
  opts.prompt_title = "Grep Notes"
  require("telescope.builtin").live_grep(opts)
end

function M.find_notes()
  require("telescope.builtin").find_files {
    prompt_title = "Find Notes",
    cwd = "~/Documents/notes/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

function M.find_home()
  local opts = {}
  opts.hidden = true
  opts.cwd = "~"
  opts.file_ignore_patterns = {
    "%.vim/",
    "%.local/",
    "%.cache/",
    "Downloads/",
    "%.git/",
    "Dropbox/.*",
    "Library/.*",
    "%.rustup/.*",
    "Movies/",
    "Applications/",
    "%.cargo/registry/",
    "%.oh%-my%-zsh/",
    "zsh%-syntax%-highlighting/",
    "opt"
  }
  require("telescope.builtin").find_files(opts)
end

function M.browse_notes()
  require("telescope.builtin").file_browser {
    prompt_title = "Notes Browser",
    prompt_prefix = " ﮷❯ ",
    cwd = "~/Documents/notes/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

function M.file_explorer()
  require("telescope.builtin").file_browser {
    prompt_title = "File Browser",
    cwd = "~",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
    hidden = true,
  }
end

function M.nvim_config()
  require("telescope.builtin").find_files {
    prompt_title = "Find Config",
    cwd = "~/.config/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

vim.api.nvim_set_keymap("n", "<Leader>ff", [[<cmd>lua require'telescope.builtin'.find_files({file_ignore_patterns = {"__pycache__", "%.jpeg", "%.png", "%.jpg", "Session.vim"}})<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fF", [[<cmd>lua require'modules.telescope'.find_home()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>f;", [[<cmd>lua require'telescope.command'.load_command()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fc", [[<cmd>lua require'telescope.builtin'.commands()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fr", [[<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>]], { noremap = true, silent = true})
-- live grep slowness: https://github.com/nvim-telescope/telescope.nvim/issues/392
vim.api.nvim_set_keymap("n", "<Leader>fl", [[<cmd>lua require'telescope.builtin'.live_grep()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fk", [[<cmd>lua require'telescope.builtin'.keymaps()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fb", [[<cmd>lua require'telescope.builtin'.buffers()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>fh", [[<cmd>lua require'telescope.builtin'.help_tags()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fm", [[<cmd>lua require'telescope.builtin'.marks()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fK", [[<cmd>lua require'telescope.builtin'.grep_string()<CR>]], { noremap = true, silent = true}) -- CWORD
-- find files with gitfiles & fallback on find_files
vim.api.nvim_set_keymap("n", "<leader>fg", [[<cmd>lua require'modules.telescope'.project_files()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>f/", [[<cmd>lua require'modules.telescope'.nvim_config()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fn", [[<cmd>lua require'modules.telescope'.find_notes()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fe", [[<cmd>lua require'telescope.builtin'.file_browser({ hidden = true })<CR>]], { noremap = true, silent = true}) -- CWD
vim.api.nvim_set_keymap("n", "<leader>fE", [[<cmd>lua require'modules.telescope'.file_explorer()<CR>]], { noremap = true, silent = true}) -- $HOME
vim.api.nvim_set_keymap("n", "<leader>f.", [[<cmd>lua require'modules.telescope'.rg()<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fp", [[<cmd>lua require'telescope'.extensions.project.project{}<CR>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>fC", [[<cmd>lua require('telescope').extensions.neoclip.default()<CR>]], { noremap = true, silent = true})

-- github branches
-- vim.api.nvim_set_keymap("n", "<leader>fgb", [[<cmd>lua require'telescope.builtin'.git_branches()<CR>]], { noremap = true, silent = true})

return M
