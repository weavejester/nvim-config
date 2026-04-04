[{1 :nvim-treesitter/nvim-treesitter
  :branch :main
  :build ":TSUpdate"
  :lazy false
  :config (fn []
            (let [treesitter (require :nvim-treesitter)]
              (treesitter.setup {:highlight {:enable true}
                                 :indent {:enable true}
                                 :ensure_installed [:bash
                                                    :clojure
                                                    :commonlisp
                                                    :dockerfile
                                                    :fennel
                                                    :html
                                                    :java
                                                    :javascript
                                                    :json
                                                    :lua
                                                    :markdown
                                                    :yaml]})))}]
