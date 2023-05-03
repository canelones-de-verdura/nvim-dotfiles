require('telescope').setup{
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = { width = 100 },
      -- other layout configuration here
      prompt_position = "top",
      preview_cutoff = 0,
    },
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    file_browser = {
      path = "%:p:h",
      -- cwd
      cwd_to_path = true,
      grouped = true,
      files = true,
      add_dirs = true,
      depth = 1,
      auto_depth = false,
      select_buffer = false,
      hidden = true,
      -- respect_gitignore
      -- browse_files
      -- browse_folders
      hide_parent_dir = false,
      collapse_dirs = false,
      prompt_path = true,
      quiet = false,
      dir_icon = "",
      dir_icon_hl = "",
      disable_devicons = true,
      display_stat = { false },
      hijack_netrw = true,
      use_fd = false,
      git_status = true,
      mappings = {
        ["i"] = {
            -- Cosas.
        },
        ["n"] = {
            -- Cosas.
        },
      }
    }
  },
}

require("telescope").load_extension "file_browser"
