local MainParent = script.Parent
local Packages = MainParent.Parent.roblox_packages
local Types = require(MainParent.Types)
local GenerateName = require(MainParent.GenerateName)
local UI = require(Packages.ui)
local New = UI.New
local Spring = UI.Spring
local State = UI.State
local Event = UI.Event
local Cleanup = UI.Cleanup

return function(Properties: Types.CanvasProperties): (Types.Canvas)
    local Canvas = New "CanvasGroup" {
        Name = GenerateName(Properties.Name or "Canvas"),

        BackgroundColor3 = Properties.BackgroundColor,
        Size = Properties.Size,
        Position = Properties.Position,
        BorderSizePixel = Properties.BorderSizePixel or 0,
        AnchorPoint = Properties.AnchorPoint or Vector2.zero,
        GroupTransparency = Properties.GroupTransparency or 0,
    }

    if Properties.Rounding then
        New "UICorner" {
            Name = GenerateName("Corner"),
            Parent = Canvas,

            CornerRadius = Properties.Rounding,
        }
    end

    if Properties.Stroke then
        New "UIStroke" {
            Name = GenerateName("Stroke"),
            Parent = Canvas,

            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Properties.Stroke.Color,
            Thickness = Properties.Stroke.Thickness,
        }
    end

    return Canvas
end
