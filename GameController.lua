local u1 = require(game.ReplicatedStorage.Packages.Knit)
local u2 = u1.CreateController({
    ["Name"] = "GameController"
})
local u3 = nil
local u4 = nil
local u5 = nil
local u6 = nil
local u7 = nil
local u8 = nil
local u9 = nil
local u10 = nil
local u11 = nil
local u12 = nil
local u13 = nil
local u14 = nil
local u15 = nil
local u16 = nil
local u17 = nil
local u18 = nil
local u19 = nil
local u20 = nil
local u21 = nil
local u22 = nil
local u23 = nil
local u24 = nil
local u25 = nil
local u26 = nil
local u27 = game:GetService("CollectionService")
local u28 = game:GetService("ReplicatedStorage")
game:GetService("UserInputService")
local u29 = game:GetService("ProximityPromptService")
local u30 = game:GetService("TweenService")
game:GetService("TextChatService")
local u31 = require(u28.Packages.FormatTime)
local v32 = require(u28.Packages.Janitor)
local u33 = TweenInfo.new(1, Enum.EasingStyle.Quint)
local v34 = require(u28.Packages.Signal)
local u35 = require(u28.Packages.Vetween)
require(u28.Packages.GameStats.Settings)
local u36 = require(u28.Packages.SkillUtils)
local u37 = require(u28.Packages.GameStats)
local u38 = nil
local u39 = ""
local u40 = nil
local u41 = v32.new()
Vector2.new()
local u42 = false
local u43 = workspace.CurrentCamera
local u44 = TweenInfo.new(4, Enum.EasingStyle.Linear)
local u45 = {
    ["Round_Players"] = true,
    ["Round_Top"] = true,
    ["EmoteButton"] = true,
    ["Monster_Buttons"] = true,
    ["Survivor_Buttons"] = true,
    ["TopFrame"] = true,
    ["MapFrame"] = true,
    ["ResultsFrame"] = true,
    ["RepairFrame"] = true,
    ["TopNotificationFrame"] = true
}
local u46 = { 0.9, 0.8, 0.7 }
local u47 = nil
local u48 = nil
local function u54(p49) --[[Anonymous function at line 81]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u33
        [3] = u47
        [4] = u48
    --]]
    for _, u50 in workspace.MapMusic:GetChildren() do
        if u50.IsPlaying and u50.Name ~= p49 then
            u50:SetAttribute("OriginalVolume", u50.Volume)
            local u51 = u30:Create(u50, u33, {
                ["Volume"] = 0
            })
            u51.Completed:Once(function() --[[Anonymous function at line 86]]
                --[[
                Upvalues:
                    [1] = u50
                    [2] = u51
                --]]
                u50:Stop()
                u51 = nil
            end)
            u51:Play()
        end
    end
    for _, v52 in workspace.MapMusic:GetChildren() do
        if v52.Name == p49 then
            local v53
            if v52.Volume == 0 then
                v53 = v52:GetAttribute("OriginalVolume") or 0.5
            else
                v53 = v52.Volume
            end
            v52.Volume = 0
            u30:Create(v52, u33, {
                ["Volume"] = v53
            }):Play()
            if u47 and u47.Settings.Music.Value then
                v52:Play()
            end
            u48 = v52
        end
    end
end
function u2.Update(_, p55) --[[Anonymous function at line 110]]
    --[[
    Upvalues:
        [1] = u47
        [2] = u54
        [3] = u48
        [4] = u23
    --]]
    if not u47 then
        u47 = p55
        u54("Lobby")
    end
    u47 = p55
    if u48 and not p55.Settings.Music.Value then
        if u48 then
            u48.Volume = 0
        end
    elseif u48 and (u48.Volume == 0 and p55.Settings.Music.Value) then
        u54(u48.Name)
    end
    u23:Update(p55)
end
function u2.KnitInit(_) --[[Anonymous function at line 130]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u1
        [3] = u4
        [4] = u5
        [5] = u6
        [6] = u7
        [7] = u8
        [8] = u9
        [9] = u11
        [10] = u10
        [11] = u12
        [12] = u38
        [13] = u13
        [14] = u15
        [15] = u14
        [16] = u16
        [17] = u17
        [18] = u18
        [19] = u19
        [20] = u20
        [21] = u21
        [22] = u23
        [23] = u24
        [24] = u25
        [25] = u22
        [26] = u26
    --]]
    u3 = u1.Player.PlayerGui:WaitForChild("MainGui")
    u4 = u1.Player.PlayerGui:WaitForChild("Intro")
    u5 = u1.GetController("UIController")
    u6 = u1.GetService("GameService")
    u7 = u1.GetController("DoorController")
    u8 = u1.GetController("LockerController")
    u9 = u1.GetController("MonsterController")
    u11 = u1.GetController("TaskController")
    u10 = u1.GetController("ResultsController")
    u12 = u1.GetController("LightingController")
    u38 = u1.GetController("AnimationController")
    u13 = u1.GetController("SoundController")
    CutsceneController = u1.GetController("CutsceneController")
    IntroUIController = u1.GetController("IntroUIController")
    u15 = u1.GetService("PlayerService")
    u14 = u1.GetController("CameraController")
    u16 = u1.GetController("LoadingController")
    u17 = u1.GetController("RoleGuideController")
    u18 = u1.GetController("PreGameController")
    u19 = u1.GetController("EndFrameController")
    u20 = u1.GetController("NotificationController")
    u21 = u1.GetService("SkillService")
    u23 = u1.GetController("MovementController")
    u24 = u1.GetController("BarricadeController")
    u25 = u1.GetController("ProximityController")
    u22 = u1.GetController("SkillController")
    u26 = u1.GetController("SkinController")
