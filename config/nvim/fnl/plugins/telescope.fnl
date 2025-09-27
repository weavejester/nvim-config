(fn set-leader-keymap [k f desc]
  (vim.keymap.set :n (.. "<leader>" k) f {:desc desc}))

[{1 :nvim-telescope/telescope.nvim
  :dependencies [:nvim-telescope/telescope-ui-select.nvim
                 :nvim-lua/popup.nvim
                 :nvim-lua/plenary.nvim]
  :init
  (fn []
    (let [builtin (require "telescope.builtin")]
      (set-leader-keymap "ff" builtin.find_files "Telescope find files")
      (set-leader-keymap "fg" builtin.live_grep "Telescope live grep")
      (set-leader-keymap "fb" builtin.buffers "Telescope buffers")
      (set-leader-keymap "fh" builtin.help_tags "Telescope help tags")))
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
