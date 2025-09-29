loadstring(game:HttpGet(("https://raw.githubusercontent.com/daucobonhi/Ui-Redz-V2/refs/heads/main/UiREDzV2.lua")))()

      
       local Window = MakeWindow({
         Hub = {
         Title = "Blox Fruit [ Beta ] Tổng Hợp Van Nguyen",
         Animation = "Youtube: Văn Nguyên"
         },
        Key = {
        KeySystem = true,
        Title = "Blox Fruit [ Beta ] Tổng Hợp Van Nguyen",
        Description = "Blox Fruit TongHop",
        KeyLink = "https://discord.gg/NpsxT5gm",
        Keys = {"vannguyen"},
        Notifi = {
        Notifications = true,
        CorrectKey = "Nhập Key Thành Công ✅",
       Incorrectkey = "Nhập Key Sai ❌",
       CopyKeyLink = "https://discord.gg/NpsxT5gm"
      }
    }
  })

       MinimizeButton({
       Image = "http://www.roblox.com/asset/?id=80196398184635",
       Size = {60, 60},
       Color = Color3.fromRGB(10, 10, 10),
       Corner = true,
       Stroke = false,
       StrokeColor = Color3.fromRGB(255, 0, 0)
      })
      
------ Tab
     Main=Window:AddTab({ Title="Tab Fram" }),
    
      ------ Farm Level
AddButton(TabFullMoon, {
local ToggleLevel = Tabs.Main:AddToggle("ToggleLevel", {
        Title="Auto Fram Level",
        Description="",
        Default=false })
    ToggleLevel:OnChanged(function(Value)
        _G.AutoLevel=Value
        if Value==false then
            wait()
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            wait()
        end
    end)
    Options.ToggleLevel:SetValue(false)
    spawn(function()
        while task.wait() do
        if _G.AutoLevel then
        pcall(function()
          CheckLevel()
          if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible==false then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
          Tween(CFrameQ)
          if (CFrameQ.Position-game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude<=5 then
          game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest",NameQuest,QuestLv)
          end
          elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible==true then
          for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
          if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health>0 then
          if v.Name==Ms then
          repeat wait(_G.Fast_Delay)
          AttackNoCoolDown()
          bringmob=true
          AutoHaki()
          EquipTool(SelectWeapon)
          Tween(v.HumanoidRootPart.CFrame*Pos)
          v.HumanoidRootPart.Size=Vector3.new(60, 60, 60)
          v.HumanoidRootPart.Transparency=1
          v.Humanoid.JumpPower=0
          v.Humanoid.WalkSpeed=0
          v.HumanoidRootPart.CanCollide=false
          FarmPos=v.HumanoidRootPart.CFrame
          MonFarm=v.Name
          until not _G.AutoLevel or not v.Parent or v.Humanoid.Health<=0 or not game:GetService("Workspace").Enemies:FindFirstChild(v.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible==false
          bringmob=false
        end   
          end
          end
          for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
          if string.find(v.Name,NameMon) then
          if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude>=10 then
            Tween(v.HumanoidRootPart.CFrame*Pos)
          end
          end
          end
          end
          end)
        end
        end
        end)        