[{1 :romgrk/barbar.nvim
  :dependencies [:lewis6991/gitsigns.nvim
                 :nvim-tree/nvim-web-devicons]
  :init
  (fn [] (set vim.g.barbar_auto_setup false))
  :config
  (fn []
    (let [barbar (require "barbar")]
      (barbar.setup {:auto_hide true})))}]
