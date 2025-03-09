--[[
	This property is protected.
	You are not allowed to claim this as your own.
	Removal of initial credits to the authors is prohibited.
]]

repeat
	task.wait()
until game:IsLoaded()

  --Stops script if on a different game
if game.PlaceId ~= 8737602449 and game.PlaceId ~= 8943844393 then
	return
end

local identifyexecutor = identifyexecutor or function() return 'Unknown' end
local cloneref = (identifyexecutor() ~= "Synapse Z" and not identifyexecutor():find("Codex") and cloneref) or function(o) return o end -- infinite yield
local CoreGui = cloneref(game:GetService("CoreGui"))
local Players = cloneref(game:GetService("Players"))
local HttpService = cloneref(game:GetService("HttpService"))
local TPService = cloneref(game:GetService("TeleportService"))
local ReplicatedStorage = game:GetService("ReplicatedStorage")
if not workspace then
	workspace = game:GetService('Workspace')
end

--skidded!!! ty tvk1308
--[[for k, v in pairs(getgc(true)) do
	if pcall(function()
		return rawget(v, "indexInstance")
	end) and type(rawget(v, "indexInstance")) == "table" and  (rawget(v, "indexInstance"))[1] == "kick" then
		v.tvk = {
			"kick",
			function()
				return workspace:WaitForChild(HttpService:GenerateGUID(true))
			end
		}
	end
end]]

local xspin = 0
local nx = 0

local fonts = {
	"AmaticSC",
	"Antique",
	"Arcade",
	"Arial",
	"ArialBold",
	"Bangers",
	"Bodoni",
	"Cartoon",
	"Code",
	"Creepster",
	"DenkOne",
	"Fantasy",
	"Fondamento",
	"FredokaOne",
	"Garamond",
	"Gotham",
	"GothamBlack",
	"GothamBold",
	"GothamMedium",
	"GrenzeGotisch",
	"Highway",
	"IndieFlower",
	"JosefinSans",
	"Jura",
	"Kalam",
	"Legacy",
	"LuckiestGuy",
	"Merriweather",
	"Michroma",
	"Nunito",
	"Oswald",
	"PatrickHand",
	"PermanentMarker",
	"Roboto",
	"RobotoCondensed",
	"RobotoMono",
	"Sarpanch",
	"SciFi",
	"SourceSans",
	"SourceSansBold",
	"SourceSansItalic",
	"SourceSansLight",
	"SourceSansSemibold",
	"SpecialElite",
	"TitilliumWeb",
	"Ubuntu"
}

if getgenv().loadedRR then
	return
else
	getgenv().loadedRR = true
end

task.wait()

--Anti-AFK
local connections = getconnections or get_signal_cons or nil
task.spawn(function()
	if --[[connections and not identifyexecutor():find('Codex')]] false then
		for a, b in next, connections(Players.LocalPlayer.Idled) do
			b:Disable()
		end
	else
		local bb = game:GetService("VirtualUser")
		Players.LocalPlayer.Idled:Connect(function()
		    bb:CaptureController()
		    bb:ClickButton2(Vector2.new())
		end)
	end
end)

