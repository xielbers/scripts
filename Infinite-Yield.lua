local HttpService = game:GetService("HttpService")

-- Función para verificar la ubicación
local function verificarRegion()
    local success, result = pcall(function()
        -- Usamos la API de ipapi.co
        local response = HttpService:GetAsync("https://ipapi.co/json/")
        return HttpService:JSONDecode(response)
    end)

    if success and result then
        if result.country_name == "Argentina" then
            print("Acceso concedido: Usuario en Argentina.")
            return true
        else
            warn("Acceso denegado: Este script no está disponible en " .. tostring(result.country_name))
            return false
        end
    else
        warn("Error al verificar la región. Revisa si las peticiones HTTP están activas.")
        return false
    end
end

-- Ejecución condicional
if verificarRegion() then
  
    local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  
end

