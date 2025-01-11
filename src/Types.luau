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