end
u2.StateChanged = v34.new()
local u56 = 0
local u57 = require(game.ReplicatedStorage.Packages.CameraShaker)
local u67 = u57.new(Enum.RenderPriority.Camera.Value, function(p58) --[[Anonymous function at line 166]]
    --[[
    Upvalues:
        [1] = u56
    --]]
    if u56 ~= 0 then
        local v59 = p58.Position
        local v60, v61, v62 = p58.Rotation:ToOrientation()
        local v63 = Vector3.new(v60, v61, v62)
        local v64 = v59 * u56
        local v65 = v63 * u56
        local v66 = CFrame.new(v64) * CFrame.Angles(v65.X, v65.Y, v65.Z)
        workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * v66
    end
end)
local function u70() --[[Anonymous function at line 189]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u45
    --]]
    for _, v68 in u1.Player.PlayerGui.MainGui:GetChildren() do
        if not u45[v68.Name] and (v68:IsA("Frame") or (v68:IsA("TextButton") or v68:IsA("ImageLabel"))) then
            local v69
            if v68:GetAttribute("OriginalVisibility") == nil then
                v69 = false
            else
                v69 = v68:GetAttribute("OriginalVisibility")
            end
            v68.Visible = v69
        end
    end
end
function u2.SetupSurvivorStuff(_) --[[Anonymous function at line 201]]
    --[[
    Upvalues:
        [1] = u40
        [2] = u1
        [3] = u28
        [4] = u25
        [5] = u27
        [6] = u29
        [7] = u26
        [8] = u46
        [9] = u67
        [10] = u41
        [11] = u56
        [12] = u57
        [13] = u14
    --]]
    local v71 = u40:WaitForChild("Map", 60)
    local v72 = v71:WaitForChild("Hooks", 60)
    task.wait(10)
    for _, u73 in v72:GetChildren() do
        u73:GetAttributeChangedSignal("CurrentPlayer"):Connect(function() --[[Anonymous function at line 210]]
            --[[
            Upvalues:
                [1] = u73
                [2] = u1
                [3] = u28
                [4] = u25
            --]]
            local v74 = u73:FindFirstChild("HookPrompt", true)
            if u73:GetAttribute("CurrentPlayer") then
                if u73:GetAttribute("CurrentPlayer") ~= u1.Player.Name then
                    local v75 = Instance.new("Highlight", u73)
                    v75.FillColor = Color3.fromRGB(255, 38, 0)
                    v75.FillTransparency = 0.9
                    v75.OutlineColor = Color3.fromRGB(255, 38, 0)
                    v75.OutlineTransparency = 0.5
                    local v76 = u28.Assets.EscapeBillboard:Clone()
                    v76.TextLabel.Text = "RESCUE!"
                    v76.Icon.Image = "rbxassetid://73244530346160"
                    v76.Parent = u73.Root
                    v76.Adornee = u73.Root
                    v74.ActionText = "Rescue Player"
                    v74.HoldDuration = 0
                    v74.Enabled = true
                    u25:AssignPrompt(v74)
                    v74.RequiresLineOfSight = true
                end
            else
                if u73.Root:FindFirstChild("EscapeBillboard") then
                    u73.Root.EscapeBillboard:Destroy()
                end
                if u73:FindFirstChild("Highlight") then
                    u73.Highlight:Destroy()
                end
                u25:UnassignPrompt(v74)
                v74.Enabled = false
                return
            end
        end)
    end
    for _, u77 in v71:WaitForChild("Pallets"):GetChildren() do
        u77:GetAttributeChangedSignal("IsDropped"):Connect(function() --[[Anonymous function at line 252]]
            --[[
            Upvalues:
                [1] = u77
            --]]
            u77.Normal.Prompt.Enabled = false
            u77.Flipped.Prompt.Enabled = false
        end)
    end
    u27:GetInstanceAddedSignal("HealPrompt"):Connect(function(p78) --[[Anonymous function at line 258]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u25
        --]]
        if p78:GetAttribute("GameID") == u1.Player:GetAttribute("CurrentGame") then
            print("Added")
            if p78.Parent.Parent == u1.Player.Character then
                return
            end
            p78.Enabled = true
            p78.ActionText = "Heal"
            p78.MaxActivationDistance = 4
            u25:AssignPrompt(p78, 1)
        end
    end)
    u27:GetInstanceRemovedSignal("HealPrompt"):Connect(function(p79) --[[Anonymous function at line 273]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u25
        --]]
        if p79:GetAttribute("GameID") == u1.Player:GetAttribute("CurrentGame") then
            p79.Enabled = false
            u25:UnassignPrompt(p79)
        end
    end)
    u1.Player:GetAttributeChangedSignal("IsHealing"):Connect(function() --[[Anonymous function at line 281]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u29
        --]]
        if not u1.Player:GetAttribute("IsHealing") then
            u29.Enabled = false
            task.wait(1)
            u29.Enabled = true
        end
    end)
    for _, u80 in game.Players:GetPlayers() do
        if u80:GetAttribute("Role") == "Monster" and u80:GetAttribute("CurrentGame") == u1.Player:GetAttribute("CurrentGame") then
            local function v97(p81) --[[Anonymous function at line 299]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u46
                    [3] = u67
                    [4] = u80
                    [5] = u41
                    [6] = u1
                    [7] = u56
                    [8] = u57
                --]]
                if p81:GetAttribute("IsMonster") then
                    local v82 = game.SoundService.Sounds.Chase:Clone()
                    v82.Parent = p81.PrimaryPart
                    v82:Play()
                    local u83 = u26:GetEquippedAnimatronic() or "Freddy"
                    if u83 ~= "Freddy" then
                        u83 = u83.Name
                    end
                    if p81:GetAttribute("DimPresence") then
                        v82.Volume = v82.Volume * u46[p81:GetAttribute("DimPresence")]
                    end
                    u67:Start()
                    task.delay(5, function() --[[Anonymous function at line 317]]
                        --[[
                        Upvalues:
                            [1] = u80
                            [2] = u67
                            [3] = u41
                            [4] = u1
                            [5] = u83
                            [6] = u56
                            [7] = u57
                        --]]
                        local u84 = u80.Character:WaitForChild("Animations")
                        if u84 then
                            local u85 = false
                            local u86 = false
                            u67:Start()
                            local u87 = nil
                            u87 = u80.Character.Humanoid.Animator.AnimationPlayed:Connect(function(p88) --[[Anonymous function at line 327]]
                                --[[
                                Upvalues:
                                    [1] = u84
                                    [2] = u85
                                    [3] = u86
                                    [4] = u87
                                    [5] = u41
                                    [6] = u1
                                    [7] = u80
                                    [8] = u83
                                    [9] = u56
                                    [10] = u67
                                    [11] = u57
                                --]]
                                if p88.Animation.AnimationId == u84.Walk.AnimationId or p88.Animation.AnimationId == u84.Run.AnimationId then
                                    if u85 and u86 then
                                        print("Disconnected")
                                        u87:Disconnect()
                                        return
                                    end
                                    if p88.Animation.AnimationId == u84.Walk.AnimationId and not u86 then
                                        u86 = true
                                    else
                                        if p88.Animation.AnimationId ~= u84.Run.AnimationId or u85 then
                                            return
                                        end
                                        u85 = true
                                    end
                                    u41:Add(p88:GetMarkerReachedSignal("Step"):Connect(function(_) --[[Anonymous function at line 340]]
                                        --[[
                                        Upvalues:
                                            [1] = u1
                                            [2] = u80
                                            [3] = u87
                                            [4] = u83
                                            [5] = u56
                                            [6] = u67
                                            [7] = u57
                                        --]]
                                        local v89 = u1.Player.Character
                                        local v90 = u80.Character
                                        if v89 and (v89.PrimaryPart and (v90 and v90.PrimaryPart)) then
                                            if not u80:GetAttribute("FootstepsSilenced") then
                                                local v91 = game.SoundService.WalkSounds:FindFirstChild(u83)
                                                local v92 = game.SoundService.Sounds.AnimatronicWalkSingle
                                                local u93 = Instance.new("Sound", v90.PrimaryPart)
                                                if v91 then
                                                    u93.SoundId = v91.SoundId
                                                    u93.Volume = v91.Volume
                                                    u93.RollOffMode = v91.RollOffMode
                                                    u93.RollOffMaxDistance = v91.RollOffMaxDistance
                                                    u93.RollOffMinDistance = v91.RollOffMinDistance
                                                else
                                                    u93.SoundId = v92.SoundId
                                                    u93.Volume = v92.Volume
                                                    u93.RollOffMode = v92.RollOffMode
                                                    u93.RollOffMaxDistance = v92.RollOffMaxDistance
                                                    u93.RollOffMinDistance = v92.RollOffMinDistance
                                                end
                                                u93:Play()
                                                task.delay(u93.TimeLength, function() --[[Anonymous function at line 373]]
                                                    --[[
                                                    Upvalues:
                                                        [1] = u93
                                                    --]]
                                                    u93:Destroy()
                                                end)
                                                local v94 = (v89.PrimaryPart.Position - v90.PrimaryPart.Position).Magnitude - 10
                                                local v95 = math.max(0, v94) / 50
                                                local v96 = 1 - math.abs(v95)
                                                u56 = math.clamp(v96, 0, 1) * 3
                                                u67:Shake(u57.Presets.Step)
                                            end
                                        else
                                            u87:Disconnect()
                                        end
                                    end))
                                end
                            end)
                        else
                            warn("no animations folder in monster character")
                        end
                    end)
                else
                    warn("Not monster chaacter")
                end
            end
            if u80.Character then
                v97(u80.Character)
            end
            u41:Add(u80.CharacterAdded:Connect(v97))
            u14:SetTargetMonster(u80)
        end
    end
