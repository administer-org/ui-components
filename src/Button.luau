local MainParent = script.Parent
local Packages = MainParent.Parent.roblox_packages
local Types = require(MainParent.Types)
local UI = require(Packages.ui)
local New = UI.New
local Spring = UI.Spring
local State = UI.State
local Event = UI.Event
local Cleanup = UI.Cleanup

return function(Properties: Types.ButtonProperties): ({Instance: ImageButton, Destroy: () -> ()})
    local IconSizeState = State(UDim2.fromScale(0.22, 0.34))
    local IconSizeSpring = Spring(IconSizeState, 0.5, 5)

    local TextPositionState = State(UDim2.fromScale(0.44, 0))
    local TextPositionSpring = Spring(TextPositionState, 0.5, 5)

    local ButtonTransparencyState = State(0.5)
    local ButtonTransparencySpring = Spring(ButtonTransparencyState, 0.5, 5)

    local StrokeThicknessState = State(1)
    local StrokeThicknessSpring = Spring(StrokeThicknessState, 0.5, 5)

    local SubIcon = (Properties.SubIcon ~= nil) and New "ImageLabel" {
        ImageColor3 = Color3.fromRGB(171, 171, 171),
		BorderSizePixel = 0,
		ScaleType = Enum.ScaleType.Fit,
		BackgroundColor3 = Color3.fromRGB(15, 16, 21),
		Position = UDim2.new(0.20, 0, 0.55, 0),
		Name = "SubIcon",
		Image = Properties.SubIcon,
		Size = UDim2.new(0.13, 0, 0.46, 0),
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		Visible = true,
		ZIndex = 2,
		BackgroundTransparency = 0,

		New "UICorner" {
			CornerRadius = UDim.new(5, 0),
		},

		New "UIStroke" {
			Thickness = 2,
			Color =  Color3.fromRGB(15, 16, 21)
		}
    } or nil

    local Button = New "ImageButton" {
		BorderSizePixel = 0,
		ScaleType = Enum.ScaleType.Fit,
		Position = Properties.Position,
		BackgroundColor3 = Color3.fromRGB(40, 40, 52),
		Name = `Btn_{string.gsub(Properties.Icon, "rbxassetid://", "")}_{math.random(1,250)}`,
		Image = "rbxassetid://0",
		Size = (Properties.Size or UDim2.new(0.07, 0, 0.68, 0)),
		BackgroundTransparency = ButtonTransparencySpring,

		New "UICorner" {
			CornerRadius = UDim.new(5, 0),
		},
		
		SubIcon ~= nil and SubIcon,
		
		New "ImageLabel" {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BorderSizePixel = 0,
			ScaleType = Enum.ScaleType.Fit,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			Position = UDim2.new(0.209, 0, 0.482, 0),
			Name = "MainIcon",
			Image = Properties.Icon,
			Size = IconSizeSpring,
			BorderColor3 = Color3.fromRGB(27, 42, 53),
			BackgroundTransparency = 1,
		},
		
		New "TextLabel" {
			TextWrapped = true,
			BorderSizePixel = 0,
			RichText = true,
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			FontFace = Font.new("rbxassetid://12187365977", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
			TextStrokeColor3 = Color3.fromRGB(35, 35, 35),
			Position = TextPositionSpring,
			Name = "IconLabel",
			TextSize = 24,
			Size = UDim2.new(0.55, 0, 1, 0),
			ZIndex = 5,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(27, 42, 53),
			Text = Properties.Tooltip,
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,

			New "UITextSizeConstraint" {
				MaxTextSize = 15,
			},

		},
		
		New "UIStroke" {
			Color = Color3.fromRGB(40, 40, 52),
			Thickness = StrokeThicknessSpring,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		},
		
		Event("Activated", Properties.OnClick),
		
		Event("MouseButton1Down", function(...: any)
			IconSizeState:Set(UDim2.new(0.16, 0, 0.28, 0))
			TextPositionState:Set(UDim2.new(0.42, 0, 0, 0))
			ButtonTransparencyState:Set(0.4)
			StrokeThicknessState:Set(2)
		end),
		
		Event("MouseButton1Up", function(...: any) 
			IconSizeState:Set(UDim2.new(0.28, 0, 0.40, 0))
			TextPositionState:Set(UDim2.new(0.44, 0, 0, 0))
			ButtonTransparencyState:Set(0.5)
			StrokeThicknessState:Set(1)
		end),
		
		Event("MouseEnter", function(...: any) 
			IconSizeState:Set(UDim2.new(0.28, 0, 0.40, 0))
		end),
		
		Event("MouseLeave", function(...: any) 
			IconSizeState:Set(UDim2.new(0.22, 0, 0.34, 0))
		end)
    }

    return {
        Instance = Button,

        Destroy = function()
            Cleanup({IconSizeState, IconSizeSpring, TextPositionState, TextPositionSpring, ButtonTransparencyState, ButtonTransparencySpring, StrokeThicknessState, StrokeThicknessSpring, Button, SubIcon ~= nil and SubIcon})
        end
    }
end