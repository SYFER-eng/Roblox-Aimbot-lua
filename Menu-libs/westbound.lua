if not game.CoreGui:FindFirstChild('PScreen') then
    local tweenService = game:GetService('TweenService')
    local library = {}

    library.UICorner = function(radius, instance)
        local uiCorner = Instance.new('UICorner', instance)
        uiCorner.CornerRadius = UDim.new(0, radius)
    end

    library.Warn = function(title, desc)
        local warnFrame = Instance.new('Frame')
        local image = Instance.new('ImageLabel')
        local titleLabel = Instance.new('TextLabel')
        local descLabel = Instance.new('TextLabel')

        warnFrame.Name = 'WarnFrame'
        warnFrame.BackgroundColor3 = Color3.new(0.101961, 0.101961, 0.101961)
        warnFrame.BorderSizePixel = 0
        warnFrame.Position = UDim2.new(0, -300, 0, 3)
        warnFrame.Size = UDim2.new(0, 220, 0, 53)
        library.UICorner(4, warnFrame)

        image.Name = 'Image'
        image.Parent = warnFrame
        image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        image.BackgroundTransparency = 1
        image.BorderSizePixel = 0
        image.Position = UDim2.new(0, 0, -0.0754716992, 0)
        image.Size = UDim2.new(0, 29, 0, 29)
        image.Image = 'rbxassetid://3944704135'
        image.ScaleType = Enum.ScaleType.Fit

        titleLabel.Name = 'Title'
        titleLabel.Parent = warnFrame
        titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        titleLabel.BackgroundTransparency = 1
        titleLabel.BorderSizePixel = 0
        titleLabel.Position = UDim2.new(0.168181822, 0, 0, 0)
        titleLabel.Size = UDim2.new(0, 183, 0, 21)
        titleLabel.Font = Enum.Font.GothamSemibold
        titleLabel.Text = title
        titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        titleLabel.TextSize = 17
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left

        descLabel.Name = 'Desc'
        descLabel.Parent = warnFrame
        descLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        descLabel.BackgroundTransparency = 1
        descLabel.BorderSizePixel = 0
        descLabel.Position = UDim2.new(0.0136363637, 0, 0.396226406, 0)
        descLabel.Size = UDim2.new(0, 214, 0, 30)
        descLabel.Font = Enum.Font.Gotham
        descLabel.Text = desc
        descLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        descLabel.TextSize = 14
        descLabel.TextWrapped = true
        descLabel.TextXAlignment = Enum.TextXAlignment.Left
        descLabel.TextYAlignment = Enum.TextYAlignment.Top

        tweenService:Create(warnFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Position = UDim2.new(0, 3, 0, 3)}):Play()
        wait(2)
        tweenService:Create(warnFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0, -300, 0, 3)}):Play()
    end

    function library:Main()
        local screen = Instance.new('ScreenGui', game.CoreGui)
        local panelContainer = Instance.new('Frame')
        local panel = Instance.new('Frame')
        local tabScrollContainer = Instance.new('Frame')
        local tabContainer = Instance.new('ScrollingFrame')
        local contentScrollContainer = Instance.new('Frame')
        local contentContainer = Instance.new('Frame')
        local uiPadding = Instance.new('UIPadding')
        local uiListLayout = Instance.new('UIListLayout')

        screen.Name = 'PScreen'
        panelContainer.Name = 'PanelContainer'
        panel.Name = 'Panel'
        tabScrollContainer.Name = 'TabScrollContainer'
        tabContainer.Name = 'TabContainer'
        contentScrollContainer.Name = 'ContentScrollContainer'
        contentContainer.Name = 'ContentContainer'
        uiPadding.Parent = tabContainer
        uiListLayout.Parent = tabContainer

        self.PanelContainer = panelContainer
        self.Panel = panel
        self.ContentContainer = contentScrollContainer
        self.TabContainer = tabContainer
        self.ContentScrollContainer = contentContainer

        panelContainer.BackgroundColor3 = Color3.new(0.0352941, 0.0352941, 0.0352941)
        panelContainer.BorderSizePixel = 0
        panelContainer.Position = UDim2.new(0, 3, 0, 3)
        panelContainer.Size = UDim2.new(0, 353, 0, 206)
        library.UICorner(4, panelContainer)

        panel.BackgroundColor3 = Color3.fromRGB(1, 0, 0)
        panel.BorderSizePixel = 0
        panel.Position = UDim2.new(0, 3, 0, 3)
        panel.Size = UDim2.new(0, 126, 0, 200)
        library.UICorner(4, panel)

        contentScrollContainer.BackgroundColor3 = Color3.fromRGB(0.0941176, 0.0941176, 0.0941176)
        contentScrollContainer.BorderSizePixel = 0
        contentScrollContainer.Position = UDim2.new(0, 130, 0, 0)
        contentScrollContainer.Size = UDim2.new(0, 217, 0, 200)
        contentScrollContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
        contentScrollContainer.ClipsDescendants = true
        library.UICorner(4, contentScrollContainer)

        tabScrollContainer.BackgroundColor3 = Color3.fromRGB(0.0588235, 0.0588235, 0.0588235)
        tabScrollContainer.BorderSizePixel = 0
        tabScrollContainer.Position = UDim2.new(0, 3, 0, 3)
        tabScrollContainer.Size = UDim2.new(0, 120, 0, 194)
        library.UICorner(4, tabScrollContainer)

        tabContainer.BackgroundColor3 = Color3.fromRGB(0.0941176, 0.0941176, 0.0941176)
        tabContainer.BorderSizePixel = 0
        tabContainer.Position = UDim2.new(0, 3, 0, 3)
        tabContainer.Size = UDim2.new(0, 120, 0, 194)
        tabContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
        tabContainer.ScrollBarThickness = 0
        library.UICorner(4, tabContainer)

        uiPadding.PaddingLeft = UDim.new(0, 6)
        uiPadding.PaddingTop = UDim.new(0, 2)

        uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        uiListLayout.Padding = UDim.new(0, 1)

        local dragInput, dragStart, startPos

        local dragging = false

        function panel:StartDrag(mouse)
            dragging = true
            dragStart = mouse.Position - panel.Position
        end

        function panel:StopDrag()
            dragging = false
        end

        function panel:UpdateDrag(mouse)
            if dragging then
                local delta = mouse.Position - dragStart
                panel.Position = UDim2.new(0, delta.X, 0, delta.Y)
            end
        end

        panel.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragStart = input.Position
                dragging = true
            end
        end)

        panel.InputEnded:Connect(function()
            dragging = false
        end)

        panel.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
                self:UpdateDrag(input)
            end
        end)

        panelContainer.InputBegan:Connect(panel.StartDrag)
        panelContainer.InputEnded:Connect(panel.StopDrag)
        panelContainer.InputChanged:Connect(panel.UpdateDrag)

        return self
    end

    function library:CreateButton(name, callback)
        local button = Instance.new('TextButton')
        button.Name = name
        button.Parent = self.ContentScrollContainer
        button.BackgroundColor3 = Color3.fromRGB(0.031372549, 0.031372549, 0.031372549)
        button.BorderSizePixel = 0
        button.Position = UDim2.new(0, 3, 0, 0)
        button.Size = UDim2.new(0, 195, 0, 20)
        button.Font = Enum.Font.Gotham
        button.Text = name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 14

        button.MouseButton1Down:Connect(function()
            callback()
        end)

        return button
    end

    function library:CreateSlider(name, minValue, maxValue, defaultValue, step, callback)
        local sliderContainer = Instance.new('Frame')
        sliderContainer.Name = name
        sliderContainer.Parent = self.ContentScrollContainer
        sliderContainer.BackgroundColor3 = Color3.fromRGB(0.0588235, 0.0588235, 0.0588235)
        sliderContainer.BorderSizePixel = 0
        sliderContainer.Position = UDim2.new(0, 3, 0, 3)
        sliderContainer.Size = UDim2.new(0, 188, 0, 17)
        library.UICorner(4, sliderContainer)

        local slider = Instance.new('Slider')
        slider.Parent = sliderContainer
        slider.BackgroundColor3 = Color3.fromRGB(0.015686275, 0.015686275, 0.015686275)
        slider.BorderSizePixel = 0
        slider.Position = UDim2.new(0, 0, 0, 0)
        slider.Size = UDim2.new(0, 188, 0, 10)
        slider.Minimum = minValue
        slider.Maximum = maxValue
        slider.Value = defaultValue
        slider.Step = step
        slider.ValueChanged:Connect(function()
            callback(slider.Value)
        end)

        local label = Instance.new('TextLabel')
        label.Parent = sliderContainer
        label.BackgroundColor3 = Color3.fromRGB(0.0588235, 0.0588235, 0.0588235)
        label.BorderSizePixel = 0
        label.Position = UDim2.new(0, 0, 0, 0)
        label.Size = UDim2.new(0, 188, 0, 20)
        label.Font = Enum.Font.Gotham
        label.Text = string.format('%s: %s', name, tostring(defaultValue))
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left

        return sliderContainer
    end

    function library:CreateDropdown(name, options, callback)
        local dropdownContainer = Instance.new('Frame')
        dropdownContainer.Name = name
        dropdownContainer.Parent = self.ContentScrollContainer
        dropdownContainer.BackgroundColor3 = Color3.fromRGB(0.0588235, 0.0588235, 0.0588235)
        dropdownContainer.BorderSizePixel = 0
        dropdownContainer.Position = UDim2.new(0, 3, 0, 3)
        dropdownContainer.Size = UDim2.new(0, 188, 0, 34)
        library.UICorner(4, dropdownContainer)

        local label = Instance.new('TextLabel')
        label.Parent = dropdownContainer
        label.BackgroundColor3 = Color3.fromRGB(0.0588235, 0.0588235, 0.0588235)
        label.BorderSizePixel = 0
        label.Position = UDim2.new(0, 0, 0, 0)
        label.Size = UDim2.new(0, 188, 0, 17)
        label.Font = Enum.Font.Gotham
        label.Text = name
        label.TextColor3 = Color3.fromRGB(255, 255, 255)
        label.TextSize = 14
        label.TextXAlignment = Enum.TextXAlignment.Left

        local dropdownOn = Instance.new('Frame')
        dropdownOn.Parent = dropdownContainer
        dropdownOn.BackgroundColor3 = Color3.fromRGB(0.0941176, 0.0941765, 0.0980392)
        dropdownOn.BorderSizePixel = 0
        dropdownOn.Position = UDim2.new(0, 0, 0, 17)
        dropdownOn.Size = UDim2.new(0, 188, 0, 20)
        library.UICorner(4, dropdownOn)

        local arrow = Instance.new('TextButton')
        arrow.Parent = dropdownOn
        arrow.BackgroundColor3 = Color3.fromRGB(0.0941176, 0.0941176, 0.0941176)
        arrow.BorderSizePixel = 0
        arrow.Position = UDim2.new(0.886699557, 0, 0, 0)
        arrow.Size = UDim2.new(0, 34, 0, 20)
        arrow.Font = Enum.Font.Gotham
        arrow.Text = "+"
        arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
        arrow.TextSize = 14
        arrow.TextXAlignment = Enum.TextXAlignment.Right

        local scrollContainer = Instance.new("Frame")
        scrollContainer.Parent = dropdownContainer
        scrollContainer.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
        scrollContainer.BorderSizePixel = 0
        scrollContainer.Position = UDim2.new(0, 0, 0.194174752, 0)
        scrollContainer.Size = UDim2.new(0, 188, 0, 80)
        scrollContainer.Visible = false
        library.UICorner(4, scrollContainer)

        local uiListLayout = Instance.new("UIListLayout")
        uiListLayout.Parent = scrollContainer
        uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        for i, v in ipairs(options.items) do
            local contentItem = Instance.new("TextButton")
            contentItem.Parent = scrollContainer
            contentItem.BackgroundColor3 = Color3.fromRGB(0.0588235, 0.0588235, 0.0588235)
            contentItem.BackgroundTransparency = 1
            contentItem.BorderSizePixel = 0
            contentItem.Size = UDim2.new(0, 188, 0, 17)
            contentItem.Font = Enum.Font.Gotham
            contentItem.Text = v
            contentItem.TextColor3 = Color3.fromRGB(255, 255, 255)
            contentItem.TextSize = 14
            contentItem.TextTransparency = 1
            library.UICorner(4, contentItem)

            contentItem.MouseButton1Down:Connect(function()
                local selected = false
                for i, item in ipairs(scrollContainer:GetChildren()) do
                    if item:IsA('TextButton') then
                        item.TextTransparency = 1
                        selected = true
                    end
                end
                if selected then
                    tweenService:Create(dropDownOn, TweenInfo.new(0.2), {Size = UDim2.new(0, 203, 0, 20)}):Play()
                    tweenService:Create(scrollContainer, TweenInfo.new(0.2), {CanvasSize = scrollContainer.CanvasSize - UDim2.new(0, 0, 0, 107)}):Play()
                    scrollContainer.Visible = false
                else
                    tweenService:Create(dropDownOn, TweenInfo.new(0.2), {Size = UDim2.new(0, 203, 0, 103)}):Play()
                    tweenService:Create(scrollContainer, TweenInfo.new(0.2), {CanvasSize = scrollContainer.CanvasSize + UDim2.new(0, 0, 0, 107)}):Play()
                    scrollContainer.Visible = true
                end
                if callback then
                    callback(v)
                end
            end)
        end

        return dropdownContainer
    end

    function library:CreateSection(name, callback)
        local sectionContainer = Instance.new('Frame')
        sectionContainer.Name = name
        sectionContainer.Parent = self.Panel
        sectionContainer.BackgroundColor3 = Color3.fromRGB(0.0313725, 0.0313725, 0.0313725)
        sectionContainer.BorderSizePixel = 0
        sectionContainer.Position = UDim2.new(0, 3, 0, 0)
        sectionContainer.Size = UDim2.new(0, 120, 0, 200)
        library.UICorner(4, sectionContainer)

        local sectionHeading = Instance.new('TextLabel')
        sectionHeading.Parent = sectionContainer
        sectionHeading.BackgroundColor3 = Color3.fromRGB(0.0313725, 0.0313725, 0.0313725)
        sectionHeading.BorderSizePixel = 0
        sectionHeading.Position = UDim2.new(0, 0, 0, 0)
        sectionHeading.Size = UDim2.new(0, 120, 0, 17)
        sectionHeading.Font = Enum.Font.Gotham
        sectionHeading.Text = name
        sectionHeading.TextColor3 = Color3.fromRGB(255, 255, 255)
        sectionHeading.TextSize = 14
        sectionHeading.TextXAlignment = Enum.TextXAlignment.Left

        local sectionBody = Instance.new('Frame')
        sectionBody.Parent = sectionContainer
        sectionBody.BackgroundColor3 = Color3.fromRGB(0.0941176, 0.0941176, 0.0980392)
        sectionBody.BorderSizePixel = 0
        sectionBody.Position = UDim2.new(0, 0, 0, 17)
        sectionBody.Size = UDim2.new(0, 120, 0, 200)
        library.UICorner(4, sectionBody)

        local sectionContent = Instance.new('Frame')
        sectionContent.Parent = sectionBody
        sectionContent.BackgroundColor3 = Color3.fromRGB(0.0313725, 0.0313725, 0.0313725)
        sectionContent.BorderSizePixel = 0
        sectionContent.Position = UDim2.new(0, 0, 0, 17)
        sectionContent.Size = UDim2.new(0, 120, 0, 183)
        library.UICorner(4, sectionContent)

        local uiListLayout = Instance.new("UIListLayout")
        uiListLayout.Parent = sectionBody
        uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        local content = {}
        content.CanvasSize = UDim2.new(0, 120, 0, 0)

        local function addItem(text)
            local item = Instance.new("TextButton")
            item.Parent = sectionBody
            item.BackgroundColor3 = Color3.fromRGB(0.0313725, 0.0313725, 0.0313725)
            item.BorderSizePixel = 0
            item.Size = UDim2.new(0, 120, 0, 17)
            item.Font = Enum.Font.Gotham
            item.Text = text
            item.TextColor3 = Color3.fromRGB(255, 255, 255)
            item.TextSize = 14
            item.TextXAlignment = Enum.TextXAlignment.Left
            item.MouseButton1Down:Connect(function()
                callback(text)
            end)
            library.UICorner(4, item)
            content.CanvasSize = content.CanvasSize + UDim2.new(0, 0, 0, 17)
            return item
        end

        return {
            Content = content,
            AddItem = addItem
        }
    end

    function library:CreateSetting(name, content)
        local settingContainer = Instance.new('Frame')
        settingContainer.Name = name
        settingContainer.Parent = self.ContentScrollContainer
        settingContainer.BackgroundColor3 = Color3.fromRGB(0.0588235, 0.0588235, 0.0588235)
        settingContainer.BorderSizePixel = 0
        settingContainer.Position = UDim2.new(0, 0, 0, 3)
        settingContainer.Size = UDim2.new(0, 217, 0, 30)
        library.UICorner(4, settingContainer)

        local settingText = Instance.new('TextLabel')
        settingText.Parent = settingContainer
        settingText.BackgroundColor3 = Color3.fromRGB(0.0588235, 0.0588235, 0.0588235)
        settingText.BorderSizePixel = 0
        settingText.Position = UDim2.new(0, 0, 0, 0)
        settingText.Size = UDim2.new(0, 217, 0, 30)
        settingText.Font = Enum.Font.Gotham
        settingText.Text = name
        settingText.TextColor3 = Color3.fromRGB(255, 255, 255)
        settingText.TextSize = 14
        settingText.TextXAlignment = Enum.TextXAlignment.Left

        content.CanvasSize = UDim2.new(0, 0, 0, 0)

        local uiPadding = Instance.new('UIPadding')
        uiPadding.Parent = settingContainer
        uiPadding.PaddingLeft = UDim.new(0, 15)
        uiPadding.PaddingRight = UDim.new(0, 15)
        uiPadding.PaddingTop = UDim.new(0, 0)
        uiPadding.PaddingBottom = UDim.new(0, 0)

        local uiListLayout = Instance.new("UIListLayout")
        uiListLayout.Parent = settingContainer
        uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        uiListLayout.Padding = UDim.new(0, 0, 0, 0)

        for i, v in ipairs(content) do
            local contentItem = Instance.new("TextButton")
            contentItem.Parent = settingContainer
            contentItem.BackgroundColor3 = Color3.fromRGB(0.0313725, 0.0313725, 0.0313725)
            contentItem.BorderSizePixel = 0
            contentItem.Size = UDim2.new(0, 188, 0, 17)
            contentItem.Font = Enum.Font.Gotham
            contentItem.Text = v
            contentItem.TextColor3 = Color3.fromRGB(255, 255, 255)
            contentItem.TextSize = 14
            contentItem.TextTransparency = 1
            contentItem.TextXAlignment = Enum.TextXAlignment.Left
            contentItem.MouseButton1Down:Connect(function()
                tweenService:Create(dropDownOn, TweenInfo.new(0.2), {Size = UDim2.new(0, 203, 0, 20)}):Play()
                tweenService:Create(scrollContainer, TweenInfo.new(0.2), {CanvasSize = scrollContainer.CanvasSize - UDim2.new(0, 0, 0, 107)}):Play()
                scrollContainer.Visible = false
            end)
            library.UICorner(4, contentItem)
            content.CanvasSize = content.CanvasSize + UDim2.new(0, 0, 0, 17)
        end

        return settingContainer
    end

    return library
end
