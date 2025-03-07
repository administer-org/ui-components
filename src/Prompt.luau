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

local Canvas = require(MainParent.Canvas)
local Frame = require(MainParent.Frame)
local Button = require(MainParent.Button)

return function(Properties: Types.PrompProperties): Types.Prompt
	local PromptSizeState = State(UDim2.fromScale(0.53, 0.42))
	local PromptSizeSpring = Spring(PromptSizeState, 0.5, 5)

	local PromptTransparencyState = State(1)
	local PromptTransparencySpring = Spring(PromptTransparencyState, 0.5, 5)

	local function Close()
		PromptSizeState:Set(UDim2.fromScale(0.53, 0.42))
		PromptTransparencyState:Set(1)
	end

	local Prompt = Canvas({
		Name = GenerateName("MessageBox"),
		BackgroundColor = Color3.fromRGB(0, 6, 8),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = PromptSizeSpring,
		GroupTransparency = PromptTransparencySpring,

		Rounding = UDim.new(0, 15),
	})

	local HeaderFrame = Frame({
		BackgroundColor = Color3.fromRGB(11, 12, 17),
		Size = UDim2.fromScale(1, 0.1),
		Position = UDim2.fromScale(0, 0),
	})
	HeaderFrame.Parent = Prompt

	New("TextLabel")({
		Parent = HeaderFrame,
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
		Text = Properties.HeaderLabel,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left,

		New("UITextSizeConstraint")({
			MaxTextSize = 20,
		}),
	})

	New("TextLabel")({
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
		Parent = Prompt,

		New("UITextSizeConstraint")({
			MaxTextSize = 15,
		}),
	})

	New("ImageLabel")({
		BorderSizePixel = 0,
		ScaleType = Enum.ScaleType.Fit,
		BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		Position = UDim2.fromScale(0.53, 0.28),
		Name = "Logo",
		Image = Properties.SmallIcon,
		Size = UDim2.fromScale(0.057, 0.09),
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		ZIndex = 7,
		BackgroundTransparency = 1,
		SliceScale = 2,
		Parent = Prompt,

		New("UIAspectRatioConstraint")({}),
	})

	local AppLogo = Frame({
		BackgroundColor = Color3.fromRGB(20, 20, 20),
		Name = "AppLogo",
		Position = UDim2.fromScale(0.45, 0.19),
		Size = UDim2.fromScale(0.13, 0.17),
		Rounding = UDim.new(0, 20),
	})
	AppLogo.ZIndex = 6
	AppLogo.Parent = Prompt

	New("ImageLabel")({
		BorderSizePixel = 0,
		ScaleType = Enum.ScaleType.Fit,
		BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		Position = UDim2.fromScale(0.05, 0.15),
		Name = "LogoImage",
		Image = Properties.BigIcon,
		Size = UDim2.fromScale(0.88, 0.70),
		BorderColor3 = Color3.fromRGB(27, 42, 53),
		ZIndex = 7,
		BackgroundTransparency = 1,
		SliceScale = 2,
        Parent = AppLogo,
	})

	New("UIAspectRatioConstraint")({
        Parent = AppLogo,
    })

	New("TextLabel")({
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
		Text = Properties.PromptTitle,
		BackgroundTransparency = 1,
		Parent = Prompt,

		New("UITextSizeConstraint")({
			MaxTextSize = 20,
		}),
	})

	New("UIAspectRatioConstraint")({
		AspectRatio = 1.35,
		Parent = Prompt,
	})

	-- local CloseButton
	-- if Properties.HasHeaderCoseButton then
	--     CloseButton = Button({})
	-- end

	for _, Button in Properties.Buttons do
		Button.Instance.Parent = Prompt
	end

	return {
		Close = Close,

		Open = function()
			PromptSizeState:Set(UDim2.fromScale(0.61, 0.5))
			PromptTransparencyState:Set(0)
		end,

		Destroy = function()
			for _, Button in Properties.Buttons do
				Button.Destroy()
			end

			Cleanup({ PromptSizeState, PromptSizeSpring, PromptTransparencyState, PromptTransparencySpring, Prompt })
		end,

		Instance = Prompt,
	}
end
