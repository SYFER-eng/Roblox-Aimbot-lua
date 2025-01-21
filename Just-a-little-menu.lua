local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")

-- Create the main screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create the main window
local mainWindow = Instance.new("Frame")
mainWindow.Size = UDim2.new(0, 510, 0, 400)
mainWindow.Position = UDim2.new(0.5, -255, 0.5, -200)
mainWindow.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainWindow.BackgroundTransparency = 0.2
mainWindow.Visible = false
mainWindow.Parent = screenGui

-- Title label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Roblox Aim & Visual Hack"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.SourceSans
titleLabel.Parent = mainWindow

-- Create Tabs
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, 0, 0, 40)
tabsFrame.Position = UDim2.new(0, 0, 0, 30)
tabsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tabsFrame.BackgroundTransparency = 0.5
tabsFrame.Parent = mainWindow

-- Tab Buttons
local aimbotTabButton = Instance.new("TextButton")
aimbotTabButton.Size = UDim2.new(0, 170, 0, 40)
aimbotTabButton.Position = UDim2.new(0, 0, 0, 0)
aimbotTabButton.Text = "Aimbot"
aimbotTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbotTabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
aimbotTabButton.Font = Enum.Font.SourceSans
aimbotTabButton.TextSize = 16
aimbotTabButton.Parent = tabsFrame

local espTabButton = Instance.new("TextButton")
espTabButton.Size = UDim2.new(0, 170, 0, 40)
espTabButton.Position = UDim2.new(0, 170, 0, 0)
espTabButton.Text = "ESP"
espTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
espTabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
espTabButton.Font = Enum.Font.SourceSans
espTabButton.TextSize = 16
espTabButton.Parent = tabsFrame

local unloadTabButton = Instance.new("TextButton")
unloadTabButton.Size = UDim2.new(0, 170, 0, 40)
unloadTabButton.Position = UDim2.new(0, 340, 0, 0)
unloadTabButton.Text = "Unload"
unloadTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
unloadTabButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
unloadTabButton.Font = Enum.Font.SourceSans
unloadTabButton.TextSize = 16
unloadTabButton.Parent = tabsFrame

-- Create Sections
local aimbotSection = Instance.new("Frame")
aimbotSection.Size = UDim2.new(1, 0, 0, 250)
aimbotSection.Position = UDim2.new(0, 0, 0, 70)
aimbotSection.BackgroundTransparency = 0.3
aimbotSection.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
aimbotSection.Parent = mainWindow

local espSection = Instance.new("Frame")
espSection.Size = UDim2.new(1, 0, 0, 250)
espSection.Position = UDim2.new(0, 0, 0, 70)
espSection.BackgroundTransparency = 0.3
espSection.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
espSection.Visible = false
espSection.Parent = mainWindow

local unloadSection = Instance.new("Frame")
unloadSection.Size = UDim2.new(1, 0, 0, 250)
unloadSection.Position = UDim2.new(0, 0, 0, 70)
unloadSection.BackgroundTransparency = 0.3
unloadSection.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
unloadSection.Visible = false
unloadSection.Parent = mainWindow

-- Aimbot Controls
local aimAssistToggle = Instance.new("TextButton")
aimAssistToggle.Size = UDim2.new(0, 200, 0, 30)
aimAssistToggle.Position = UDim2.new(0, 10, 0, 10)
aimAssistToggle.Text = "Enable Aim Assist"
aimAssistToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
aimAssistToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
aimAssistToggle.Parent = aimbotSection
local aimAssistEnabled = false

local autoAimToggle = Instance.new("TextButton")
autoAimToggle.Size = UDim2.new(0, 200, 0, 30)
autoAimToggle.Position = UDim2.new(0, 10, 0, 50)
autoAimToggle.Text = "Enable Auto Aim"
autoAimToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
autoAimToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoAimToggle.Parent = aimbotSection
local autoAimEnabled = false

-- Aimbot Button Dropdown (for button selection)
local aimKeyDropdown = Instance.new("Frame")
aimKeyDropdown.Size = UDim2.new(0, 200, 0, 30)
aimKeyDropdown.Position = UDim2.new(0, 10, 0, 90)
aimKeyDropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
aimKeyDropdown.Parent = aimbotSection

local aimKeyButton = Instance.new("TextButton")
aimKeyButton.Size = UDim2.new(1, 0, 1, 0)
aimKeyButton.Text = "Activation Key: Right Mouse"
aimKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
aimKeyButton.BackgroundTransparency = 1
aimKeyButton.Parent = aimKeyDropdown

local dropdownContent = Instance.new("Frame")
dropdownContent.Size = UDim2.new(1, 0, 0, 90)
dropdownContent.Position = UDim2.new(0, 0, 1, 0)
dropdownContent.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
dropdownContent.Visible = false
dropdownContent.ZIndex = 2
dropdownContent.Parent = aimKeyDropdown

local options = {
    {name = "Right Mouse", input = Enum.UserInputType.MouseButton2},
    {name = "Left Control", input = Enum.KeyCode.LeftControl},
    {name = "Left Shift", input = Enum.KeyCode.LeftShift}
}

local selectedOption = options[1]

