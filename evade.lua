local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/9Strew/roblox/main/proc/jans"))()

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
        skullButton = Library:CreateButton(nil, "💀", function()
            Window.Visible = true -- Restaura la ventana principal
            skullButton:Destroy() -- Elimina el botón de la calavera
            skullButton = nil
            isMinimized = false
        end)
        skullButton.Position = UDim2.new(0.5, -50, 0.5, -25) -- Centrar la calavera
        skullButton.Size = UDim2.new(0, 100, 0, 50)
    end
end

-- Crear botones de cerrar y minimizar
Window:AddButton("❌", closeWindow) -- Botón para cerrar
Window:AddButton("➖", minimizeWindow) -- Botón para minimizar

-- Aquí comienza tu lógica personalizada...

local WorkspacePlayers = game:GetService("Workspace").Game.Players
local Players = game:GetService("Players")
local localplayer = Players.LocalPlayer

-- Mantén tu lógica principal intacta, como configuraciones, sliders, toggles y funciones personalizadas.
-- Ejemplo:

local Evade = Window:CreateTab("General")
local EvadeSector = Evade:CreateSector("Character", "left")

local WalkSpeed = EvadeSector:AddSlider("Speed", 1450, 1450, 12000, 100, function(Value)
    getgenv().Settings.Speed = Value
end)

print("Ventana lista con funcionalidad de cerrar y minimizar.")
