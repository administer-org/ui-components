local Types = require(script.Types)

export type ButtonProperties = Types.ButtonProperties
export type PromptProperties = Types.PrompProperties
export type CanvasProperties = Types.CanvasProperties

return table.freeze({
    Button = require(script.Button),
    Prompt = require(script.Prompt),
    Canvas = require(script.Canvas)
})
