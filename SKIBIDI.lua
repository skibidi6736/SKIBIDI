local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- Biến lưu vị trí cũ
local lastPosition = nil

-- Tọa độ Far Lands (15 triệu studs)
local FAR_POS = Vector3.new(15000000, 5000, 15000000)

-- Tự động dọn GUI cũ
if CoreGui:FindFirstChild("SKIBIDI_GUI") then CoreGui.SKIBIDI_GUI:Destroy() end
if LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("SKIBIDI_GUI") then LocalPlayer.PlayerGui.SKIBIDI_GUI:Destroy() end

-- Tạo GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SKIBIDI_GUI"
ScreenGui.ResetOnSpawn = false

local success = pcall(function() ScreenGui.Parent = CoreGui end)
if not success then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- Frame chính
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.05, 0, 0.4, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.ClipsDescendants = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 😎
UICorner.Parent = Frame

-- Title (Đã tăng TextSize lên 16)
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 0, 30)
Title.Position = UDim2.new(0, 30, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "SKIBIDI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 16
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Center
Title.Parent = Frame

-- Nút Thu Gọn (-)
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 20, 0, 20)
ToggleBtn.Position = UDim2.new(1, -50, 0, 5)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ToggleBtn.Text = "-"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.TextSize = 14
ToggleBtn.Parent = Frame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 4)
ToggleCorner.Parent = ToggleBtn

-- Nút Đóng (X)
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Position = UDim2.new(1, -25, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 12
CloseBtn.Parent = Frame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseBtn

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, 0, 1, -30)
ContentFrame.Position = UDim2.new(0, 0, 0, 30)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = Frame

-- Nút 1: TP to Farland
local BtnFar = Instance.new("TextButton")
BtnFar.Size = UDim2.new(0.9, 0, 0, 28)
BtnFar.Position = UDim2.new(0.05, 0, 0.04, 0)
BtnFar.BackgroundColor3 = Color3.fromRGB(180, 40, 40)
BtnFar.Text = "TP to Farland"
BtnFar.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnFar.Font = Enum.Font.SourceSansBold
BtnFar.TextSize = 13
BtnFar.Parent = ContentFrame

local Corner1 = Instance.new("UICorner")
Corner1.CornerRadius = UDim.new(0, 6)
Corner1.Parent = BtnFar

-- Nút 2: Return to Old Pos
local BtnBack = Instance.new("TextButton")
BtnBack.Size = UDim2.new(0.9, 0, 0, 28)
BtnBack.Position = UDim2.new(0.05, 0, 0.34, 0)
BtnBack.BackgroundColor3 = Color3.fromRGB(40, 140, 40)
BtnBack.Text = "Return to Old Pos"
BtnBack.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnBack.Font = Enum.Font.SourceSansBold
BtnBack.TextSize = 13
BtnBack.Parent = ContentFrame

local Corner2 = Instance.new("UICorner")
Corner2.CornerRadius = UDim.new(0, 6)
Corner2.Parent = BtnBack

---------------------------------------------------------
-- CÔNG TẮC CLEAR INVIS WALLS
---------------------------------------------------------

local ToggleRow = Instance.new("Frame")
ToggleRow.Size = UDim2.new(0.9, 0, 0, 30)
ToggleRow.Position = UDim2.new(0.05, 0, 0.66, 0)
ToggleRow.BackgroundTransparency = 1
ToggleRow.Parent = ContentFrame

local ToggleLabel = Instance.new("TextLabel")
ToggleLabel.Size = UDim2.new(0.68, -10, 1, 0)
ToggleLabel.Position = UDim2.new(0, 10, 0, 0)
ToggleLabel.BackgroundTransparency = 1
ToggleLabel.Text = "Clear Invis Walls:"
ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleLabel.Font = Enum.Font.SourceSansBold
ToggleLabel.TextScaled = true
ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
ToggleLabel.Parent = ToggleRow

local TextSizeConstraint = Instance.new("UITextSizeConstraint")
TextSizeConstraint.MaxTextSize = 15
TextSizeConstraint.MinTextSize = 12
TextSizeConstraint.Parent = ToggleLabel

-- Switch Background
local SwitchBg = Instance.new("TextButton")
SwitchBg.Size = UDim2.new(0, 44, 0, 22)
SwitchBg.Position = UDim2.new(1, -44, 0.5, -11)
SwitchBg.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
SwitchBg.Text = ""
SwitchBg.AutoButtonColor = false
SwitchBg.Parent = ToggleRow

