(local {: autoload} (require :nfnl.module))
(local lsp (autoload :config.lsp))

[{1 :nvim-lualine/lualine.nvim
  :config (fn []
            (let [lualine (require :lualine)]
              (lualine.setup {})))}]
