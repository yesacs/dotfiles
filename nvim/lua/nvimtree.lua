require'nvim-tree'.setup {
    disable_netrw = false,
    hijack_netrw = false,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    diagnostics = {
        enable = false,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    update_focused_file = {enable = false, update_cwd = false, ignore_list = {}},
    system_open = {cmd = nil, args = {}},
    filters = {dotfiles = false, custom = {}},
    view = {
        width = 30,
        side = 'left',
    }
}
