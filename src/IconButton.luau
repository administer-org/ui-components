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

return function(Properties: Types.IconButtonProperties): Types.IconButton
	-- TODO (FloofyPlasma): Animations
	local SubIcon = Properties.SubIcon ~= nil
			and New "ImageLabel" {
				ImageColor3 = Color3.fromRGB(255, 255, 255),
				BorderSizePixel = 0,
				ScaleType = Enum.ScaleType.Fit,
				BackgroundColor3 = Color3.fromRGB(15, 16, 21),
				Position = UDim2.new(0.55, 0, 0.55, 0),
				Name = GenerateName("SubIcon"),
				Image = Properties.SubIcon,
				Size = UDim2.new(0.31, 0, 0.31, 0),
				BorderColor3 = Color3.fromRGB(27, 42, 53),
				ZIndex = 2,

				New "UICorner" {
					CornerRadius = UDim.new(5, 0),
				},

				New "UIStroke" {
					Thickness = 1,
					Color = Color3.fromRGB(15, 16, 21),
				},
			}
		or nil

	local IconButton = New "ImageButton" {
		BorderSizePixel = 0,
		ScaleType = Enum.ScaleType.Fit,
		Position = Properties.Position,
		BackgroundColor3 = Color3.fromRGB(40, 40, 52),
		Name = GenerateName("IconButton"),
		Image = "rbxassetid://0",
		Size = UDim2.new(0.15, 0, 0.15, 0),
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		BackgroundTransparency = 0.5,

		New "UICorner" {
			CornerRadius = UDim.new(5, 0),
		},

		SubIcon ~= nil and SubIcon,

		New "UIStroke" {
			Color = Color3.fromRGB(40, 40, 52),
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		},

		New "ImageLabel" {
			ImageColor3 = (SubIcon ~= nil and Color3.fromRGB(189, 189, 189) or Color3.new(1, 1, 1)),
			BorderSizePixel = 0,
			ScaleType = Enum.ScaleType.Fit,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			Position = UDim2.fromScale(0.5, 0.5),
			Name = "Icon",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = Properties.Icon,
			Size = UDim2.new(0.5, 0, 0.5, 0),
			BorderColor3 = Color3.fromRGB(27, 42, 53),
			BackgroundTransparency = 1,
		},

		New "UIAspectRatioConstraint" {},

		Event("Activated", Properties.OnClick),
	}

	return {
		Destroy = function()
			Cleanup({ IconButton, SubIcon ~= nil and SubIcon })
		end,

		Instance = IconButton,
	}
end
