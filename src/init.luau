local Packages = script.Parent.roblox_packages

local Types = require(script.Types)

export type ButtonProperties = Types.ButtonProperties
export type PromptProperties = Types.PrompProperties

--TODO (FloofyPlasma): Should we export the return types?

return table.freeze({
    Button = require(script.Button),
    Prompt = require(script.Prompt),
})
