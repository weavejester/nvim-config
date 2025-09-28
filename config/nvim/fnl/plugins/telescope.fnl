(local builtin (require "telescope.builtin"))

[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-lua/popup.nvim
                 :nvim-lua/plenary.nvim]
  :keys
  [{1 "<leader>ff" 2 builtin.find_files :desc "Telescope find files"}
   {1 "<leader>fg" 2 builtin.life_grep  :desc "Telescope life grep"}
   {1 "<leader>fb" 2 builtin.buffers    :desc "Telescope buffers"}
   {1 "<leader>fh" 2 builtin.help_tags  :desc "Telescope help tags"}]
  :config
  (fn []
    (let [telescope (require :telescope)
          themes    (require :telescope.themes)]
      (telescope.setup
        {:defaults {:file_ignore_patterns ["node_modules"]
                    :vimgrep_arguments ["rg"
                                        "--color=never"
                                        "--no-heading"
                                        "--with-filename"
                                        "--line-number"
                                        "--column"
                                        "--smart-case"
                                        "--iglob"
                                        "!.git"
                                        "--hidden"]}
         :extensions {:ui-select {1 (themes.get_dropdown {})}}
         :pickers    {:find_files {:find_command ["rg"
                                                  "--files"
                                                  "--iglob"
                                                  "!.git"
                                                  "--hidden"]}}})
      (telescope.load_extension "ui-select")))}]