end
function u2.GetGameObject(_) --[[Anonymous function at line 401]]
    --[[
    Upvalues:
        [1] = u40
    --]]
    return u40
end
function u2.CreateAlignPosition(_, p98) --[[Anonymous function at line 405]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v99 = p98.Character
    local v100 = u28.Assets.Balloons:Clone()
    v100.Parent = v99
    v100:PivotTo(CFrame.new(v99.Torso.Position))
    while p98:GetAttribute("BeingCarried") and (v100 and (v100.Parent and v100.PrimaryPart)) do
        v100.PrimaryPart.Position = v99.Torso.Position
        task.wait()
    end
end
function u2.LoadEquippedSkills(_) --[[Anonymous function at line 418]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u47
        [3] = u22
        [4] = u36
    --]]
    if u1.Player:GetAttribute("Role") == "Monster" then
        return
    else
        local v101 = u1.Player.PlayerGui.MainGui.Survivor_Buttons.SkillContainer
        v101.Visible = true
        local v102 = v101.Temp
        if u47 and u47.EquippedSkill then
            for _, v103 in u47.EquippedSkill do
                local v104 = v102:Clone()
                local v105 = "rbxassetid://" .. u22:GetImageSkill(v103)
                v104.Parent = v101
                v104.Visible = true
                v104.Icon.Image = v105
                v104.Tier.Text = u36:getSkillTierRoman(v103)
                v104.Name = v103
                u22:SetToolTip(v104, v103)
            end
        end
    end
