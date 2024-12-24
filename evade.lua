local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/9Strew/roblox/main/proc/jans"))()
local Esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/9Strew/roblox/main/proc/kiriotesp"))()
Esp.Enabled = false
Esp.Tracers = false
Esp.Boxes = false

-- Crear la ventana principal
local Window = Library:CreateWindow("Evade 💀", Vector2.new(500, 300), Enum.KeyCode.RightShift)

-- Variables de estado
local isMinimized = false
local skullButton = nil -- Botón para mostrar la calavera

-- Función para cerrar la ventana y detener el script
local function closeWindow()
    print("Cerrando ventana y deteniendo ejecución...")
    Window:Destroy() -- Elimina la ventana principal
    task.spawn(function()
        while true do end -- Detiene efectivamente la ejecución
    end)
end

-- Función para minimizar la ventana
local function minimizeWindow()
    if not isMinimized then
        isMinimized = true
        Window.Visible = false -- Oculta la ventana principal

        -- Crear botón de calavera
        skullButton = Library:CreateWindow("💀", Vector2.new(100, 50), nil)
        skullButton.Position = UDim2.new(0.5, -50, 0.5, -25) -- Centrar la calavera

        skullButton:AddButton("💀", function()
            Window.Visible = true -- Restaura la ventana principal
            skullButton:Destroy() -- Elimina el botón de la calavera
            skullButton = nil
            isMinimized = false
        end)
    end
end

-- Crear botones de cerrar y minimizar
Window:AddButton("❌", closeWindow) -- Botón para cerrar
Window:AddButton("➖", minimizeWindow) -- Botón para minimizar

-- Añadir contenido a la ventana principal
local Evade = Window:CreateTab("General")
local Gamee = Window:CreateTab("Game")
local Configs = Window:CreateTab("Settings")

local EvadeSector = Evade:CreateSector("Character", "left")
local Visuals = Evade:CreateSector("Visuals", "right")
local Credits = Evade:CreateSector("Credits", "left")
local Farms = Evade:CreateSector("Farms", "right")

local Gamesec = Gamee:CreateSector("Utils", "right")
local World = Gamee:CreateSector("World", "left")

getgenv().Settings = {
    moneyfarm = false,
    afkfarm = false,
    NoCameraShake = false,
    Downedplayeresp = false,
    AutoRespawn = false,
    Speed = 1450,
    Jump = 3,
    reviveTime = 3,
    DownedColor = Color3.fromRGB(255,0,0),
    PlayerColor = Color3.fromRGB(255,170,0),
}

-- Lógica asociada
local Players = game:GetService('Players')
local localplayer = Players.LocalPlayer
local WorkspacePlayers = game:GetService("Workspace").Game.Players

local WalkSpeed = EvadeSector:AddSlider("Speed", 1450, 1450, 12000, 100, function(Value)
    Settings.Speed = Value
end)

local JumpPower = EvadeSector:AddSlider("JumpPower", 3, 3, 20, 1, function(Value)
    Settings.Jump = Value
end)

World:AddButton('Full Bright', function()
   	Game.Lighting.Brightness = 4
	Game.Lighting.FogEnd = 100000
	Game.Lighting.GlobalShadows = false
    Game.Lighting.ClockTime = 12
end)

World:AddToggle('No Camera Shake', false, function(State)
    Settings.NoCameraShake = State
end)

Gamesec:AddToggle('Fast Revive', false, function(State)
    if State then
        workspace.Game.Settings:SetAttribute("ReviveTime", 2.2)
    else
        workspace.Game.Settings:SetAttribute("ReviveTime", Settings.reviveTime)
    end
end)

EvadeSector:AddToggle('Auto Respawn', false, function(State)
    Settings.AutoRespawn = State
end)

EvadeSector:AddButton('Respawn',function()
    game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
end)

Farms:AddToggle('Money Farm', false, function(State)
    Settings.moneyfarm = State
end)

Farms:AddToggle('Afk Farm', false, function(State)
    Settings.afkfarm = State
end)

Visuals:AddToggle('Enable Esp', false, function(State)
    Esp.Enabled = State
end)

Visuals:AddToggle('Downed Player Esp', false, function(State)
    Settings.Downedplayeresp = State
end)

Visuals:AddColorpicker("Player Color", Color3.fromRGB(255,170,0), function(Color)
    Settings.PlayerColor = Color
end)

Visuals:AddColorpicker("Downed Player Color", Color3.fromRGB(255,0,0), function(Color)
    Settings.DownedColor = Color
end)

Credits:AddLabel("Developed By Phantasm")
Configs:CreateConfigSystem()

-- Funcionalidades extras
local old
old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
    local Args = {...}
    local method = getnamecallmethod()
    if tostring(self) == 'Communicator' and method == "InvokeServer" and Args[1] == "update" then
        return Settings.Speed, Settings.Jump 
    end
    return old(self,...)
end))

task.spawn(function()
    while task.wait() do
        if Settings.AutoRespawn then
             if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
             end
        end

        if Settings.NoCameraShake then
            localplayer.PlayerScripts.CameraShake.Value = CFrame.new(0,0,0)
        end
        if Settings.moneyfarm then
            if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
                task.wait(3)
            end
        end
    end
end)
