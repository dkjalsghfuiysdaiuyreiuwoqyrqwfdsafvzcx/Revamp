print("Running Get Items")
local router
for i, v in next, getgc(true) do
    if type(v) == 'table' and rawget(v, 'get_remote_from_cache') then
        router = v
    end
end
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function rename(remotename, hashedremote)
    hashedremote.Name = remotename
end
table.foreach(debug.getupvalue(router.get_remote_from_cache, 1), rename)

task.wait(3)
local sound = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("SoundPlayer")
local UI = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("UIManager")

sound.FX:play("BambooButton")
UI.set_app_visibility("NewsApp", false)
task.wait(3)

local ClientData = require(game:GetService("ReplicatedStorage").ClientModules.Core.ClientData)
local SocialStones = ClientData.get_data()[game.Players.LocalPlayer.Name].social_stones_2025
local StonesToBuy = math.floor(SocialStones / 25)
local FoodData = ClientData.get_data()[game.Players.LocalPlayer.Name].inventory.food

local function createPlatform()
        local Player = game.Players.LocalPlayer
        local character = Player.Character or Player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        -- Count existing platforms in the workspace
        local existingPlatforms = 0
        for _, object in pairs(workspace:GetChildren()) do
            if object.Name == "CustomPlatform" then
                existingPlatforms += 1
            end
        end

        -- Check if the number of platforms exceeds 5
        if existingPlatforms >= 5 then
            --print("Maximum number of platforms reached, skipping creation.")
            return
        end

        -- Debug message
        --print("Teleport successful, creating platform...")

        -- Create the platform part
        local platform = Instance.new("Part")
        platform.Name = "CustomPlatform" -- Unique name to identify the platform
        platform.Size = Vector3.new(1100, 1, 1100) -- Size of the platform
        platform.Anchored = true -- Make sure the platform doesn't fall
        platform.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -5, 0) -- Place 5 studs below the player

        -- Set part properties
        platform.BrickColor = BrickColor.new("Bright yellow") -- You can change the color
        platform.Parent = workspace -- Parent to the workspace so it's visible
end

if StonesToBuy > 0 then
    local args = {
        "food",
        "butterfly_2025_snapdragon_flower",
        StonesToBuy
    }
    game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("SocialStonesAPI/AttemptExchange"):FireServer(unpack(args))
end

task.wait(1)
game:GetService("ReplicatedStorage").API:FindFirstChild("LocationAPI/SetLocation"):FireServer("Butterfly2025Sanctuary")
createPlatform()

task.wait(3)

for x, y in pairs(FoodData) do
    if y.id == "butterfly_2025_snapdragon_flower" then
        local args = {
            "butterfly_2025_snapdragon_flower",
            y.unique
        }
        game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("LootBoxAPI/ExchangeItemForReward"):InvokeServer(unpack(args))
    end
end

task.wait(1)
game:GetService("ReplicatedStorage"):WaitForChild("API"):WaitForChild("TeamAPI/Spawn"):InvokeServer()
