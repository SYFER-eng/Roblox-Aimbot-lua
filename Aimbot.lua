local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local AimbotRightButton = Instance.new("TextButton")
local AimbotLeftButton = Instance.new("TextButton")
local ESPButton = Instance.new("TextButton")

-- GUI Setup
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Enabled = false -- Start hidden

MainFrame.Size = UDim2.new(0, 200, 0, 200) -- Increased height for new button
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.Parent = ScreenGui

-- Make GUI Draggable
local Dragging = false
local DragStart = nil
local StartPosition = nil

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = true
        DragStart = input.Position
        StartPosition = MainFrame.Position
    end
end)

MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and Dragging then
        local Delta = input.Position - DragStart
        MainFrame.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
    end
end)

-- Title
TitleLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
TitleLabel.Position = UDim2.new(0.1, 0, 0.05, 0)
TitleLabel.Text = "Syfer's Menu"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 18
TitleLabel.Parent = MainFrame

-- Aimbot Right Button
AimbotRightButton.Size = UDim2.new(0.8, 0, 0.2, 0)
AimbotRightButton.Position = UDim2.new(0.1, 0, 0.3, 0)
AimbotRightButton.Text = "Aimbot Right: OFF"
AimbotRightButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AimbotRightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotRightButton.Parent = MainFrame

-- Aimbot Left Button
AimbotLeftButton.Size = UDim2.new(0.8, 0, 0.2, 0)
AimbotLeftButton.Position = UDim2.new(0.1, 0, 0.5, 0)
AimbotLeftButton.Text = "Aimbot Left: OFF"
AimbotLeftButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AimbotLeftButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotLeftButton.Parent = MainFrame

-- ESP Button
ESPButton.Size = UDim2.new(0.8, 0, 0.2, 0)
ESPButton.Position = UDim2.new(0.1, 0, 0.7, 0)
ESPButton.Text = "ESP: OFF"
ESPButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.Parent = MainFrame

-- Variables
local ESPObjects = {}
local AimbotRightEnabled = false
local AimbotLeftEnabled = false
local ESPEnabled = false

-- Create ESP Function
local function CreateESP(player)
    local esp = {
        Box = Drawing.new("Square"),
        Name = Drawing.new("Text"),
        Tracer = Drawing.new("Line")
    }
    
    esp.Box.Thickness = 2
    esp.Box.Filled = false
    esp.Box.Transparency = 1
    
    esp.Name.Size = 14
    esp.Name.Center = true
    esp.Name.Outline = true
    
    esp.Tracer.Thickness = 1
    esp.Tracer.Transparency = 1
    
    ESPObjects[player] = esp
    return esp
end

-- Aimbot Function
local function AimAt(target)
    if target and target.Character and target.Character:FindFirstChild("Head") then
        local head = target.Character.Head
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)
    end
end

-- Get Closest Enemy
local function GetClosestEnemy()
    local closestDistance = math.huge
    local closestPlayer = nil
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Team ~= LocalPlayer.Team and player.Character and player.Character:FindFirstChild("Head") then
            local distance = (player.Character.Head.Position - Camera.CFrame.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = player
            end
        end
    end
    return closestPlayer
end

-- Button Handlers
AimbotRightButton.MouseButton1Click:Connect(function()
    AimbotRightEnabled = not AimbotRightEnabled
    AimbotRightButton.Text = "Aimbot Right: " .. (AimbotRightEnabled and "ON" or "OFF")
    AimbotRightButton.BackgroundColor3 = AimbotRightEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
end)

AimbotLeftButton.MouseButton1Click:Connect(function()
    AimbotLeftEnabled = not AimbotLeftEnabled
    AimbotLeftButton.Text = "Aimbot Left: " .. (AimbotLeftEnabled and "ON" or "OFF")
    AimbotLeftButton.BackgroundColor3 = AimbotLeftEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
end)

ESPButton.MouseButton1Click:Connect(function()
    ESPEnabled = not ESPEnabled
    ESPButton.Text = "ESP: " .. (ESPEnabled and "ON" or "OFF")
    ESPButton.BackgroundColor3 = ESPEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
end)

-- Main Loop
RunService.RenderStepped:Connect(function()
    -- Right Click Aimbot
    if AimbotRightEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = GetClosestEnemy()
        if target then
            AimAt(target)
        end
    end
    
    -- Left Click Aimbot
    if AimbotLeftEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
        local target = GetClosestEnemy()
        if target then
            AimAt(target)
        end
    end
    
    -- ESP Update
    for player, esp in pairs(ESPObjects) do
        if ESPEnabled and player.Character and player.Team ~= LocalPlayer.Team then
            local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local vector, onScreen = Camera:WorldToViewportPoint(humanoidRootPart.Position)
                
                if onScreen then
                    esp.Box.Size = Vector2.new(2000 / vector.Z, 2500 / vector.Z)
                    esp.Box.Position = Vector2.new(vector.X - esp.Box.Size.X / 2, vector.Y - esp.Box.Size.Y / 2)
                    esp.Box.Color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
                    esp.Box.Visible = true
                    
                    esp.Name.Position = Vector2.new(vector.X, vector.Y - esp.Box.Size.Y / 2 - 15)
                    esp.Name.Text = player.Name
                    esp.Name.Color = esp.Box.Color
                    esp.Name.Visible = true
                    
                    esp.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    esp.Tracer.To = Vector2.new(vector.X, vector.Y)
                    esp.Tracer.Color = esp.Box.Color
                    esp.Tracer.Visible = true
                else
                    esp.Box.Visible = false
                    esp.Name.Visible = false
                    esp.Tracer.Visible = false
                end
            end
        else
            esp.Box.Visible = false
            esp.Name.Visible = false
            esp.Tracer.Visible = false
        end
    end
end)

-- Initialize ESP for existing players
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
    end
end

-- Handle new/leaving players
Players.PlayerAdded:Connect(function(player)
    CreateESP(player)
end)

Players.PlayerRemoving:Connect(function(player)
    if ESPObjects[player] then
        for _, drawing in pairs(ESPObjects[player]) do
            drawing:Remove()
        end
        ESPObjects[player] = nil
    end
end)

-- Toggle menu with Insert key
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)
