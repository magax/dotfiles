-- Check packer installation
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap =
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd([[packadd packer.nvim]])
end

local opts = { silent = true, noremap = true }

return require("packer").startup(function(use)
  -- Packer can manage itself`
  use("wbthomason/packer.nvim")

  -- Configurations for Nvim LSP
  use({
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  })

  use("williamboman/mason-lspconfig.nvim")

  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("config/lsp_rc")
    end,
  })

  use({
    "nvimtools/none-ls.nvim",
    config = function()
      require("config/none-ls_rc")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })

  -- Color schemes
  use({
    "dracula/vim",
    as = "dracula",
    config = function()
      vim.cmd("colorscheme dracula")
      vim.cmd(":highlight Normal ctermbg=black")
    end,
  })

  -- Icons
  use("nvim-tree/nvim-web-devicons")

  -- Tree-sitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("config/treesitter_rc")
    end,
  })
  use("nvim-treesitter/nvim-treesitter-context")

  -- FZF Lua
  use({
    "ibhagwan/fzf-lua",
    config = function()
      require("config/fzf_rc")
    end,
  })

  -- Completion
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("config/cmp_rc")
    end,
  }) -- Engine
  use({ "hrsh7th/cmp-nvim-lsp" }) -- LSP completion
  use({ "hrsh7th/cmp-buffer" }) -- buffer completion
  use({ "hrsh7th/cmp-path" }) -- path completion
  -- snippet completion
  use({ "L3MON4D3/LuaSnip" })
  use({ "saadparwaiz1/cmp_luasnip" })

  -- Vim Airline
  use("vim-airline/vim-airline")

  -- Comments
  use("preservim/nerdcommenter")

  -- Autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