end
function u2.CreateTopBar(_) --[[Anonymous function at line 442]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u39
        [3] = u21
        [4] = u41
        [5] = u2
    --]]
    local v106 = u1.Player.PlayerGui:WaitForChild("MainGui").Round_Players
    v106.Visible = true
    for _, u107 in game.Players:GetPlayers() do
        if u107:GetAttribute("Role") ~= "Monster" and u107:GetAttribute("CurrentGame") == u39 then
            local u108 = v106.Temp:Clone()
            u108.Name = u107.Name
            u108.PlayerName.Text = u107.Name
            u108.Visible = true
            u108.Parent = v106
            u108.Icon.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=100&h=100"):format(u107.UserId)
            u21.GetPlayerEquippedSkills:Fire(u107)
            local u109 = u107.Character or u107.CharacterAdded:Wait()
            local u110 = u109:WaitForChild("Humanoid")
            local u111 = u108.Status
            local u112 = u108.Health
            u112.Visible = true
            local function v117() --[[Anonymous function at line 464]]
                --[[
                Upvalues:
                    [1] = u107
                    [2] = u111
                    [3] = u108
                    [4] = u109
                    [5] = u110
                    [6] = u112
                --]]
                local v113 = (100 - u107:GetAttribute("HookedHealth")) / 100 * 100
                local v114 = math.round(v113)
                if u107:GetAttribute("Role") == "Eliminated" or not u107.Parent then
                    u111.Text = "CAPTURED"
                    u111.TextColor3 = Color3.fromRGB(127, 128, 128)
                    u108.Icon.ImageColor3 = Color3.fromRGB(72, 72, 72)
                elseif u107:GetAttribute("Role") == "Escaped" then
                    u111.Text = "ESCAPED"
                    u111.TextColor3 = Color3.fromRGB(74, 255, 149)
                elseif u107:GetAttribute("Hooked") then
                    u111.Text = ("CAPTURED (%*%%)"):format(v114)
                    u111.TextColor3 = Color3.fromRGB(255, 38, 0)
                elseif u109:FindFirstChild("IsRagdoll") and u109.IsRagdoll.Value then
                    u111.Text = "KNOCKED"
                    u111.TextColor3 = Color3.fromRGB(255, 147, 0)
                elseif u110.Health < 100 then
                    u111.Text = "INJURED"
                    u111.TextColor3 = Color3.fromRGB(255, 251, 0)
                else
                    u111.TextColor3 = Color3.fromRGB(255, 255, 255)
                    u111.Text = ""
                end
                local v115 = u112
                local v116 = u110.Health
                v115.Text = ("%* HP | %*%%"):format(math.clamp(v116, 0, 100), v114)
            end
            u41:Add(u107:GetAttributeChangedSignal("HookedHealth"):Connect(v117))
            u41:Add(u107:GetAttributeChangedSignal("Role"):Connect(v117))
            u41:Add(u109.IsRagdoll:GetPropertyChangedSignal("Value"):Connect(v117))
            u41:Add(u107:GetAttributeChangedSignal("Hooked"):Connect(v117))
            u41:Add(u110.HealthChanged:Connect(v117))
            u41:Add(u107.AncestryChanged:Connect(v117))
            u107:GetAttributeChangedSignal("BeingCarried"):Connect(function() --[[Anonymous function at line 505]]
                --[[
                Upvalues:
                    [1] = u107
                    [2] = u2
                --]]
                if u107:GetAttribute("BeingCarried") then
                    u2:CreateAlignPosition(u107)
                else
                    local v118 = u107.Character:FindFirstChild("Balloons")
                    if v118 then
                        v118:Destroy()
                    end
                end
            end)
        end
    end
