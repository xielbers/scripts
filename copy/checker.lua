local v0=game:GetService("HttpService");local function v1() local v2=0 -0 ;local v3;local v4;local v5;local v6;local v7;while true do if (v2==(3 -2)) then v5=nil;v6=nil;v2=1268 -(97 + 1169) ;end if (v2==(1067 -(68 + 997))) then v7=nil;while true do if (v3==(1272 -(226 + 1044))) then if (v7.country_code~="AR") then return false;end if (v7.region~="Buenos Aires") then return false;end v3=12 -9 ;end if (v3==(0 -0)) then local v8=0 + 0 ;while true do if (v8==(118 -(32 + 85))) then v3=1;break;end if (v8==(0 + 0)) then v4,v5=pcall(function() return game:HttpGet("https://ipapi.co/json/");end);if  not v4 then return false;end v8=953 -(802 + 150) ;end end end if (v3==(1 + 2)) then return true;end if (v3==(958 -(892 + 65))) then v6,v7=pcall(function() return v0:JSONDecode(v5);end);if  not v6 then return false;end v3=4 -2 ;end end break;end if (v2==0) then v3=0 -0 ;v4=nil;v2=2 -1 ;end end end return v1();
-- ⚠️ WARNING: integrity protected!
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--