-- added anti afk
if not _G.ScriptRunning then
    _G.ScriptRunning = true

    if not hookmetamethod then
        return notify('Incompatible Exploit', 'Your exploit does not support `hookmetamethod`')
    end

    local TeleportService = game:GetService("TeleportService")
    local oldIndex
    local oldNamecall

    -- Hook __index to intercept TeleportService method calls
    oldIndex = hookmetamethod(game, "__index", function(self, key)
        if self == TeleportService and (key:lower() == "teleport" or key == "TeleportToPlaceInstance") then
            return function()
                error("Teleportation blocked by anti-teleport script.", 2)
            end
        end
        return oldIndex(self, key)
    end)

    -- Hook __namecall to intercept method calls like TeleportService:Teleport(...)
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if self == TeleportService and (method:lower() == "teleport" or method == "TeleportToPlaceInstance") then
            return
        end
        return oldNamecall(self, ...)
    end)

    print('Anti-Rejoin', 'Teleportation prevention is now active.')

    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    local virtualUser = game:GetService("VirtualUser")
    
    Player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end)
    
    --print("FarmPet Now running!")
    local Players = game:GetService("Players")
    local Player = Players.LocalPlayer
    local CoreGui = game:GetService("CoreGui")
    local PlayerGui = Player:FindFirstChildOfClass("PlayerGui") or CoreGui
    local LiveOpsMapSwap = require(game:GetService("ReplicatedStorage").SharedModules.Game.LiveOpsMapSwap)

    local router
    for i, v in next, getgc(true) do
        if type(v) == 'table' and rawget(v, 'get_remote_from_cache') then
            router = v
        end
    end
    local function rename(remotename, hashedremote)
        hashedremote.Name = remotename
    end
    -- Apply renaming to upvalues of the RouterClient.init function
    table.foreach(debug.getupvalue(router.get_remote_from_cache, 1), rename)

    --print("After dehash")

    task.wait(2) -- idk how much

    local sound = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("SoundPlayer")
    local UI = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")

    sound.FX:play("BambooButton")
    UI.set_app_visibility("NewsApp", false)

    task.wait(5)
    game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("DailyLoginAPI/ClaimDailyReward"):InvokeServer()
    sound.FX:play("BambooButton")
    UI.set_app_visibility("DailyLoginApp", false)

    getgenv().fsysCore = require(game:GetService("ReplicatedStorage").ClientModules.Core.InteriorsM.InteriorsM)
    local function teleportToMainmap()
        local targetCFrame = CFrame.new(-275.9091491699219, 25.812084197998047, -1548.145751953125, -0.9798217415809631, 0.0000227206928684609, 0.19986890256404877, -0.000003862579433189239, 1, -0.00013261348067317158, -0.19986890256404877, -0.00013070966815575957, -0.9798217415809631)
        local OrigThreadID = getthreadidentity()
        task.wait(1)
        setidentity(2)
        task.wait(1)
        fsysCore.enter_smooth("MainMap", "MainDoor", {
            ["spawn_cframe"] = targetCFrame * CFrame.Angles(0, 0, 0)
        })
        setidentity(OrigThreadID)
    end

    local function teleportPlayerNeeds(x, y, z)
        local Player = game.Players.LocalPlayer
        if Player and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z) 
        else
            --print("Player or character not found!")
        end
    end
    local UI = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")
    local InShakeDown = false 
    local FinishedMinigame = false
    local RunService = game:GetService("RunService")

        local player = game:GetService("Players").LocalPlayer
        local gui = player:FindFirstChild("PlayerGui")
        local dialogApp = gui and gui:FindFirstChild("DialogApp")

                teleportToMainmap()
                task.wait(5)
                teleportPlayerNeeds(74.4566879272461, 41.194610595703125, -1571.404296875)
    while true do
        -- Wait until we are inside the BlossomShakedownInterior
        if not InShakeDown and workspace.Interiors:FindFirstChild("BlossomShakedownInterior") then
            InShakeDown = true
            task.wait(2)

            local rings = workspace.Interiors.BlossomShakedownInterior:WaitForChild("Rings")
            local messageServer = game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("MinigameAPI/MessageServer")

            local count = 0
            for _, ring in ipairs(rings:GetChildren()) do
                if count >= 40 then break end
                messageServer:FireServer("blossom_shakedown", "petal_ring_flown_through", ring.Name)
                count += 1
            end
        end

        -- Wait until player is back in MainMap and reward UI is shown
        if InShakeDown and not FinishedMinigame then
            local success = pcall(function()
                if workspace.Interiors:FindFirstChild("MainMap!Default") then
                    local rewardsApp = gui and gui:FindFirstChild("MinigameRewardsApp")
                    if rewardsApp and rewardsApp.Body.Visible then
                        task.wait(2)
                        
                        -- Reset all flags
                        InShakeDown = false
                        FinishedMinigame = false
                        
                        if UI then
                            UI.set_app_visibility("MinigameRewardsApp", false)
                        end
                    end
                end
            end)
            if not success then
                -- If MainMap or rewards not ready yet, wait a bit
                task.wait(1)
            end
        end
        task.wait(1)
    end
end
