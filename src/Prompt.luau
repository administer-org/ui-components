local MainParent = script.Parent
local Packages = MainParent.Parent.roblox_packages
local Types = require(MainParent.Types)
local UI = require(Packages.ui)
local New = UI.New
local Spring = UI.Spring
local State = UI.State
local Event = UI.Event
local Cleanup = UI.Cleanup

return function(Properties: Types.PrompProperties): (Types.Prompt)
    local PromptSizeState = State(UDim2.fromScale(0.53, 0.42))
    local PromptSizeSpring = Spring(PromptSizeState, 0.5, 5)

    local PromptTransparencyState = State(1)
    local PromptTransparencySpring = Spring(PromptTransparencyState, 0.5, 5)

    local Prompt = New "CanvasGroup" {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(5, 6, 8),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size= PromptSizeSpring,
        GroupTransparency = PromptTransparencySpring,
        Name = "MessageBox",
        Position = UDim2.fromScale(0.5, 0.5),
        BorderColor3 = Color3.fromRGB(0, 0, 0),

        New "UICorner" {
            CornerRadius = UDim.new(0, 30),
        },

        New "Frame" {
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(11, 12, 17),
            Size = UDim2.fromScale(1, 0.1),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 0),

            New "TextLabel" {
				TextWrapped = true,
				BorderSizePixel = 0,
				RichText = true,
				TextScaled = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				FontFace = Font.new("rbxassetid://12187365977", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
				TextStrokeColor3 = Color3.fromRGB(35, 35, 35),
				Position = UDim2.fromScale(0.03, 0),
				Name = "HeaderLabel",
				TextSize = 24,
				Size = UDim2.fromScale(0.92, 1),
				ZIndex = 5,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				BorderColor3 = Color3.fromRGB(27, 42, 53),
				Text = "App",
				BackgroundTransparency = 1,
				TextXAlignment = Enum.TextXAlignment.Left,

				New "UITextSizeConstraint" {
					MaxTextSize = 20,
				},
            },
        },

        New "TextLabel" {
			TextWrapped = true,
			BorderSizePixel = 0,
			RichText = true,
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			FontFace = Font.new("rbxassetid://12187365977", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
			TextStrokeColor3 = Color3.fromRGB(35, 35, 35),
			Position = UDim2.fromScale(0.06, 0.51),
			Name = "Content",
			TextSize = 24,
			Size = UDim2.fromScale(0.87, 0.33),
			ZIndex = 5,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(27, 42, 53),
			Text = Properties.BodyText,
			BackgroundTransparency = 1,

			New "UITextSizeConstraint" {
				MaxTextSize = 15,
			},
		},

        New "ImageLabel" {
            BorderSizePixel = 0,
			ScaleType = Enum.ScaleType.Fit,
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			Position = UDim2.fromScale(0.51, 0.29),
			Name = "Logo",
			Image = "rbxassetid://17402667535",
			Size = UDim2.fromScale(0.059, 0.12),
			BorderColor3 = Color3.fromRGB(27, 42, 53),
			ZIndex = 7,
			BackgroundTransparency = 1,
			SliceScale = 2,
        },

        New "Frame" {
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(20, 20, 20),
			Size = UDim2.fromScale(0.13, 0.17),
			BorderColor3 = Color3.fromRGB(27, 42, 53),
			Name = "AppLogo",
			Position = UDim2.fromScale(0.45, 0.19),
			ZIndex = 6,

			New "UICorner" {
				CornerRadius = UDim.new(0, 20),
			},

			New "ImageLabel" {
				BorderSizePixel = 0,
				ScaleType = Enum.ScaleType.Fit,
				BackgroundColor3 = Color3.fromRGB(20, 20, 20),
				Position = UDim2.fromScale(0.05, 0.15),
				Name = "LogoImage",
				Image = "rbxassetid://13531414092",
				Size = UDim2.fromScale(0.88, 0.70),
				BorderColor3 = Color3.fromRGB(27, 42, 53),
				ZIndex = 7,
				BackgroundTransparency = 1,
				SliceScale = 2,
			},
			
			New "UIAspectRatioConstraint" {}
		},

        New "TextLabel" {
			TextWrapped = true,
			BorderSizePixel = 0,
			RichText = true,
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			FontFace = Font.new("rbxassetid://12187365977", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
			TextStrokeColor3 = Color3.fromRGB(35, 35, 35),
			Position = UDim2.fromScale(0.06, 0.41),
			Name = "Header",
			TextSize = 24,
			Size = UDim2.fromScale(0.88, 0.11),
			ZIndex = 5,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(27, 42, 53),
			Text = Properties.HeaderLabel,
			BackgroundTransparency = 1,

			New "UITextSizeConstraint" {
				MaxTextSize = 20,
			},
		},

        New "UIAspectRatioConstraint" {
            AspectRatio = 1.35,
        },
    }

    for _, Button in Properties.Buttons do
        Button.Instance.Parent = Prompt
    end

    return {
        Close = function()
            PromptSizeState:Set(UDim2.fromScale(0.53, 0.42))
            PromptTransparencyState:Set(1)
        end,

        Open = function()
            PromptSizeState:Set(UDim2.fromScale(0.61, 0.5))
            PromptTransparencyState:Set(0)
        end,

        Destroy = function()
            for _, Button in Properties.Buttons do
                Button.Destroy()
            end

            Cleanup({PromptSizeState, PromptSizeSpring, PromptTransparencyState, PromptTransparencySpring, Prompt})
        end,

        Instance = Prompt,
    }
end
