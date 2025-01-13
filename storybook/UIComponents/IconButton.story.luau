local UIComponents = require(script.Parent.Parent.Parent.src)

local IconButton = UIComponents.IconButton

local Controls = {
    Icon = "rbxassetid://138303173193406",
}

local function Render(Props) 
    Props.controls.Position = UDim2.fromScale(0.3, 0.3)
    Props.controls.Size = UDim2.fromOffset(120, 40)
    Props.controls.OnClick = function() print("Clicked") end

    local RenderedButton = IconButton(Props.controls)

    Props.subscribe(function(Values, Infos)
        RenderedButton.Destroy()

        RenderedButton = IconButton(Values)
        RenderedButton.Instance.Parent = Props.target
    end)

    RenderedButton.Instance.Parent = Props.target

    return function()
        RenderedButton.Destroy()
    end
end

return {
    render = Render,
    controls = Controls,
}