end
function lerp(p119, p120, p121)
    return p119 + (p120 - p119) * p121
end
function updateBar(p122)
    --[[
    Upvalues:
        [1] = u3
        [2] = u35
    --]]
    local v123 = u3.Round_Top
    local v124 = v123.Bar.Fill.Zero.Value
    local v125 = v123.Bar.Fill.One.Value
    local v126 = lerp(v124, v125, p122)
    local v127 = math.min(v126, v125)
    u35.new(v123.Bar.Fill, u35.newInfo(0.5, u35.Style.Quad), {
        ["Size"] = UDim2.new(v127, 0, 1, 0)
    }):Play()
end
function u2.GetGameState(_) --[[Anonymous function at line 529]]
    --[[
    Upvalues:
        [1] = u40
    --]]
    if u40 then
        return u40:GetAttribute("State")
    end
end
function u2.BindToNewGame(_) --[[Anonymous function at line 535]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u42
        [3] = u1
        [4] = u40
        [5] = u2
        [6] = u9
        [7] = u16
        [8] = u54
        [9] = u19
        [10] = u18
        [11] = u12
        [12] = u14
        [13] = u8
        [14] = u7
        [15] = u31
        [16] = u4
        [17] = u41
        [18] = u70
        [19] = u6
        [20] = u21
        [21] = u22
        [22] = u36
    --]]
    local u128 = u3.Round_Top
    local function u129() --[[Anonymous function at line 539]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u1
            [3] = u40
            [4] = u2
            [5] = u9
        --]]
        if u42 then
            return
        elseif u1.Player:GetAttribute("Role") == "Survivor" and (u40:GetAttribute("State") == "Game" or u40:GetAttribute("State") == "Voting") then
            u42 = true
            u2:SetupSurvivorStuff()
        elseif u1.Player:GetAttribute("Role") == "Monster" and (u40:GetAttribute("State") == "Game" or u40:GetAttribute("State") == "Voting") then
            u42 = true
            u9:SetupMonsterPrompts(u40)
        end
    end
    u1.Player.CameraMaxZoomDistance = 15
    local function v139() --[[Anonymous function at line 554]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u2
            [3] = u16
            [4] = u54
            [5] = u19
            [6] = u18
            [7] = u3
            [8] = u12
            [9] = u14
            [10] = u128
            [11] = u1
            [12] = u8
            [13] = u7
            [14] = u42
            [15] = u129
        --]]
        local v130 = u40:GetAttribute("State") or ""
        u2.StateChanged:Fire(v130)
        if v130 == "Starting" then
            game.StarterGui:SetCore("ResetButtonCallback", false)
        end
        if v130 == "Voting" then
            u16:Disable()
            u54("Voting")
        end
        if v130 == "Ending" then
            u19:Run()
            u18:Stop()
        end
        if v130 == "Ended" then
            for _, v131 in u3:GetChildren() do
                if string.split(v131.Name, "_")[2] and string.split(v131.Name, "_")[2]:lower() == "buttons" then
                    v131.Visible = false
                end
            end
            u12:LoadLighting("Lobby")
            u54("Lobby")
            u14:SetTargetMonster(nil)
            u18:Stop()
            game.StarterGui:SetCore("ResetButtonCallback", true)
        end
        if v130 == "Starting" or v130 == "Game" then
            u16:Disable()
            u128.Visible = true
            u3.Round_Players.Visible = true
            u128.Bar.Visible = true
            u3.EmoteButton.Visible = true
        elseif v130 == "Waiting for players" then
            u128.Visible = true
            u128.Bar.Visible = false
        else
            u128.Visible = false
            u3.Round_Players.Visible = false
            u3.Round_Bottom.Visible = false
        end
        if v130 == "Starting" then
            u16:Disable()
            u54("")
        end
        if v130 == "Game" then
            u16:Disable()
            if u1.Player:GetAttribute("Role") == "Survivor" then
                u3.Monster_Buttons.Visible = false
                u3.Survivor_Buttons.Visible = true
            end
            if u1.Player:GetAttribute("Role") == "Monster" then
                u3.Monster_Buttons.Visible = true
                u3.Survivor_Buttons.Visible = false
                u3.Round_Bottom.Visible = false
            end
            u12:LoadLighting(u40:GetAttribute("SelectedMap"))
            local v132 = u40:WaitForChild("Map")
            u8:SetupLockers(u40)
            u7:SetupDoors(u40)
            local v133 = v132:WaitForChild("Tasks")
            local u134 = #v132.Tasks:GetChildren() - 1
            local u135 = 0
            for _, u136 in v133:GetChildren() do
                u136:GetAttributeChangedSignal("Completed"):Connect(function() --[[Anonymous function at line 669]]
                    --[[
                    Upvalues:
                        [1] = u136
                        [2] = u135
                        [3] = u128
                        [4] = u134
                    --]]
                    if u136:GetAttribute("Completed") then
                        u135 = u135 + 1
                        u128.Bar.Count.Text = u135 .. "/" .. u134
                        local v137 = u135 / u134
                        updateBar(v137)
                    end
                end)
            end
            u128.Bar.Count.Text = u135 .. "/" .. u134
            local v138 = u135 / u134
            updateBar(v138)
            u2:CreateTopBar()
            u2:LoadEquippedSkills()
            u54(u40:GetAttribute("SelectedMap"))
            if not u42 and u1.Player:GetAttribute("Role") then
                u129()
            end
        end
    end
    local function v141() --[[Anonymous function at line 696]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u16
            [3] = u31
            [4] = u3
            [5] = u4
            [6] = u128
            [7] = u18
        --]]
        local v140 = u40:GetAttribute("Timer") or 0
        if u40:GetAttribute("State") == "Waiting for players " then
            u16:SetText((("Waiting for players...(%*)"):format((u31(v140)))))
        end
        if u40:GetAttribute("State") == "Voting" then
            u3.MapFrame.Label.Text = ("Map Voting (%*)"):format((u31(v140)))
            return
        elseif u40:GetAttribute("State") == "Starting" then
            u4.Whole.GameStatus.Text = ("Waiting for players ( %* )"):format((u31(v140)))
        else
            u128.TimerContainer.Amount.Text = u31(v140)
            u4.Whole.GameStatus.Text = ("Game is starting in... %*"):format((u31(v140)))
            if not u18.Done then
                u18:ChangeText((("You will spawn in %*"):format((u31(v140)))))
            end
        end
    end
    u41:Add(u1.Player:GetAttributeChangedSignal("Role"):Connect(u129))
    u129()
    u41:Add(u40:GetAttributeChangedSignal("State"):Connect(v139))
    v139()
    u41:Add(u40:GetAttributeChangedSignal("Timer"):Connect(v141))
    v141()
    u41:Add(u1.Player.CharacterAdded:Connect(function() --[[Anonymous function at line 729]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u40
            [3] = u70
            [4] = u3
            [5] = u54
            [6] = u18
        --]]
        if (u1.Player:GetAttribute("Role") == "Eliminated" or u1.Player:GetAttribute("Role") == "Escaped") and (u40 and (u40:GetAttribute("State") ~= "Ended" and u40:GetAttribute("State") ~= "Ending")) then
            u70()
            for _, v142 in u3:GetChildren() do
                if string.split(v142.Name, "_")[2] and string.split(v142.Name, "_")[2]:lower() == "buttons" then
                    v142.Visible = false
                end
            end
            u3.Round_Bottom.Visible = false
            u3.Round_Top.Visible = false
            u3.Round_Players.Visible = false
            u3.LevelFrame.Visible = true
            u3.CurrencyFrame.Visible = true
            u3.PlayButton.Visible = true
            u3.ReturnButton.Visible = true
            u54("Lobby")
            u18:Stop()
            for _ = 1, 5 do
                task.wait(1)
                local v143, _ = pcall(function() --[[Anonymous function at line 757]]
                    return game.StarterGui:SetCore("ResetButtonCallback", true)
                end)
                if v143 then
                    break
                end
            end
        end
    end))
    u6.ReleasedMonster:Connect(function() --[[Anonymous function at line 766]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u18
        --]]
        if u1.Player:GetAttribute("Role") == "Monster" then
            u18:ChangeText("Spawning...")
            u18.Done = true
            u18:Stop()
            task.delay(1.03, function() --[[Anonymous function at line 773]]
                --[[
                Upvalues:
                    [1] = u1
                --]]
                workspace.CurrentCamera.CameraSubject = u1.Player.Character.Humanoid
            end)
        end
    end)
    u21.GetPlayerEquippedSkills:Connect(function(p144, p145) --[[Anonymous function at line 782]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u22
            [3] = u36
        --]]
        local v146 = u1.Player.PlayerGui:WaitForChild("MainGui").Round_Players:FindFirstChild(p145.Name)
        if v146 then
            local v147 = v146.SkillContainer
            local v148 = v147.Temp
            for _, v149 in p144 do
                local v150 = v148:Clone()
                local v151 = "rbxassetid://" .. u22:GetImageSkill(v149)
                v150.Parent = v147
                v150.Visible = true
                v150.Icon.Image = v151
                v150.Tier.Text = u36:getSkillTierRoman(v149)
                v150.Name = v149
                u22:SetToolTip(v150, v149)
            end
        else
            warn("ROUND_PLAYERS NOT FOUND: ", p145.Name)
        end
    end)