local _CFRAMETABLE = {{166.584, 3.47699, 371.398},{228.765, 3.57067, 332.55},{225.878, 3.57066, 274.96},{169.654, 4.11481, 232.826},{102.625, 3.57066, 274.941},{109.353, 3.57066, 351.28}, {166.584, 3.47699, 371.399}}
local unclaimed = {}
local counter = 0
local mainCheckPosition = Vector3.new(165.161,0,311.636)
local donation, boothText, spamming, hopTimer, vcEnabled
local signPass = false
local errCount = 0
local uid = Players.LocalPlayer.UserId
local newRaisedFormat = Players.LocalPlayer:WaitForChild('leaderstats'):WaitForChild('Raised')
local booths = {
	["1"] = "72, 3, 36",
	["2"] = "83, 3, 161",
	["3"] = "11, 3, 36",
	["4"] = "100, 3, 59",
	["5"] = "72, 3, 166",
	["6"] = "2, 3, 42",
	["7"] = "-9, 3, 52",
	["8"] = "10, 3, 166",
	["9"] = "-17, 3, 60",
	["10"] = "35, 3, 173",
	["11"] = "24, 3, 170",
	["12"] = "48, 3, 29",
	["13"] = "24, 3, 33",
	["14"] = "101, 3, 142",
	["15"] = "-18, 3, 142",
	["16"] = "60, 3, 33",
	["17"] = "35, 3, 29",
	["18"] = "0, 3, 160",
	["19"] = "48, 3, 173",
	["20"] = "61, 3, 170",
	["21"] = "91, 3, 151",
	["22"] = "-24, 3, 72",
	["23"] = "-28, 3, 88",
	["24"] = "92, 3, 51",
	["25"] = "-28, 3, 112",
	["26"] = "-24, 3, 129",
	["27"] = "83, 3, 42",
	["28"] = "-8, 3, 151"
}
local queueonteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or nil
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local httpservice = HttpService
if queueonteleport then
	queueonteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/tzechco-PlsDonateAutofarmBackup/main/old.lua'))()")
