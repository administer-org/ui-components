local Index = 0

local HttpService = game:GetService("HttpService")

return function(Prefix: string): (string)
    Index += 1

    return `{Prefix}_{string.gsub(string.sub(HttpService:GenerateGUID(false), 0, 14), "-","")}_{Index}`
end
