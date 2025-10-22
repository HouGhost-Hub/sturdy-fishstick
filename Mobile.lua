local MAPBF = game.GameId == 994732206
local days99 = game.GameId == 7326934954
repeat wait() until game:IsLoaded();
local CountString = 0
local MainPack
local LoadedBackUp
if MAPBF then
    task.spawn(function()
        repeat task.wait() until LoadedBackUp
        repeat task.wait() until StatusCheckIsBad
        wait()
        if _G.Script_Mode == "PVP"then 
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vannguyen740/GsiPeh/refs/heads/main/VANNGUYEN-T%E1%BA%A1o-Scripts.lua",true))()
        elseif getgenv().Script_Mode == "Kaitun_Script"then 
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vannguyen740/vannguyenkaitun/refs/heads/main/vannguyenkaitun.lua",true))()
        else 
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vannguyen740/special-journey/refs/heads/main/Mobile.lua",true))()
        end
    end)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xshiba/FIXING/main/ABC.lua"))()
    LoadedBackUp = true
    print("Loaded Backup Load")
    local ABC, CBA = pcall(function()
        if _G.Script_Mode == "PVP"then 
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vannguyen740/GsiPeh/refs/heads/main/VANNGUYEN-T%E1%BA%A1o-Scripts.lua",true))()
        elseif getgenv().Script_Mode == "Kaitun_Script"then 
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vannguyen740/vannguyenkaitun/refs/heads/main/vannguyenkaitun.lua",true))()
        else 
            loadstring(game:HttpGet("https://raw.githubusercontent.com/vannguyen740/special-journey/refs/heads/main/Mobile.lua",true))()
        end
    end)
    if not ABC then
        StatusCheckIsBad = true
    end
    print("Loaded Main Load")
elseif MAPBF then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vannguyen740/special-journey/refs/heads/main/Mobile.lua",true))()
elseif days99 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vannguyen740/sturdy-fishstick/refs/heads/main/99NightsInTheForest.lua",true))()
else game.Players.LocalPlayer:Kick("\224\185\132\224\184\161\224\185\136\224\184\158\224\184\154\224\185\129\224\184\161\224\184\158")
    wait(3)
    game:Shutdown()
    wait(3)
    if game then
        while true do end
    end
end