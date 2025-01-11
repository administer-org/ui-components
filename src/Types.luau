local MainParent = script.Parent
local Packages = MainParent.Parent.roblox_packages
local UI = require(Packages.ui)

export type ButtonProperties = {
    Icon: string,
    SubIcon: string?,
    Tooltip: string,
    Position: UDim2,
    Size: UDim2?,
    OnClick: () -> (),
}

export type Button = {
    Instance: ImageButton,
    Destroy: () -> (),
}

export type CanvasProperties = {
    -- Special Properties
    Rounding: UDim2 | UI.Spring | nil,
    Stroke: {
        Color: Color3,
        Thickness: number | UI.Spring,
    }?,

    -- Basic Properties
    BackgroundColor: Color3,
    Size: UDim2 | UI.Spring,
    Position: UDim2 | UI.Spring,
    BorderSizePixel: number?,
    AnchorPoint: Vector2?,
    GroupTransparency: number | UI.Spring | nil,
}

export type Canvas = CanvasGroup

export type PrompProperties = {
    HeaderLabel: string,
    BodyText: string,

    BigIcon: string?,
    SmallIcon: string,

    HasHeaderCoseButton: boolean,
    Buttons: {Button},
}

export type Prompt = {
    Instance: CanvasGroup,
    Open: () -> (),
    Close: () -> (),
    Destroy: () -> (),
}

return {}