-- Create option buttons
for i, option in ipairs(options) do
    local optionButton = Instance.new("TextButton")
    optionButton.Size = UDim2.new(1, 0, 0, 30)
    optionButton.Position = UDim2.new(0, 0, 0, (i-1) * 30)
    optionButton.Text = option.name
    optionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    optionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    optionButton.ZIndex = 2
    optionButton.Parent = dropdownContent
    
    optionButton.MouseButton1Click:Connect(function()
        selectedOption = option
        aimKeyButton.Text = "Activation Key: " .. option.name
        dropdownContent.Visible = false
    end)
end

-- Toggle dropdown visibility
aimKeyButton.MouseButton1Click:Connect(function()
    dropdownContent.Visible = not dropdownContent.Visible
end)

-- ESP Controls
local highlightAllToggle = Instance.new("TextButton")
highlightAllToggle.Size = UDim2.new(0, 200, 0, 30)
highlightAllToggle.Position = UDim2.new(0, 10, 0, 10)
highlightAllToggle.Text = "Highlight All Players"
highlightAllToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
highlightAllToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
highlightAllToggle.Parent = espSection
local highlightAllPlayers = true

-- Highlight Function (Excludes cosmetic parts)
local function highlightPlayer(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        -- Only highlight essential parts (Head, Torso, Arms, and Legs)
        local highlight = player.Character:FindFirstChild("Highlight")
        if not highlight then
            highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillTransparency = 0.5
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineTransparency = 0
        end
        
        -- Highlight the core body parts
        local bodyParts = {"Head", "UpperTorso", "LowerTorso", "LeftArm", "RightArm", "LeftLeg", "RightLeg"}
        for _, partName in ipairs(bodyParts) do
            local part = player.Character:FindFirstChild(partName)
            if part then
                part.Highlight = highlight
            end
        end
        
        -- Exclude cosmetic parts (hats, faces, accessories, etc.)
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("Accessory") or part.Name:match("Face") then
                part.Highlight = nil -- Do not highlight cosmetic parts
            end
        end
    end
end

-- Remove Highlight Function
local function removeHighlight(player)
    if player.Character and player.Character:FindFirstChild("Highlight") then
        player.Character.Highlight:Destroy()
    end
end

-- Button Click Handlers
aimAssistToggle.MouseButton1Click:Connect(function()
    aimAssistEnabled = not aimAssistEnabled
    aimAssistToggle.Text = aimAssistEnabled and "Disable Aim Assist" or "Enable Aim Assist"
end)

autoAimToggle.MouseButton1Click:Connect(function()
    autoAimEnabled = not autoAimEnabled
    autoAimToggle.Text = autoAimEnabled and "Disable Auto Aim" or "Enable Auto Aim"
end)

highlightAllToggle.MouseButton1Click:Connect(function()
    highlightAllPlayers = not highlightAllPlayers
    highlightAllToggle.Text = highlightAllPlayers and "Disable Highlight All" or "Enable Highlight All"
end)

unloadTabButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    game:GetService("CoreGui"):FindFirstChild("RobloxGui"):ClearAllChildren()
end)

-- Tab Switching Logic
aimbotTabButton.MouseButton1Click:Connect(function()
    aimbotSection.Visible = true
    espSection.Visible = false
    unloadSection.Visible = false
end)

espTabButton.MouseButton1Click:Connect(function()
    aimbotSection.Visible = false
    espSection.Visible = true
    unloadSection.Visible = false
end)

unloadTabButton.MouseButton1Click:Connect(function()
    aimbotSection.Visible = false
    espSection.Visible = false
    unloadSection.Visible = true
end)

-- Aiming Logic
local isAiming = false

userInputService.InputBegan:Connect(function(input)
    if input.UserInputType == selectedOption.input then
        isAiming = true
    end
end)

userInputService.InputEnded:Connect(function(input)
    if input.UserInputType == selectedOption.input then
        isAiming = false
    end
end)

-- Main Loop (ESP Highlighting & Aimbot Logic)
runService.Heartbeat:Connect(function()
    -- ESP Logic
    if highlightAllPlayers then
        for _, enemy in ipairs(game.Players:GetPlayers()) do
            if enemy ~= player then
                highlightPlayer(enemy)  -- Apply highlight to all players except self
            end
        end
    else
        for _, enemy in ipairs(game.Players:GetPlayers()) do
            if enemy ~= player then
                removeHighlight(enemy)  -- Remove highlight if ESP is disabled
            end
        end
    end

    -- Aimbot Logic (Auto Aim & Aim Assist)
    if (autoAimEnabled or (aimAssistEnabled and isAiming)) and player.Character then
        local closestEnemy = nil
        local closestDistance = math.huge
        
        for _, enemy in ipairs(game.Players:GetPlayers()) do
            if enemy ~= player and enemy.Character and enemy.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (player.Character.HumanoidRootPart.Position - enemy.Character.HumanoidRootPart.Position).Magnitude
                if distance < closestDistance then
                    closestDistance = distance
                    closestEnemy = enemy
                end
            end
        end
        
        if closestEnemy then
            camera.CFrame = CFrame.new(camera.CFrame.Position, closestEnemy.Character.HumanoidRootPart.Position)
        end
    end
end)

-- Toggle GUI visibility with Insert key
userInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Insert then
        mainWindow.Visible = not mainWindow.Visible
    end
end)

-- Make window draggable
local dragging = false
local dragInput, dragStart, startPos

mainWindow.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainWindow.Position
    end
end)

mainWindow.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainWindow.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

mainWindow.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
