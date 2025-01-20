if game.CoreGui:FindFirstChild('PScreen') then game.CoreGui.PScreen:Destroy() end

local tweenService = game:GetService('TweenService')

local library = {}

library.UICorner = function(a, b) 
	local _instance = Instance.new('UICorner', b)
	_instance.CornerRadius = UDim.new(0, a)
end

library.Warn = function(title, desc)
	local screen = Instance.new('ScreenGui')
	
	local WarnFrame = Instance.new("Frame")
	WarnFrame.Name = "WarnFrame"
	WarnFrame.Parent = screen
	WarnFrame.BackgroundColor3 = Color3.new(0.101961, 0.101961, 0.101961)
	WarnFrame.BorderSizePixel = 0
	WarnFrame.Position = UDim2.new(0, -300, 0, 3)
	WarnFrame.Size = UDim2.new(0, 220, 0, 53)
	library.UICorner(4, WarnFrame)

	local Image = Instance.new("ImageLabel")
	Image.Name = "Image"
	Image.Parent = WarnFrame
	Image.BackgroundColor3 = Color3.new(1, 1, 1)
	Image.BackgroundTransparency = 1
	Image.BorderSizePixel = 0
	Image.Position = UDim2.new(0, 0, -0.0754716992, 0)
	Image.Size = UDim2.new(0, 29, 0, 29)
	Image.Image = "rbxassetid://3944704135"
	Image.ScaleType = Enum.ScaleType.Fit

	local Title = Instance.new("TextLabel")
	Title.Name = "Title"
	Title.Parent = WarnFrame
	Title.BackgroundColor3 = Color3.new(1, 1, 1)
	Title.BackgroundTransparency = 1
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.168181822, 0, 0, 0)
	Title.Size = UDim2.new(0, 183, 0, 21)
	Title.Font = Enum.Font.GothamSemibold
	Title.Text = title
	Title.TextColor3 = Color3.new(1, 1, 1)
	Title.TextSize = 17
	Title.TextXAlignment = Enum.TextXAlignment.Left

	local Desc = Instance.new("TextLabel")
	Desc.Name = "Desc"
	Desc.Parent = WarnFrame
	Desc.BackgroundColor3 = Color3.new(1, 1, 1)
	Desc.BackgroundTransparency = 1
	Desc.BorderSizePixel = 0
	Desc.Position = UDim2.new(0.0136363637, 0, 0.396226406, 0)
	Desc.Size = UDim2.new(0, 214, 0, 30)
	Desc.Font = Enum.Font.Gotham
	Desc.Text = desc
	Desc.TextColor3 = Color3.new(1, 1, 1)
	Desc.TextSize = 14
	Desc.TextWrapped = true
	Desc.TextXAlignment = Enum.TextXAlignment.Left
	Desc.TextYAlignment = Enum.TextYAlignment.Top

	tweenService:Create(WarnFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 3, 0, 3)}):Play()
	wait(2)
	tweenService:Create(WarnFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0, -300, 0, 3)}):Play()
	wait(0.5)
	screen:Destroy()
end