end
function u2.KnitStart(_) --[[Anonymous function at line 803]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u19
        [3] = u15
        [4] = u3
        [5] = u37
        [6] = u5
        [7] = u43
        [8] = u1
        [9] = u18
        [10] = u40
        [11] = u45
        [12] = u17
        [13] = u30
        [14] = u41
        [15] = u39
        [16] = u20
        [17] = u2
        [18] = u38
        [19] = u67
        [20] = u57
        [21] = u14
        [22] = u44
    --]]
    u6.DisplayResults:Connect(function() --[[Anonymous function at line 804]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:Stop()
    end)
    u15.PassMonsterInfo:Connect(function(p152) --[[Anonymous function at line 808]]
        IntroUIController:SetMonsterInfo(p152)
    end)
    u6.PromptVote:Connect(function(p153) --[[Anonymous function at line 812]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u37
            [3] = u5
            [4] = u6
            [5] = u43
        --]]
        for _, u154 in pairs(p153) do
            local v155 = u3.MapFrame.Holder.Template:Clone()
            v155.Button.MapName.Text = u154[1]
            v155.Button.Votes.Text = #u154[2]
            v155.Button.Icon.Image = "rbxassetid://" .. u37.Maps[u154[1]].Icon
            v155.Name = u154[1]
            v155.Visible = true
            v155.Parent = u3.MapFrame.Holder
            u5:ActivateButton(v155.Button)
            v155.Button.MouseButton1Click:Connect(function() --[[Anonymous function at line 823]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u154
                --]]
                u6.Vote:Fire(u154[1])
            end)
        end
        u43.CameraType = Enum.CameraType.Scriptable
        u43.CFrame = workspace.Map.ForceVotingCamera.CFrame
        u3.CurrencyFrame.Visible = false
        u3.LevelFrame.Visible = false
        u3.SettingsFrame.Visible = false
        u3.DailyRewardButton.Visible = false
        u3.StreakRewardButton.Visible = false
        u5:OpenFrame(u3.MapFrame)
        u3.BoostsFrame.Visible = false
    end)
    u6.StopVote:Connect(function() --[[Anonymous function at line 842]]
        --[[
        Upvalues:
            [1] = u43
            [2] = u5
            [3] = u3
        --]]
        u43.CameraType = Enum.CameraType.Custom
        u5:CloseFrame(u3.MapFrame)
    end)
    u6.Vote:Connect(function(p156) --[[Anonymous function at line 847]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        for _, v157 in pairs(p156) do
            local v158 = u3.MapFrame.Holder:FindFirstChild(v157[1])
            if v158 then
                v158.Button.MapName.Text = v157[1]
                v158.Button.Votes.Text = #v157[2]
            end
        end
    end)
    u6.FinishedIntro:Connect(function() --[[Anonymous function at line 857]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u18
            [3] = u40
            [4] = u45
            [5] = u17
        --]]
        CutsceneController:Stop("Intro")
        IntroUIController:Stop()
        if u1.Player:GetAttribute("Role") == "Monster" then
            u18:Run()
            task.delay(1, function() --[[Anonymous function at line 863]]
                IntroUIController:ForceInvisible()
            end)
            u18.Completed:Once(function() --[[Anonymous function at line 866]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u1
                    [3] = u45
                    [4] = u17
                --]]
                if u40:GetAttribute("State") ~= "Ended" then
                    for _, v159 in u1.Player.PlayerGui.MainGui:GetChildren() do
                        if not u45[v159.Name] and (v159:IsA("Frame") or (v159:IsA("TextButton") or (v159:IsA("ImageLabel") or v159:IsA("ImageButton")))) then
                            v159:SetAttribute("OriginalVisibility", v159.Visible)
                            v159.Visible = false
                        end
                    end
                    task.delay(1, function() --[[Anonymous function at line 879]]
                        --[[
                        Upvalues:
                            [1] = u17
                            [2] = u1
                        --]]
                        u17:ShowGuide(u1.Player:GetAttribute("Role"))
                        workspace.Camera.CameraType = Enum.CameraType.Attach
                        workspace.Camera.CameraType = Enum.CameraType.Custom
                        workspace.Camera.CameraSubject = u1.Player.Character.Humanoid
                    end)
                end
            end)
        else
            for _, v160 in u1.Player.PlayerGui.MainGui:GetChildren() do
                if not u45[v160.Name] and (v160:IsA("Frame") or (v160:IsA("TextButton") or (v160:IsA("ImageLabel") or v160:IsA("ImageButton")))) then
                    v160:SetAttribute("OriginalVisibility", v160.Visible)
                    v160.Visible = false
                end
            end
            task.delay(3, function() --[[Anonymous function at line 897]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u1
                --]]
                u17:ShowGuide(u1.Player:GetAttribute("Role"))
            end)
        end
    end)
    u6.OpenEscape:Connect(function(u161, p162) --[[Anonymous function at line 905]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        local u163 = Instance.new("CFrameValue", u161)
        u163.Value = p162
        u163:GetPropertyChangedSignal("Value"):Connect(function() --[[Anonymous function at line 909]]
            --[[
            Upvalues:
                [1] = u163
                [2] = u161
            --]]
            u161:PivotTo(u163.Value)
        end)
        u30:Create(u163, TweenInfo.new(5, Enum.EasingStyle.Linear), {
            ["Value"] = u163.Value * CFrame.new(0, 14, 0)
        }):Play()
    end)
    local function v165() --[[Anonymous function at line 919]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u39
            [3] = u1
            [4] = u5
            [5] = u20
            [6] = u40
            [7] = u2
        --]]
        u41:Cleanup()
        u39 = u1.Player:GetAttribute("CurrentGame")
        local v164 = u1.Player.PlayerGui.MainGui.ReturnButton
        if u39 then
            u5:ActivateButton(v164)
            v164.MouseButton1Click:Connect(function() --[[Anonymous function at line 937]]
                --[[
                Upvalues:
                    [1] = u1
                    [2] = u20
                --]]
                game:GetService("TeleportService"):Teleport(74161468227974, u1.Player)
                u20:TopNotify("Teleporting...")
            end)
            u40 = workspace:WaitForChild(u39, 5)
            u2:BindToNewGame()
        else
            u1.Player.CameraMaxZoomDistance = 20
            v164.Visible = true
        end
    end
    u1.Player:GetAttributeChangedSignal("CurrentGame"):Connect(v165)
    if u1.Player:GetAttribute("CurrentGame") then
        v165()
    end
    u1.Player:GetAttributeChangedSignal("BeingCarried"):Connect(function() --[[Anonymous function at line 952]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if u1.Player:GetAttribute("BeingCarried") then
            workspace:FindFirstChild(u1.Player:GetAttribute("BeingCarried"))
            workspace.CurrentCamera.CameraSubject = u1.Player.Character.HumanoidRootPart
        else
            workspace.CurrentCamera.CameraSubject = u1.Player.Character.Humanoid
        end
    end)
    u1.Player:GetAttributeChangedSignal("Hooked"):Connect(function() --[[Anonymous function at line 962]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u38
        --]]
        if u1.Player:GetAttribute("Hooked") then
            u38:PlayAnimation("Drowning")
        else
            u1.Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            u38:StopAnimation("Drowning")
        end
    end)
    u1.Player.CharacterAdded:Connect(function(p166) --[[Anonymous function at line 971]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u1
            [3] = u3
            [4] = u67
            [5] = u57
            [6] = u14
            [7] = u30
            [8] = u44
        --]]
        if u40 then
            local v167 = u40:GetAttribute("State")
            if v167 ~= "Starting" and v167 ~= "Voting" then
                return
            end
            local v168 = p166:WaitForChild("Humanoid")
            if u1.Player:GetAttribute("Role") == "Monster" then
                v168:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
                v168:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                v168:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            else
                v168.WalkSpeed = 16
            end
            local u169 = v168.Health
            local u170 = u3.Round_Bottom
            u170.Container.Amount.Text = ("%* HP"):format(u169)
            v168.HealthChanged:Connect(function(p171) --[[Anonymous function at line 994]]
                --[[
                Upvalues:
                    [1] = u170
                    [2] = u169
                    [3] = u67
                    [4] = u57
                    [5] = u14
                    [6] = u1
                    [7] = u30
                    [8] = u44
                --]]
                u170.Container.Amount.Text = ("%* HP"):format(p171)
                u170.Container.Amount.TextColor3 = Color3.fromRGB(255, 29, 29):Lerp(Color3.fromRGB(255, 255, 255), p171 / 100)
                if u169 - p171 >= 19 then
                    u67:Shake(u57.Presets.Explosion)
                    u14:Hurt()
                    local u172 = u1.Player.PlayerGui.MainGui.InjuredOverlay
                    u172.Visible = true
                    u172.ImageTransparency = 0
                    task.delay(4, function() --[[Anonymous function at line 1009]]
                        --[[
                        Upvalues:
                            [1] = u30
                            [2] = u172
                            [3] = u44
                        --]]
                        u30:Create(u172, u44, {
                            ["ImageTransparency"] = 1
                        }):Play()
                    end)
                end
                u169 = p171
            end)
        end
    end)
end
return u2
