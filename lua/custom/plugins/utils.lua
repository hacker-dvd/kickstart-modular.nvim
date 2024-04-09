return {
  {
    'windwp/nvim-autopairs',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },

  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    keys = {
      {
        '<leader>fe',
        function()
          require('neo-tree.command').execute { toggle = true, dir = vim.fn.getcwd() }
        end,
        desc = 'Explorer NeoTree (cwd)',
      },
      {
        '<leader>fE',
        function()
          require('neo-tree.command').execute { toggle = true, reveal = true }
        end,
        desc = 'Explorer NeoTree (Reveal Current File)',
      },
      {
        '<leader>ge',
        function()
          require('neo-tree.command').execute { source = 'git_status', toggle = true }
        end,
        desc = 'Git Explorer',
      },
      {
        '<leader>be',
        function()
          require('neo-tree.command').execute { source = 'buffers', toggle = true }
        end,
        desc = 'Buffer Explorer',
      },
    },
    config = function()
      require('neo-tree').setup {
        close_if_last_window = true, -- Close Neo-tree if it is the last window
        popup_border_style = 'rounded',
        enable_git_status = true,
        enable_diagnostics = true,
        sources = {
          'filesystem',
          'buffers',
          'git_status',
        },
        filesystem = {
          filtered_items = {
            visible = false, -- set to true to make hidden files visible
          },
          follow_current_file = true, -- This will find and focus the current file in the active buffer
        },
        window = {
          mappings = {
            ['<space>'] = 'none', -- disable the default mapping to toggle node
            ['Y'] = function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg('+', path, 'c')
            end,
            ['O'] = function(state)
              local path = state.tree:get_node().path
              vim.fn.system { 'xdg-open', path } -- This uses `xdg-open` for Linux. Adapt for other OSes.
            end,
          },
        },
      }
    end,
  },
}
