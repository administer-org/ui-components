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

export type IconButtonProperties = {
    Icon: string,
    SubIcon: string?,
    Position: UDim2,
    Size: UDim2?,
    OnClick: () -> (),
}

export type IconButton = {
    Instance: ImageButton,
    Destroy: () -> (),
}

export type CanvasProperties = {
    -- Special Properties
    Rounding: UDim | typeof(UI.Spring(...)) | nil,
    Stroke: {
        Color: Color3,
        Thickness: number | typeof(UI.Spring(...)),
    }?,

    -- Basic Properties
    Name: string?,
    BackgroundColor: Color3,
    Size: UDim2 | typeof(UI.Spring(...)),
    Position: UDim2 | typeof(UI.Spring(...)),
    BorderSizePixel: number?,
    AnchorPoint: Vector2?,
    GroupTransparency: number | typeof(UI.Spring(...)) | nil,
}

export type Canvas = CanvasGroup

export type PrompProperties = {
    HeaderLabel: string,
    PromptTitle: string,
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
