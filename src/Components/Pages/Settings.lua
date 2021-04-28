local Root = script.Parent.Parent.Parent
local Components = Root.Components

local Roact: Roact = require(Root.Packages.Roact)
local RoactRouter = require(Root.Packages.RoactRouter)

local PageBase = require(Components.PageBase)
local TextLabel = require(Components.TextLabel)
local Section = require(Components.Section)
local Divider = require(Components.Divider)

local e = Roact.createElement

local Component: RoactComponent = Roact.Component:extend("SettingsPage")

function Component:render()
    return e(RoactRouter.Route, {
        path = "/settings",
    }, {
        e(PageBase, {
            gap = 2,
        }, {
            displaySection = e(Section.Container, {
                order = 100,
            }, {
                header = e(Section.Header, {
                    title = "Display",
                    subtitle = "Configure settings relating to visual layout and data representation within the main plugin window.",
                }),

                formField = e(Section.Container, {
                    gap = .5,
                    order = 100,
                }, {
                    header = e(Section.Header, {
                        title = "Colour Codes",
                        subtitle = "This determines how colour codes are displayed in the search and palette results.",
                        boldTitle = false,
                    }),

                    select = nil,
                }),

                divider = e(Divider, {
                    order = 200,
                }),
            }),

            permissionsSection = e(Section.Container, {
                order = 200,
            }, {
                header = e(Section.Header, {
                    title = "Permissions",
                    subtitle = "Control what special permissions the plugin can use, and how it uses them. Permission controls are separate from the Roblox Studio prompts.",
                }),

                divider = e(Divider, {
                    order = 200,
                }),
            }),

            developerSection = e(Section.Container, {
                order = 300,
            }, {
                header = e(Section.Header, {
                    title = "Developer",
                    subtitle = "These settings relate to the development of the plugin, and can usually be left at default settings for standard users."
                }),

                divider = e(Divider, {
                    order = 200,
                }),
            }),

            footerSection = e(Section.Container, {
                order = 400,
            }, {
                about = e(Section.Header, {
                    title = "About Plugin",
                    subtitle = "Version: 0.0.0",
                }),

                updates = e(Section.Container, {
                    order = 100,
                    gap = .5,
                }, {
                    title = e(Section.Header, {
                        title = "Plugin Updates",
                        subtitle = "Last checked 0 minutes ago.",
                        boldTitle = false,
                    }),

                    status = e(TextLabel, {
                        order = 100,
                        colour = "SensitiveText",
                        label = "Plugin is up to date!",
                    }),
                })
            }),
        }),
    })
end

return Component