local SwitchBgCorner = Instance.new("UICorner")
SwitchBgCorner.CornerRadius = UDim.new(0, 11)
SwitchBgCorner.Parent = SwitchBg

-- Switch Knob (Viên tròn)
local SwitchKnob = Instance.new("Frame")
SwitchKnob.Size = UDim2.new(0, 18, 0, 18)
SwitchKnob.Position = UDim2.new(0, 2, 0.5, -9)
SwitchKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SwitchKnob.BorderSizePixel = 0
SwitchKnob.Parent = SwitchBg

local SwitchKnobCorner = Instance.new("UICorner")
SwitchKnobCorner.CornerRadius = UDim.new(0, 9)
SwitchKnobCorner.Parent = SwitchKnob

---------------------------------------------------------
-- LOGIC CLEAR INVIS WALLS
---------------------------------------------------------

local isWallCleared = false
local modifiedParts = {}

local function processWalls(enableClear)
    local map = Workspace:FindFirstChild("Map")
    local invisFolder = (map and map:FindFirstChild("InvisParts")) or Workspace:FindFirstChild("InvisParts")
    
    if invisFolder then
        for _, part in ipairs(invisFolder:GetDescendants()) do
            if part:IsA("BasePart") then
                if not part:IsA("SpawnLocation") and not string.find(part.Name:lower(), "spawn") then
                    if enableClear then
                        if modifiedParts[part] == nil then
                            modifiedParts[part] = part.CanCollide
                        end
                        part.CanCollide = false
                    else
                        if modifiedParts[part] ~= nil then
                            part.CanCollide = modifiedParts[part]
                        end
                    end
                end
            end
        end
    end
    
    if not enableClear then
        table.clear(modifiedParts)
    end
end

-- Tự động quét khi Map mới load sang Round tiếp theo
local mapConnection = Workspace.DescendantAdded:Connect(function(descendant)
    if isWallCleared and (descendant.Name == "InvisParts" or descendant.Name == "Barrier") then
        task.wait(0.5)
        processWalls(true)
    end
end)

-- Sự kiện gạt công tắc
SwitchBg.MouseButton1Click:Connect(function()
    isWallCleared = not isWallCleared
    
    if isWallCleared then
        SwitchBg.BackgroundColor3 = Color3.fromRGB(60, 170, 240)
        SwitchKnob:TweenPosition(UDim2.new(1, -20, 0.5, -9), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
        processWalls(true)
    else
        SwitchBg.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        SwitchKnob:TweenPosition(UDim2.new(0, 2, 0.5, -9), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true)
        processWalls(false)
    end
end)

-- Thu Gọn / Mở Rộng
local isMinimized = false
ToggleBtn.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        ContentFrame.Visible = false
        Frame.Size = UDim2.new(0, 200, 0, 30)
        ToggleBtn.Text = "+"
    else
        ContentFrame.Visible = true
        Frame.Size = UDim2.new(0, 200, 0, 150)
        ToggleBtn.Text = "-"
    end
end)

-- Đóng Menu
CloseBtn.MouseButton1Click:Connect(function()
    if mapConnection then mapConnection:Disconnect() end
    if isWallCleared then processWalls(false) end
    ScreenGui:Destroy()
end)

-- Tạo sàn đứng Far Lands
local function createPlatform(pos)
    local platName = "FarLandsPlatform"
    if not Workspace:FindFirstChild(platName) then
        local platform = Instance.new("Part")
        platform.Name = platName
        platform.Size = Vector3.new(200, 3, 200)
        platform.Position = pos - Vector3.new(0, 3, 0)
        platform.Anchored = true
        platform.Parent = Workspace
    end
end

-- Teleport 15M
BtnFar.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local currentPos = char.HumanoidRootPart.Position
        if currentPos.Magnitude < 1000000 then
            lastPosition = char.HumanoidRootPart.CFrame
        end
        createPlatform(FAR_POS)
        char.HumanoidRootPart.CFrame = CFrame.new(FAR_POS)
    end
end)

-- Quay về vị trí cũ
BtnBack.MouseButton1Click:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        if lastPosition then
            char.HumanoidRootPart.CFrame = lastPosition
        else
            warn("No position saved!")
        end
    end
end)
