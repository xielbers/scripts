local HttpService = game:GetService("HttpService")

local function validarUbicacion()
    local ok, respuesta = pcall(function()
        return game:HttpGet("https://ipapi.co/json/")
    end)

    if not ok then
        warn("[Seguridad] No se pudo verificar la ubicación.")
        return false
    end

    local ok2, datos = pcall(function()
        return HttpService:JSONDecode(respuesta)
    end)

    if not ok2 then
        warn("[Seguridad] Respuesta inválida.")
        return false
    end

    -- Verificar país
    if datos.country_code ~= "AR" then
        warn("[Seguridad] País no autorizado.")
        return false
    end

    -- Verificar provincia
    if datos.region ~= "Buenos Aires" then
        warn("[Seguridad] Provincia no autorizada.")
        return false
    end

    return true
end

if not validarUbicacion() then
    return
end

-- ===========================
-- TU SCRIPT COMIENZA AQUÍ
-- ===========================
