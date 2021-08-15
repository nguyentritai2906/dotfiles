local actions = require('telescope.actions')
local utils = require "telescope.utils"

require('telescope').setup{
  defaults = {
    mappings = {
          i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
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
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

-- github CLI
require("telescope").load_extension("gh")

require("telescope").load_extension("fzf")

require("telescope").load_extension("projects")

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
    path_display = { "shorten" },
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
  opts.path_display = { "shorten" }
  require("telescope.builtin").live_grep(opts)
end

function M.find_notes()
  require("telescope.builtin").find_files {
    prompt_title = "Find Notes",
    path_display = { "shorten" },
    cwd = "~/Documents/notes/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
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
    path_display = { "shorten" },
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

vim.api.nvim_set_keymap( "n", "<Leader>ff", [[<Cmd>lua require'telescope.builtin'.find_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap( "n", "<Leader>fF", [[<Cmd>lua require'telescope.builtin'.find_files({cwd = '~'})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap( "n", "<Leader>f;", [[<Cmd>lua require'telescope.command'.load_command()<CR>]], { noremap = true, silent = true })

-- open available commands & run it
vim.api.nvim_set_keymap( "n", "<Leader>fc", [[<Cmd>lua require'telescope.builtin'.commands()<CR>]], { noremap = true, silent = true })

-- -- commands - Lua API in the works: https://github.com/neovim/neovim/pull/12378
-- -- git_branches
-- vim.api.nvim_set_keymap( "n", "<leader>fgb", [[<Cmd>lua require'telescope.builtin'.git_branches()<CR>]], { noremap = true, silent = true })

-- -- git_status - <tab> to toggle staging
-- vim.api.nvim_set_keymap( "n", "<Leader>fgs", [[<Cmd>lua require'telescope.builtin'.git_status()<CR>]], { noremap = true, silent = true })

-- Telescope oldfiles
vim.api.nvim_set_keymap( "n", "<Leader>fr", [[<Cmd>lua require'telescope.builtin'.oldfiles({ path_display =  {"shorten"} })<CR>]], { noremap = true, silent = true })

-- live grep slowness: https://github.com/nvim-telescope/telescope.nvim/issues/392
vim.api.nvim_set_keymap( "n", "<Leader>fl", [[<Cmd>lua require'telescope.builtin'.live_grep()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap( "n", "<Leader>fm", [[<Cmd>lua require'telescope.builtin'.keymaps()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap( "n", "<Leader>fb", [[<Cmd>lua require'telescope.builtin'.buffers()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap( "n", "<Leader>fh", [[<Cmd>lua require'telescope.builtin'.help_tags()<CR>]], { noremap = true, silent = true })

-- vim.api.nvim_set_keymap( "n", "<leader>fm", [[<Cmd>lua require'telescope.builtin'.marks()<CR>]], { noremap = true, silent = true })

-- -- grep word under cursor
-- vim.api.nvim_set_keymap( "n", "<leader>gs", [[<Cmd>lua require'telescope.builtin'.grep_string()<CR>]], { noremap = true, silent = true })

-- find files with gitfiles & fallback on find_files
vim.api.nvim_set_keymap( "n", "<leader>fg", [[<Cmd>lua require'modules.telescope'.project_files()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap( "n", "<leader>f/", [[<Cmd>lua require'modules.telescope'.nvim_config()<CR>]], { noremap = true, silent = true })

-- -- browse, explore and create notes
-- vim.api.nvim_set_keymap( "n", "<leader>bn", [[<Cmd>lua require'modules.telescope'.browse_notes()<CR>]], { noremap = true, silent = true })

-- find notes
vim.api.nvim_set_keymap( "n", "<leader>fn", [[<Cmd>lua require'modules.telescope'.find_notes()<CR>]], { noremap = true, silent = true })

-- -- search notes
-- vim.api.nvim_set_keymap( "n", "<leader>gn", [[<Cmd>lua require'modules.telescope'.grep_notes()<CR>]], { noremap = true, silent = true })

-- Explore files starting at $HOME
vim.api.nvim_set_keymap( "n", "<leader>fe", [[<Cmd>lua require'telescope.builtin'.file_browser()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap( "n", "<leader>fE", [[<Cmd>lua require'modules.telescope'.file_explorer()<CR>]], { noremap = true, silent = true })

-- Ripgrep
vim.api.nvim_set_keymap( "n", "<leader>f.", [[<Cmd>lua require'modules.telescope'.rg()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap( "n", "<leader>fp", [[<Cmd>lua require'telescope'.extensions.projects.projects()<CR>]], { noremap = true, silent = true })

-- -- github issues
-- vim.api.nvim_set_keymap( "n", "<leader>gis", [[<Cmd>lua require'modules.telescope'.gh_issues()<CR>]], { noremap = true, silent = true })

return M
