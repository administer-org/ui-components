local MainParent = script.Parent
local Packages = MainParent.Parent.roblox_packages
local GenerateName = require(MainParent.GenerateName)
local Types = require(MainParent.Types)
local UI = require(Packages.ui)
local New = UI.New
local Spring = UI.Spring
local State = UI.State
local Event = UI.Event
local Cleanup = UI.Cleanup

return function(Properties: Types.FrameProperties): Frame
	local Frame = New "Frame" {
		Name = GenerateName(Properties.Name or "Frame"),

		BackgroundColor3 = Properties.BackgroundColor,
		Size = Properties.Size,
		Position = Properties.Position,
		BorderSizePixel = Properties.BorderSizePixel or 0,
		AnchorPoint = Properties.AnchorPoint or Vector2.zero,
		Transparency = Properties.Transparency or 0,
	}

	if Properties.Rounding then
		New "UICorner" {
			Name = GenerateName("Corner"),
			Parent = Frame,

			CornerRadius = Properties.Rounding,
		}
	end

	if Properties.Stroke then
		New "UIStroke" {
			Name = GenerateName("Stroke"),
			Parent = Frame,

			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Properties.Stroke.Color,
			Thickness = Properties.Stroke.Thickness,
		}
	end

	return Frame
end