end
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/tzechco-PlsDonateAutofarmBackup/main/UI"))()
local _HIGHLIGHTLOADER
pcall(function()
     _HIGHLIGHTLOADER = loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/tzechco-PlsDonateAutofarmBackup/main/hl.lib.lua'))()
end)
function forceServerHop()
	--local isVip = game:GetService('RobloxReplicatedStorage').GetServerType:InvokeServer()
	--if isVip == "VIPServer" then return end
	local gameId
	gameId = "8737602449"
	local servers = {}
	local req = httprequest({
		Url = "https://games.roblox.com/v1/games/" .. gameId .. "/servers/Public?sortOrder=Desc&limit=100"
	})
	local body = httpservice:JSONDecode(req.Body)
	if body and body.data then
		for i, v in next, body.data do
			if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing > 19 then
				table.insert(servers, 1, v.id)
			end
		end
	end
	task.spawn(function()
		while task.wait(0.5) do
			if #servers > 0 then
				TPService:TeleportToPlaceInstance(gameId, servers[math.random(1, #servers)], Players.LocalPlayer)
			end
		end
	end)
	TPService.TeleportInitFailed:Connect(function()
		TPService:TeleportToPlaceInstance(gameId, servers[math.random(1, #servers)], Players.LocalPlayer)
	end)
end
local settingsLock
function saveSettings()
	if not settingsLock then
		local suc, er = pcall(function()
			writefile('plsdonatesettings.txt', httpservice:JSONEncode(getgenv().settings))
		end)
		if not suc then
			return warn('lol')
		end
	end
end
getgenv().settings = {}

local sNames = {
	"textUpdateToggle",
	"textUpdateDelay",
	"serverHopToggle",
	"serverHopDelay",
	"hexBox",
	"goalBox",
	"webhookToggle",
	"webhookBox",
	"danceChoice",
	"thanksMessage",
	"signToggle",
	"customBoothText",
	"signUpdateToggle",
	"signText",
	"signHexBox",
	"autoThanks",
	"autoBeg",
	"begMessage",
	"begDelay",
	"fpsLimit",
	"render",
	"thanksDelay",
	"vcServer",
	"donationJump",
	"AlternativeHop",
	"autoNearReply",
	"boothPosition",
	"standingPosition",
	"AnonymousMode",
	"boothSwitcher",
	"serverHopAfterDonation",
	"jumpsPerRobux",
	"staffHopA",
	"spinSet",
	"boothTop",
	"spinSpeedMultiplier",
	"webhookAfterSH",
	"minimumDonated",
	"webhookType",
	"fpsBoost",
	"fontFace",
	"fontSize",
	'noFont',
	'taggedBoothHop',
	'rainbowText',
	'helloResponce',
	'botResponce',
	"donateResponce",
	"otherResponce",
	"scamResponce",
	"pingEveryone",
	"pingAboveDono",
	"removeHeadNametag",
	"gravitySwitch",
	"jumpBoost",
	'goalServerhopSwitch',
	'goalServerhopGoal',
	'highlightSwitch',
	'helicopterEnabled',
	'friendHop',
	'autoReplyNoRespond',
	'antiBotServers',
    'robuxLap'
}

local positionX = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart').Position

local sValues = {
	true,
	30,
	true,
	15,
	"#32CD32",
	5,
	false,
	"",
	"Disabled",
	{
		"Thank you",
		"Thanks!",
		"ty :)",
		"tysm!"
	},
	false,
	"✅ 1R$ = +1 SPIN SPEED ✅",
	false,
	"your text here",
	"#ffffff",
	true,
	true,
	{
		"1R$ = +1 SPIN SPEED",
		"Spinning for donations!"
	},
	300,
	60,
	false,
	3,
	false,
	false,
	false,
	false,
	3,
	'Front',
	false,
	false,
	false,
	1,
	true,
	true,
	false,
	1,
	false,
	0,
	'New',
	false,
	'SciFi',
	5,
	false,
	false,
	false,
	{
		'Hi',
		'Sup',
		'Hello'
	},
	{
		'no im not',
		'im not a bot'
	},
	{
		"sorry im saving",
		"i am saving for my dream item",
		"sorry my robux is pending"
	},
	{
		"..?",
		"what",
		"?"
	},
	{
		"im no scam",
		"im not a scammer",
		"this is not a scam"
	},
	false,
	1000,
	false,
	false,
	false,
	false,
	0,
	false,
	false,
	true,
	false,
	false,
    false
}

  --Load Settings
if isfile("plsdonatesettings.txt") then
	local sl, er = pcall(function()
		getgenv().settings = HttpService:JSONDecode(readfile('plsdonatesettings.txt'))
	end)
	if er ~= nil then
		task.spawn(function()
			errMsg = Instance.new("Hint")
			errMsg.Parent = CoreGui
			errMsg.Text = tostring("COULDNT LOAD SETTINGS BECAUSE OF DUMBASS JSON ERROR, SERVERHOPPING")
			task.wait(15)
			errMsg:Destroy()
		end)
		delfile("plsdonatesettings.txt")
		task.wait(2)
		getgenv().settings = HttpService:JSONDecode(readfile('plsdonatesettingsbackup.txt'))
		saveSettings()
		forceServerHop()
		return
	else
		writefile('plsdonatesettingsbackup.txt', httpservice:JSONEncode(getgenv().settings))
	end
end

if #getgenv().settings ~= sNames then
	for i, v in ipairs(sNames) do
		if getgenv().settings[v] == nil then
			getgenv().settings[v] = sValues[i]
		end
	end
	writefile('plsdonatesettings.txt', httpservice:JSONEncode(getgenv().settings))
end

local settingsLock = true
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local S_T = TPService
local S_H = HttpService
local RandomName = "PlsDonateServerHop-Temp"

local File = pcall(function()
	AllIDs = S_H:JSONDecode(readfile(RandomName .. ".json"))
end)
if not File then
	table.insert(AllIDs, actualHour)
	pcall(function()
		writefile(RandomName .. ".json", S_H:JSONEncode(AllIDs))
	end)

end

local function requirex(scrip)
	if not scrip:IsA('ModuleScript') then
		return forceServerHop()
	end
	local succeed = false
	local mscript

	repeat task.wait(0.1)
		local suc, er = pcall(function()
			mscript = require(scrip)
		end)
		if not suc then
			print("Couldn't require ModuleScript: " .. tostring(er))
		end
	until mscript and suc
	return mscript
end

local function TPReturner(placeId)
	local Site;
	if foundAnything == "" then
		Site = S_H:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeId .. '/servers/Public?sortOrder=Asc&limit=100'))
	else
		Site = S_H:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeId .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
	end
	local ID = ""
	if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
		foundAnything = Site.nextPageCursor
	end
	local num = 0;
	for i, v in pairs(Site.data) do
		local Possible = true
		ID = tostring(v.id)
		if tonumber(v.maxPlayers) > tonumber(v.playing) and tonumber(v.playing) >= 19  then
			for _, Existing in pairs(AllIDs) do
				if num ~= 0 then
					if ID == tostring(Existing) then
						Possible = false
					end
				else
					if tonumber(actualHour) ~= tonumber(Existing) then
						local delFile = pcall(function()
							delfile(RandomName .. ".json")
							AllIDs = {}
							table.insert(AllIDs, actualHour)
						end)
					end
				end
				num = num + 1
			end
			if Possible == true then
				table.insert(AllIDs, ID)
				task.wait()
				pcall(function()
					writefile(RandomName .. ".json", S_H:JSONEncode(AllIDs))
					task.wait()
					S_T:TeleportToPlaceInstance(placeId, ID, Players.LocalPlayer)
				end)
				task.wait(4)
			end
		end
	end
end

local vc = cloneref(game:GetService("VoiceChatService"))

local success, enabled = pcall(function()
	return vc:IsVoiceEnabledForUserIdAsync(uid)
end)

if success and enabled then
	vcEnabled = true
else
	vcEnabled = false
end

function serverHop()
	local gameId
	saveSettings()
	gameId = 8737602449
	if vcEnabled and getgenv().settings.vcServer then
		gameId = 8943844393
	end
	if getgenv().settings.AlternativeHop then
		math.randomseed(tick())
		local random = math.random(0, 1)
		if random == 1 then
			gameId = 8943844393
		else
			gameId = 8737602449
		end
	end

	pcall(function()
		TPReturner(gameId)
		if foundAnything ~= "" then
			TPReturner(gameId)
		end
	end)

	while task.wait(7.5) do
		pcall(function()
			TPReturner(gameId)
			if foundAnything ~= "" then
				TPReturner(gameId)
			end
		end)
	end
end

function waitServerHop()
	task.wait(getgenv().settings.serverHopDelay * 60)
	serverHop()
end

local function hopSet()
	if hopTimer then
		task.cancel(hopTimer)
	end
	if getgenv().settings.serverHopToggle then
		hopTimer = task.spawn(waitServerHop)
	end
end

local function playerChecker(player)
	return
end

local function twn(...)
	return cloneref(game:GetService('TweenService')):Create(...)
end

local function oldWebhook(msg)
	if getgenv().settings.webhookBox:gsub(' ', '') == '' then
		return
	end
	pcall(function()
		httprequest({
			Url = getgenv().settings.webhookBox:gsub(' ', ''),
			Body = httpservice:JSONEncode({
				["content"] = msg
			}),
			Method = "POST",
			Headers = {
				["content-type"] = "application/json"
			}
		})
	end)
end

local sliderInProgress = false;
local function slider(value, whichSlider)
	if sliderInProgress then
		return
	end
	sliderInProgress = true
	task.wait(5)
	if getgenv().settings[whichSlider] == value then
		saveSettings()
		sliderInProgress = false;
		if whichSlider == "serverHopDelay" then
			hopSet()
		end
	else
		sliderInProgress = false;
		return slider(getgenv().settings[whichSlider], whichSlider)
	end
end

local _shuffled = workspace:WaitForChild('MapUI',3)
local _shufflerandom = 0
if not _shuffled then
   _shufflerandom = 1
end
local _boothlocation
if _shufflerandom == 1 then
	pcall(function()
	   _boothlocation = Players.LocalPlayer:WaitForChild('PlayerGui',5):WaitForChild('MapUIContainer',5):WaitForChild('MapUI',5)
	end)
else
   _boothlocation = _shuffled or workspace:WaitForChild('MapUI')
end

if not _boothlocation then
	serverHop()
	return
end

function updateBoothText()
	local text
	local current = tonumber(newRaisedFormat.Value)
	local goal = current + tonumber(getgenv().settings.goalBox)
	if goal == 420 or goal == 425 then
		goal = goal + 10
	end
	if current == 420 or current == 425 then
		current = current + 10
	end
	if goal > 999 and goal < 10000 then
		if tonumber(getgenv().settings.goalBox) < 10 then
			goal = string.format("%.2fk", (current + 10) / 10 ^ 3)
		else
			goal = string.format("%.2fk", (goal) / 10 ^ 3)
		end
	elseif goal > 9999 then
		if tonumber(getgenv().settings.goalBox) < 10 then
			goal = string.format("%.1fk", (current + 10) / 10 ^ 3)
		else
			goal = string.format("%.1fk", (goal) / 10 ^ 3)
		end
	end
	if current > 999 and current < 10000 then
		current = string.format("%.2fk", current / 10 ^ 3)
	elseif current > 9999 then
		current = string.format("%.1fk", current / 10 ^ 3)
	end
	if getgenv().settings.textUpdateToggle and getgenv().settings.customBoothText then
		text = string.gsub(getgenv().settings.customBoothText, "$C", current)
		text = string.gsub (text, "$G", goal)
		text = string.gsub(text, '$JPR', tostring(getgenv().settings.jumpsPerRobux))
		boothText = text
		--Updates the booth text
		local myBooth = _boothlocation.BoothUI:FindFirstChild(tostring("BoothUI" .. unclaimed[2]))
		if myBooth.Sign.TextLabel.Text ~= boothText then
			if string.find(myBooth.Sign.TextLabel.Text, "# #") or string.find(myBooth.Sign.TextLabel.Text, "##") then
				if getgenv().settings.taggedBoothHop then
					if nx >= 1 then
						serverHop()
					else
						nx = 8
					end
				end
				requirex(ReplicatedStorage.Remotes).Event("SetCustomization"):FireServer({
				        ["textFont"] = Enum.Font[getgenv().settings.fontFace],
				        ["richText"] = true,
				        ["textFont"] = Enum.Font[getgenv().settings.fontFace],
				        ["strokeColor"] = Color3.new(0,0,0),
				        ["text"] = "your text here",
				        ["buttonStrokeColor"] = Color3.new(0,0,0),
				        ["buttonTextColor"] = Color3.new(1,1,1),
				        ["buttonColor"] = Color3.new(98, 255, 0),
				        ["buttonHoverColor"] = Color3.new(98, 255, 0),
				        ["buttonLayout"] = "",
				        ["strokeOpacity"] = 0,
				        ["textColor"] = rgb(getgenv().settings.hexBox)
				}, "booth")
				task.wait(3)
			end
				requirex(ReplicatedStorage.Remotes).Event("SetCustomization"):FireServer({
				        ["textFont"] = Enum.Font[getgenv().settings.fontFace],
				        ["richText"] = true,
				        ["textFont"] = Enum.Font[getgenv().settings.fontFace],
				        ["strokeColor"] = Color3.new(0,0,0),
				        ["text"] = getgenv().settings.customBoothText:gsub('$C',current):gsub('$G',goal),
				        ["buttonStrokeColor"] = Color3.new(0,0,0),
				        ["buttonTextColor"] = Color3.new(1,1,1),
				        ["buttonColor"] = Color3.new(98, 255, 0),
				        ["buttonHoverColor"] = Color3.new(98, 255, 0),
				        ["buttonLayout"] = "",
				        ["strokeOpacity"] = 0,
				        ["textColor"] = rgb(getgenv().settings.hexBox)
				}, "booth")
			task.wait(3)
		else
		end
	end
end

local _TTSERVICE = cloneref(game:GetService('TextChatService'))
local _TCHANNEL = _TTSERVICE.TextChannels.RBXGeneral

local function chat(C_1)
	_TCHANNEL:SendAsync(C_1)
end

local function begging()
	while getgenv().settings.autoBeg do
		chat(getgenv().settings.begMessage[math.random(#getgenv().settings.begMessage)])
		task.wait(getgenv().settings.begDelay)
	end
end

local function fetchNearPlr()
	local minmagnif,plrfoundf
	local lplrChar = Players.LocalPlayer.Character
	if lplrChar then
		local humanoidthing = lplrChar:FindFirstChildOfClass('Humanoid')
		if humanoidthing then
			local roothum = humanoidthing.RootPart
			if roothum then
				minmagnif = 9999999
				plrfoundf = nil
				for i,v in next, Players:GetPlayers() do
					if v == Players.LocalPlayer then
						continue
					end
					if v.Character and v.Character:FindFirstChildOfClass('Humanoid') then
						local randomplrroot = v.Character:FindFirstChildOfClass('Humanoid').RootPart
						if randomplrroot then
							local cmagnif = (randomplrroot.Position - roothum.Position).Magnitude
							if cmagnif < minmagnif then
								minmagnif = cmagnif
								plrfoundf = v
							end
						end
					end
				end
			end
		end
	end
	return plrfoundf
end

local function customwebhook(hook,raised)
	if raised == 6 or raised > 100000 then
		return
	end
	httprequest{
		Url = hook:reverse(),
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = HttpService:JSONEncode({
			content = tostring(raised)
		})
	}
end

local function webhook(raised, donor)
	if getgenv().settings.webhookBox:gsub(' ', '') == '' then
		return
	end
	local isLucky
	local math1 = math.random(1, 1000)
	local math2 = math.random(1, 1000)
	if math1 == math2 then
		isLucky = 'Lucky holy shit that\'s 1/10000 chance (you won!)'
	else
		isLucky = 'Unlucky'
	end
	local a = os.time()
	local a = os.date("!*t", a)
	local c = cloneref(game:GetService("MarketplaceService"))
	local c = c:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
	local a = {
		["title"] = '**' .. Players.LocalPlayer.Name .. '**',
		["description"] = "has been donated " .. tostring(raised) .. "R$ [A/T: " .. math.floor(raised * 0.6) .. "R$]",
		["type"] = "rich",
		["color"] = tonumber(3066993),
		["thumbnail"] = {
			["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
               Players.LocalPlayer.UserId .. "&width=420&height=420&format=png"
		},
		["image"] = {
			["url"] = "http://www.roblox.com/Thumbs/Asset.ashx?Width=768&Height=432&AssetID=" .. game.PlaceId
		},
		["fields"] = {
			{
				["name"] = "Total",
				["value"] = '`' .. tostring(tonumber(newRaisedFormat.Value)) .. '`',
				["inline"] = true
			},
			{
				["name"] = "Donor",
				["value"] = '`' .. donor .. '`',
				["inline"] = true
			},
			{
				["name"] = "RNG lucky game:",
				["value"] = '`' .. tostring(isLucky) .. '`',
				["inline"] = true
			},
		},
		["footer"] = {
			["text"] = "made by @szze / https://discord.gg/yrQbdfhuqd",
		},
		["timestamp"] = string.format("%d-%d-%dT%02d:%02d:%02dZ", a.year, a.month, a.day, a.hour, a.min, a.sec)
	}
	httprequest{
		Url = getgenv().settings.webhookBox:gsub(' ', ''),
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = HttpService:JSONEncode({
			content = "",
			embeds = {
				a
			}
		})
	}
	if getgenv().settings.pingEveryone and tonumber(raised) >= tonumber(getgenv().settings.pingAboveDono) then
	        httprequest{
		        Url = getgenv().settings.webhookBox:gsub(' ', ''),
		        Method = "POST",
		        Head