function library:Main()
    local main = {}
    local screen = Instance.new('ScreenGui')
    screen.Name = 'PScreen'

    local PanelContainer = Instance.new("Frame")
    PanelContainer.Name = "PanelContainer"
    PanelContainer.Parent = screen
    PanelContainer.BackgroundColor3 = Color3.new(0.0352941, 0.0352941, 0.0352941)
    PanelContainer.BorderSizePixel = 0
    PanelContainer.Position = UDim2.new(0, 3, 0, 3)
    PanelContainer.Size = UDim2.new(0, 353, 0, 206)
    library.UICorner(4, PanelContainer)

    local Panel = Instance.new("Frame")
    Panel.Name = "Panel"
    Panel.Parent = PanelContainer
    Panel.BackgroundColor3 = Color3.new(0.0941176, 0.0941176, 0.0941176)
    Panel.BorderSizePixel = 0
    Panel.Position = UDim2.new(0, 3, 0, 3)
    Panel.Size = UDim2.new(0, 120, 0, 194)
    library.UICorner(4, Panel)

    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Parent = PanelContainer
    ContentContainer.BackgroundColor3 = Color3.new(0.0941176, 0.0941176, 0.0941176)
    ContentContainer.BorderSizePixel = 0
    ContentContainer.Position = UDim2.new(0, 130, 0, 3)
    ContentContainer.Size = UDim2.new(0, 217, 0, 200)
    library.UICorner(4, ContentContainer)

    local ContentScrollContainer = Instance.new("ScrollingFrame")
    ContentScrollContainer.Name = "ContentScrollContainer"
    ContentScrollContainer.Parent = ContentContainer
    ContentScrollContainer.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
    ContentScrollContainer.BorderSizePixel = 0
    ContentScrollContainer.Position = UDim2.new(0, 3, 0, 3)
    ContentScrollContainer.Size = UDim2.new(0, 211, 0, 194)
    ContentScrollContainer.ScrollBarThickness = 0
    ContentScrollContainer.CanvasSize = UDim2.new(0, 0, 0, 0)

    local TabScrollContainer = Instance.new("Frame")
    TabScrollContainer.Name = "TabScrollContainer"
    TabScrollContainer.Parent = Panel
    TabScrollContainer.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
    TabScrollContainer.BorderSizePixel = 0
    TabScrollContainer.Position = UDim2.new(0, 3, 0, 3)
    TabScrollContainer.Size = UDim2.new(0, 120, 0, 194)
    library.UICorner(4, TabScrollContainer)

    local TabContainer = Instance.new("ScrollingFrame")
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = TabScrollContainer
    TabContainer.Active = true
    TabContainer.BackgroundColor3 = Color3.new(1, 0, 0)
    TabContainer.BackgroundTransparency = 1
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0, 3, 0, 3)
    TabContainer.Size = UDim2.new(0, 120, 0, 194)
    TabContainer.ScrollBarThickness = 0
    library.UICorner(4, TabContainer)

    local UIPadding_2 = Instance.new("UIPadding")
    UIPadding_2.Parent = TabContainer
    UIPadding_2.PaddingLeft = UDim.new(0, 6)
    UIPadding_2.PaddingTop = UDim.new(0, 2)

    local UIListLayout_3 = Instance.new("UIListLayout")
    UIListLayout_3.Parent = TabContainer
    UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_3.Padding = UDim.new(0, 1)

    local UIPadding = Instance.new("UIPadding")
    UIPadding.Parent = ContentScrollContainer
    UIPadding.PaddingBottom = UDim.new(0, 2)

    local function createTab(name, options, callback)
        local tab = Instance.new("Frame")
        tab.Name = name
        tab.Parent = TabContainer
        tab.BackgroundColor3 = Color3.new(1, 0, 0)
        tab.BackgroundTransparency = 1
        tab.BorderSizePixel = 0
        tab.Position = UDim2.new(0, 0, UIListLayout_3.AbsoluteContentSize.Y.Offset + 20, 0)
        tab.Size = UDim2.new(0, 120, 0, 18)
        library.UICorner(4, tab)

        local Text = Instance.new("TextButton")
        Text.Parent = tab
        Text.BackgroundColor3 = Color3.new(1, 1, 1)
        Text.BackgroundTransparency = 1
        Text.BorderSizePixel = 0
        Text.Position = UDim2.new(0, 0, 0, 0)
        Text.Size = UDim2.new(0, 120, 0, 18)
        Text.Font = Enum.Font.Gotham
        Text.Text = name
        Text.TextColor3 = Color3.new(0.898039, 0.898039, 0.898039)
        Text.TextSize = 14
        Text.TextXAlignment = Enum.TextXAlignment.Center

        local Content = Instance.new("Frame")
        Content.Name = "Content"
        Content.Parent = ContentScrollContainer
        Content.BackgroundColor3 = Color3.new(1, 1, 1)
        Content.BackgroundTransparency = 1
        Content.Position = UDim2.new(0, 0, UIPadding.AbsoluteContentSize.Y.Offset + 20, 0)
        Content.Size = UDim2.new(0, 211, 0, 100)
        Content.CanvasSize = UDim2.new(0, 0, 0, 0)
        Content.Visible = false

        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = Content
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 2)

        local section = options and options.section

        if section then
            for _, sectionName in pairs(section) do
                local sectionFrame = Instance.new("Frame")
                sectionFrame.Parent = Content
                sectionFrame.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
                sectionFrame.Size = UDim2.new(0, 180, 0, 20)
                library.UICorner(4, sectionFrame)
                sectionFrame.Position = UDim2.new(0, 0, UIListLayout.AbsoluteContentSize.Y.Offset + 20, 0)

                local SectionText = Instance.new("TextButton")
                SectionText.Parent = sectionFrame
                SectionText.BackgroundColor3 = Color3.new(1, 1, 1)
                SectionText.BackgroundTransparency = 1
                SectionText.BorderSizePixel = 0
                SectionText.Position = UDim2.new(0, 0, 0, 0)
                SectionText.Size = UDim2.new(0, 180, 0, 20)
                SectionText.Font = Enum.Font.GothamSemibold
                SectionText.Text = sectionName
                SectionText.TextColor3 = Color3.new(1, 1, 1)
                SectionText.TextSize = 14
                SectionText.TextXAlignment = Enum.TextXAlignment.Left

                local scrollContainer = Instance.new("Frame")
                scrollContainer.Parent = Content
                scrollContainer.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
                scrollContainer.BorderSizePixel = 0
                scrollContainer.Position = UDim2.new(0, 0, UIListLayout.AbsoluteContentSize.Y.Offset + 40, 0)
                scrollContainer.Size = UDim2.new(0, 211, 0, 150)
                scrollContainer.Visible = false
                library.UICorner(4, scrollContainer)

                local UIPadding_3 = Instance.new("UIPadding")
                UIPadding_3.Parent = scrollContainer
                UIPadding_3.PaddingLeft = UDim.new(0, 2)
                UIPadding_3.PaddingTop = UDim.new(0, 3)
                UIPadding_3.PaddingRight = UDim.new(0, 2)
                UIPadding_3.PaddingBottom = UDim.new(0, 3)

                local UIListLayout = Instance.new("UIListLayout")
                UIListLayout.Parent = scrollContainer
                UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout.Padding = UDim.new(0, 0, 0, 0)
                UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
                UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

                local items = options[sectionName]
                for _, itemName in pairs(items) do
                    local item = Instance.new("Frame")
                    item.Parent = scrollContainer
                    item.BackgroundColor3 = Color3.new(1, 1, 1)
                    item.BackgroundTransparency = 1
                    item.BorderSizePixel = 0
                    item.Position = UDim2.new(0, 0, UIListLayout.AbsoluteContentSize.Y.Offset + 20, 0)
                    item.Size = UDim2.new(0, 180, 0, 20)
                    item.Name = "Item"

                    local Text = Instance.new("TextButton")
                    Text.Parent = item
                    Text.BackgroundColor3 = Color3.new(1, 1, 1)
                    Text.BackgroundTransparency = 1
                    Text.BorderSizePixel = 0
                    Text.Position = UDim2.new(0, 0, 0, 0)
                    Text.Size = UDim2.new(0, 180, 0, 20)
                    Text.Font = Enum.Font.Gotham
                    Text.Text = itemName
                    Text.TextColor3 = Color3.new(0.898039, 0.898039, 0.898039)
                    Text.TextSize = 14
                    Text.TextXAlignment = Enum.TextXAlignment.Left

                    library.UICorner(4, item)
                    
                    if callback then
                        Text.MouseButton1Down:Connect(function()
                            callback(sectionName, itemName)
                        end)
                    end
                end

                SectionText.MouseButton1Down:Connect(function()
                    scrollContainer.Visible = not scrollContainer.Visible
                    Content.CanvasSize = Content.CanvasSize + UDim2.new(0, 0, 0, 130)
                end)
            end
        else
            for i,option in ipairs(options) do
                local item = Instance.new("Frame")
                item.Parent = Content
                item.BackgroundColor3 = Color3.new(1, 1, 1)
                item.BackgroundTransparency = 0.9
                item.BorderSizePixel = 0
                item.Position = UDim2.new(0, 0, UIListLayout.AbsoluteContentSize.Y.Offset + (20 * i) + 20, 0)
                item.Size = UDim2.new(0, 180, 0, 20)
                item.Name = "Item"
                library.UICorner(4, item)

                local Text = Instance.new("TextButton")
                Text.Parent = item
                Text.BackgroundColor3 = Color3.new(1, 1, 1)
                Text.BackgroundTransparency = 1
                Text.BorderSizePixel = 0
                Text.Position = UDim2.new(0, 0, 0, 0)
                Text.Size = UDim2.new(0, 180, 0, 20)
                Text.Font = Enum.Font.Gotham
                Text.Text = option
                Text.TextColor3 = Color3.new(0.898039, 0.898039, 0.898039)
                Text.TextSize = 14
                Text.TextXAlignment = Enum.TextXAlignment.Left

                if callback then
                    Text.MouseButton1Down:Connect(function()
                        callback(option)
                    end)
                end
            end
        end

        UIListLayout.Parent = Content
    end

    ContentScrollContainer.CanvasSize = UIListLayout.AbsoluteContentSize
    UIListLayout:CalculateCanvasSize()

    for i, tabButton in ipairs(tabContainer:GetChildren()) do
        if tabButton.Name == "Button" then
            tabButton.MouseButton1Down:Connect(function()
                for _, v in ipairs(tabContainer:GetChildren()) do
                    if v.Name == "Button" and v ~= tabButton then
                        v.BackgroundTransparency = 1
                    end
                end
                tabButton.BackgroundTransparency = 0
                local section = options[tabButton.Text]
                if section then
                    local scrollContainer = ContentScrollContainer:FindFirstChild(tabButton.Text)
                    if scrollContainer then
                        scrollContainer.Visible = not scrollContainer.Visible
                        Content.CanvasSize = Content.CanvasSize + UDim2.new(0, 0, 0, 130)
                    else
                        local sectionFrame = self:CreateSection(section)
                        sectionFrame.Position = UDim2.new(0, 0, UIListLayout.AbsoluteContentSize.Y.Offset + (20 * i) + 20, 0)
                        UIListLayout:Add(sectionFrame)
                    end
                else
                    ContentScrollContainer.Visible = false
                end
            end)
        end
    end

    local tabFrame = Instance.new("Frame")
    tabFrame.Parent = Panel
    tabFrame.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
    tabFrame.BorderSizePixel = 0
    tabFrame.Position = UDim2.new(0, 0, 0, 0)
    tabFrame.Size = UDim2.new(0, 120, 0, 20)
    library.UICorner(4, tabFrame)

    local UIPadding = Instance.new("UIPadding")
    UIPadding.Parent = tabFrame
    UIPadding.PaddingLeft = UDim.new(0, 6)
    UIPadding.PaddingTop = UDim.new(0, 2)
    UIPadding.PaddingRight = UDim.new(0, 6)
    UIPadding.PaddingBottom = UDim.new(0, 2)

    local tabButton = Instance.new("TextButton")
    tabButton.Parent = tabFrame
    tabButton.BackgroundColor3 = Color3.new(1, 1, 1)
    tabButton.BackgroundTransparency = 1
    tabButton.BorderSizePixel = 0
    tabButton.Position = UDim2.new(0, 0, 0, 0)
    tabButton.Size = UDim2.new(0, 110, 0, 20)
    tabButton.Font = Enum.Font.Gotham
    tabButton.Text = "Settings"
    tabButton.TextColor3 = Color3.new(0.898039, 0.898039, 0.898039)
    tabButton.TextSize = 14
    tabButton.TextXAlignment = Enum.TextXAlignment.Left
    tabButton.Name = "Button"
    tabButton.MouseButton1Down:Connect(function()
        ContentScrollContainer.Visible = false
        for _, v in ipairs(tabContainer:GetChildren()) do
            if v.Name == "Button" then
                v.BackgroundTransparency = 1
            end
        end
        tabButton.BackgroundTransparency = 0
    end)

    local tabContainer = Instance.new("Frame")
    tabContainer.Parent = tabFrame
    tabContainer.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
    tabContainer.BorderSizePixel = 0
    tabContainer.Position = UDim2.new(0, 0, 0, 0)
    tabContainer.Size = UDim2.new(0, 110, 0, 20)
    library.UICorner(4, tabContainer)

    return screen
end

return library
