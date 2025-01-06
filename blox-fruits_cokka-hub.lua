repeat task.wait() until game:IsLoaded()
local TablePlace = {7449423635,2753915549,4442272183}
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Read", -- Required
	Text = "Let's wait for Next Update, is coming... @^-^@", -- Required
	Icon = "rbxassetid://9709149431", -- Optional
	Duration = 10
})
if table.find(TablePlace,game.PlaceId) then
    getgenv().Game = "BF"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xielbers/scripts/refs/heads/main/copy/blox-fruits_cokka-hub.lua"))()
else
    game.Players.LocalPlayer:Kick("Tu ejecutador no soporta Cokka Hub")
end
