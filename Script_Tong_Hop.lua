loadstring(game:HttpGet(("https://raw.githubusercontent.com/daucobonhi/Ui-Redz-V2/refs/heads/main/UiREDzV2.lua")))()

       local Window = MakeWindow({
         Hub = {
         Title = "Văn Nguyên Hub",
         Animation = "TikTok: Văn Nguyên"
         Animation = "Youtube: Văn Nguyên"
         Animation = "Facebook: Văn Nguyên"
         },
        Key = {
        KeySystem = true,
        Title = "Nhập Keys",
        Description = "hãy nhập keys vào để mở Menu nhé",
        KeyLink = "https://discord.gg/nX3dEDXQ",
        Keys = {"Premium-Van-Nguyen-J64-K97"},
        Notifi = {
        Notifications = true,
        CorrectKey = "Nhập Key Đúng 🟢",
       Incorrectkey = "Nhập Key Không Đúng 🟡",
       CopyKeyLink = "https://discord.gg/nX3dEDXQ"
      }
    }
  })

       MinimizeButton({
       Image = "http://www.roblox.com/asset/?id=91347148253026",
       Size = {100, 100},
       Color = Color3.fromRGB(20, 20, 20),
       Corner = true,
       Stroke = false,
       StrokeColor = Color3.fromRGB(255, 0, 0)
      })
      
------ Tab
     local Tab1o = MakeTab({Name = "Script Farm"})
     local Tab2o = MakeTab({Name = "Server Hop"})
     local Tab3o = MakeTab({Name = "Hop Server Blox Fruit""})
     local Tab4o = MakeTab({Name = "Kill Aura"})
     local Tab5o = MakeTab({Name = "Script Blox Fruit"})
     local Tab6o = MakeTab({Name = "Script Dead Rails"})
     local Tab7o = MakeTab({Name = "Script 99 Night In The Forest"})
     local Tab8o = MakeTab({Name = "Script Blade Ball"})
     local Tab9o = MakeTab({Name = "Script Steal A Brainrot"})
     local Tab10o = MakeTab({Name = "Script Grow A Garden"})
     
------- BUTTON
    
    AddButton(Tab1o, {
     Name = "Redz Hub",
    Callback = function()
	  local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))(Settings)
  end
  })

AddButton(Tab4o, {
     Name = "Kill Aura All",
    Callback = function()local ToggleKillAura = Tabs.Sea:AddToggle("ToggleKillAura", {Title="Auto Kill",Description="", Default=false })
ToggleKillAura:OnChanged(function(Value)
    KillAura=Value
end)
Options.ToggleKillAura:SetValue(false)
spawn(function()
    while wait() do
        if KillAura then
            pcall(function()
                for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
                        repeat task.wait()
                            sethiddenproperty(game:GetService('Players').LocalPlayer,"SimulationRadius",math.huge)
                            v.Humanoid.Health=0
                            v.HumanoidRootPart.CanCollide=false
                        until not KillAura or not v.Parent or v.Humanoid.Health<=0
                    end
                end
            end)
        end
    end
end)
  end
  })