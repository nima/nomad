local record Role
  _tag: string
  desc: string
end

local record RoleSet
    Toggle:    Role
    TUI:       Role
    Win:       Role
    LSP:       Role
    Nav:       Role
    Power:     Role
    AI:        Role
    SCM:       Role
    Info:      Role
    Naked:     Role
end
setmetatable(RoleSet, { __newindex = function() error("Cannot add new enum values to RoleSet") end })

local Roles: RoleSet = {
    Toggle    = { _tag = "Toggle", desc = "It goes on... it goes off" },
    TUI       = { _tag = "TextualUserInterface", desc = "The Rakhsh IDE" },
    Win       = { _tag = "WindowManagement", desc = "TUI Window management" },
    LSP       = { _tag = "LanguageServerProtocol", desc = "All LSP-related hotkeys" },
    Nav       = { _tag = "Navigation", desc = "All navigation-related hotkeys" },
    Power     = { _tag = "PowerTool", desc = "Power moves to charm" },
    AI        = { _tag = "ArtificialIntelligence", desc = "Anything involving AI or LLM API calls" },
    SCM       = { _tag = "SourceControlManagement", desc = "Anything related to Git" },
    Info      = { _tag = "Information", desc = "Strictly non-mutating commands" },
    Naked     = { _tag = "Immediate", desc = "These are not protected by any preceding keystrokes" },
}
setmetatable(Roles, { __newindex = function() error("Cannot add new enum values to Roles") end })

local ActivationPrefix: {string: {Role: string}} = {
    n = {
        [Roles.Toggle]    = "<Esc>",
        [Roles.TUI]       = "<F3>",
        [Roles.Win]       = "<C-w>",
        [Roles.LSP]       = "<F12>",
        [Roles.Nav]       = "<F4>",
        [Roles.Power]     = "\\",
        [Roles.AI]        = "<F5>",
        [Roles.SCM]       = "<Leader>g",
        [Roles.Info]      = "<F1>",
        [Roles.Naked]     = "",
    },
    v = { [Roles.AI] = "<Leader>i", },
    i = {},
}
setmetatable(ActivationPrefix, { __newindex = function() error("Cannot add new enum values to Roles") end })

local M = {
    Role             = Role,
    Roles            = Roles,
    ActivationPrefix = ActivationPrefix,
}

return M
