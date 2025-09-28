[{1 :nvim-neo-tree/neo-tree.nvim
  :branch "v3.x"
  :lazy false
  :dependencies [:nvim-lua/plenary.nvim
                 :MunifTanjim/nui.nvim
                 :nvim-tree/nvim-web-devicons]
  :keys
  [{1 "<leader>tt" 2 "<cmd>Neotree toggle<cr>" :desc "Toggle Neotree"}]
  :config
  (fn []
    (let [neo-tree (require "neo-tree")]
      (neo-tree.setup
        {:window {:width 25}
         :source_selector
         {:sources [{:source :filesystem}
                    {:source :buffers}
                    {:source :git_status} ]}})))}]
