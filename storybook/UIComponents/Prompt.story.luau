local UIComponents = require(script.Parent.Parent.Parent.src)

local Prompt = UIComponents.Prompt
local Button = UIComponents.Button

local Controls = {
    HeaderLabel = "Header label",
	PromptTitle = "Prompt title",
	BodyText = "Prompt body",
	SmallIcon = "rbxassetid://114352905669431",
	BigIcon = "rbxassetid://106536814145763",
	HasHeaderCloseButton = false,
}

local function Render(Props)
	local RenderedPrompt
	local Buttons = {
		Button({
			Icon = "rbxassetid://138303173193406",
			Tooltip = "Power off button",
			OnClick = function()
				RenderedPrompt.Close()
			end,
			Position = UDim2.new(0.096, 0, 0.851, 0),
			Size = UDim2.new(0.396, 0, 0.115, 0),
		}),

		Button({
			Icon = "rbxassetid://138303173193406",
			Tooltip = "Power off button",
			OnClick = function()
				RenderedPrompt.Close()
			end,
			Position = UDim2.new(0.511, 0, 0.851, 0),
			Size = UDim2.new(0.396, 0, 0.115, 0),
		}),
	}

	Props.controls.Buttons = table.clone(Buttons)

	RenderedPrompt = Prompt(Props.controls)

	Props.subscribe(function(Values, Infos)
		RenderedPrompt.Destroy()
		local Buttons = {
			Button({
				Icon = "rbxassetid://138303173193406",
				Tooltip = "Power off button",
				OnClick = function()
					RenderedPrompt.Close()
				end,
				Position = UDim2.new(0.096, 0, 0.851, 0),
				Size = UDim2.new(0.396, 0, 0.115, 0),
			}),

			Button({
				Icon = "rbxassetid://138303173193406",
				Tooltip = "Power off button",
				OnClick = function()
					RenderedPrompt.Close()
				end,
				Position = UDim2.new(0.511, 0, 0.851, 0),
				Size = UDim2.new(0.396, 0, 0.115, 0),
			}),
		}

		Values.Buttons = Buttons

		RenderedPrompt = Prompt(Values)
		RenderedPrompt.Instance.Parent = Props.target

		-- UI Labs hack...
		RenderedPrompt.Instance.Size = UDim2.fromScale(0.61, 0.5)
		RenderedPrompt.Instance.GroupTransparency = 0
	end)

	RenderedPrompt.Instance.Parent = Props.target

	-- UI Labs hack...
	RenderedPrompt.Instance.Size = UDim2.fromScale(0.61, 0.5)
	RenderedPrompt.Instance.GroupTransparency = 0

	return function()
		RenderedPrompt.Destroy()
	end
end

return {
	render = Render,
	controls = Controls,
}
